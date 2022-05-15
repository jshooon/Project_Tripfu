package com.tripfu.dao.inquiry;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripfu.mapper.inquiry.InquiryMapper;
import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.inquiry.PagingVO;

@Repository
public class InquiryDAO {

	@Autowired
	private InquiryMapper im;
	
	// 문의내용 저장하기
	public boolean iqSave(InquiryVO inquiry) {
		return im.iqSave(inquiry) > 0;
	}

	// 문의 파일정보 저장
	public boolean iqFileInfo(Map<String, Object> map) {
		return im.iqFileInfo(map) > 0;
	}

	// 문의리스트 가져오기
	public List<InquiryVO> list(int mnum) {
		return im.list(mnum);
	}
	
	// 문의리스트 가져오기2
	public List<Map<String, Object>> iqList(Map<String, Object> map) {
		return im.iqList(map);
	}
	
	// 문의상세내용 가져오기
	public List<Map<String, Object>> iqDetail(int num) {
		return im.iqDetail(num);
	}

	// 문의 첨부파일이름 가져오기
	public String getFilename(int num) {
		return im.getFilename(num);
	}

	// 문의 첨부파일 삭제
	public boolean deleteFileInfo(int num) {
		return im.deleteFileInfo(num) > 0;
	}

	// 문의내용 업데이트
	public boolean iqUpdate(InquiryVO inquiry) {
		return im.iqUpdate(inquiry) > 0;
	}

	// 문의내용 삭제하기
	public boolean iqDelete(int num) {
		return im.iqDelete(num) > 0;
	}

	// 문의내역 건수 가져오기
	public int getInquiryCount(int mnum) {
		return im.getInquiryCount(mnum);
	}

	// 답변 가져오기
	public List<CommentVO> getComment(int num) {
		return im.getComment(num);
	}
	
}
