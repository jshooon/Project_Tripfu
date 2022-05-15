package com.tripfu.svc.inquiry;

import java.awt.color.CMMException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.tripfu.dao.inquiry.InquiryDAO;
import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.inquiry.IqFileInfoVO;

@Service
public class InquirySVC {

	@Autowired
	private InquiryDAO idao;
	
	// 문의내용 저장
	public boolean iqSave(InquiryVO inquiry) {
		return idao.iqSave(inquiry);
	}
	
	// 문의내용 첨부파일 저장
	public boolean iqSave(MultipartFile[] iqfiles, HttpServletRequest request, InquiryVO inquiry) {
		boolean iqSaved = iqSave(inquiry);
		int iqnum = inquiry.getNum();
		
		if(!iqSaved) {
			System.out.println("글 저장 실패!");
			return false;
		}
		
		ServletContext context = request.getServletContext();
		String savePath = context.getRealPath("/WEB-INF/inquiry");
		
		int fCnt = iqfiles.length;
		int sCnt = 0;
		
		if(!iqfiles[0].isEmpty()) {
			try {
				for(int i = 0; i < iqfiles.length; i++) {
					
					String fname = iqfiles[i].getOriginalFilename();

				      String ext = fname.split("\\.")[1];
				      String newFilename = System.nanoTime()+"."+ext;
						iqfiles[i].transferTo(new File(savePath + "/" + newFilename));
						Map<String, Object> map = new HashMap<>();
						map.put("iqnum", iqnum);
						map.put("fname", newFilename);
						map.put("fsize", iqfiles[i].getSize());
						boolean fSaved = idao.iqFileInfo(map);
						if(fSaved) sCnt++;
				}
				return fCnt == sCnt ? true : false;
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return iqSaved;
	}
		
	// 문의리스트 가져오기
	public List<InquiryVO> iqList(int pageNum, int mnum) {
		PageHelper.startPage(pageNum,3);
		List<InquiryVO> iqlist = idao.list(mnum);
		return iqlist;
	}
	
	// 문의상세내용 가져오기
	public InquiryVO iqDetail(int num) {
		List<Map<String, Object>> list = idao.iqDetail(num);
		InquiryVO inquiry = new InquiryVO();
		int size = list.size();
		for(int i = 0; i < size; i++) {
			
			Map<String, Object> map = list.get(i);
			
			if(i==0) {
				inquiry.setNum((int)list.get(i).get("num"));
				inquiry.setIqauthor((String)list.get(i).get("iqauthor"));
				inquiry.setIqtitle((String)list.get(i).get("iqtitle"));
				inquiry.setIqcontents((String)list.get(i).get("iqcontents"));
				inquiry.setIqtype((String)list.get(i).get("iqtype"));
				inquiry.setIqdate((java.sql.Date)list.get(i).get("iqdate"));
			}
			
			Object obj = map.get("fname");
			
			if(obj != null) {
				
				IqFileInfoVO iqf = new IqFileInfoVO();
				iqf.setFnum((int)list.get(i).get("fnum"));
				iqf.setFname((String)list.get(i).get("fname"));
				iqf.setFsize((String)list.get(i).get("fsize"));
				inquiry.iqfileinfo.add(iqf);
			}
		}
		return inquiry;
	}

	// 문의 첨부파일이름 가져오기
	public String getFilename(int num) {
		return idao.getFilename(num);
	}

	// 문의 첨부파일 삭제
	public boolean delete_file(int num, ResourceLoader resourceLoader) {
		String fname = getFilename(num);
		Resource resource = (Resource)resourceLoader.getResource("/WEB-INF/inquiry/" + fname);
		boolean deleted = false;
		try {
			String abPath = resource.getFile().getAbsolutePath();
			File fileDel = new File(abPath);
			deleted = fileDel.exists() ? fileDel.delete() : false;
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(deleted) {
			return idao.deleteFileInfo(num);
		}
		return false;
	}

	//문의내용 수정하고 업데이트
	public Boolean iqUpdate(MultipartFile[] iqfiles, HttpServletRequest request, InquiryVO inquiry) {
		boolean updated = idao.iqUpdate(inquiry);
		
		ServletContext context = request.getServletContext();
		String savePath = context.getRealPath("/WEB-INF/inquiry");
		
		int fCnt = iqfiles.length;
		int sCnt = 0;
		
		if(!iqfiles[0].isEmpty()) {
			try {
				for(int i = 0; i < iqfiles.length; i++) {
					
					String fname = iqfiles[i].getOriginalFilename();
					
				      String ext = fname.split("\\.")[1];
				      String newFilename = System.nanoTime()+"."+ext;
						iqfiles[i].transferTo(new File(savePath + "/" + newFilename));
						Map<String, Object> map = new HashMap<>();
						map.put("iqnum", inquiry.getNum());
						map.put("fname", newFilename);
						map.put("fsize", iqfiles[i].getSize());
						boolean fSaved = idao.iqFileInfo(map);
						if(fSaved) sCnt++;
				}
				return fCnt == sCnt ? true : false;
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return updated;
	}

	// 문의내용 삭제하기
	public boolean iqDelete(int num) {
		return idao.iqDelete(num);
	}

	// 문의내역 건수 가져오기
	public int getInquiryCount(int mnum) {
		return idao.getInquiryCount(mnum);
	}

	// 답변 가져오기
	public List<CommentVO> getCommnet(int num) {
		List<CommentVO> comments = idao.getComment(num);
		return comments;
	}
}