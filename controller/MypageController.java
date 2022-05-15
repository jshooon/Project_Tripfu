package com.tripfu.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.tripfu.svc.inquiry.InquirySVC;
import com.tripfu.svc.member.MemberSVC;
import com.tripfu.svc.product.ProductSVC;
import com.tripfu.svc.reservation.ReservationSVC;
import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.reservation.ReservationVO;

@Controller
@SessionAttributes("email")
@RequestMapping("/tripfu/mypage")
public class MypageController {
	
	@Autowired
	private MemberSVC msvc;
	
	@Autowired
	private ProductSVC psvc;
	
	@Autowired
	private InquirySVC isvc;
	
	@Autowired
	private ReservationSVC rsvc;
	
	@Autowired
	ResourceLoader resourceLoader;
	

	@GetMapping("")
	public String mypage(@SessionAttribute("mnum") int mnum, 
						 @SessionAttribute("pcart") List<Integer> pcart,
						 @SessionAttribute("fcart") List<Integer> fcart, Model m) {
		int cCnt = psvc.cartCount(pcart, fcart);
		int rCnt = rsvc.getReservationCount(mnum);
		int iCnt = isvc.getInquiryCount(mnum);
		m.addAttribute("cCnt", cCnt);
		m.addAttribute("rCnt", rCnt);
		m.addAttribute("iCnt", iCnt);
		return "mypage/mypage";
	}
	
	// 회원정보 페이지
	@GetMapping("/memberInfo")
	public String memberInfo(@RequestParam(required = false) int mnum, Model m){
		m.addAttribute("memberInfo", msvc.memberInfo(mnum));
		return "mypage/memberInfo";
	}
	
	// 회원정보 수정 요청 값 보내기
	@PostMapping("/memberEdit")
	@ResponseBody
	public Map<String, Boolean> memberEdit(MemberVO member){
		boolean uadated =  msvc.memberEdit(member);
		Map<String, Boolean> map = new HashMap<>();
		map.put("updated", uadated);
		return map;
	}
	
	// 문의등록 폼 페이지
	@GetMapping("/iqForm")
	public String iqForm() {
		return "/mypage/inquiryform";
	}
	
	// 문의내용 값 받고 DB등록 후 결과 값 보내기
	@Transactional(rollbackFor={Exception.class})
	@PostMapping("/iqSave")
	@ResponseBody
	public Map<String, Boolean> iqSave(@RequestParam(required = false) MultipartFile[] iqfiles,
								HttpServletRequest request,
								InquiryVO inquiry){
		boolean iqSaved = isvc.iqSave(iqfiles, request, inquiry);
		Map<String, Boolean> map = new HashMap<>();
		map.put("iqSaved", iqSaved);
		return map;
	}
	
	// 문의내용 리스트 페이지
	@GetMapping("/iqList/{pageNum}")
	public String iqList(@PathVariable(required = false) int pageNum,
						 @RequestParam(required = false) int mnum,
						 @SessionAttribute(value="email", required=false) String email, Model m) {
		if(email==null) {
			return "redirect:/tripfu";
		}
		PageInfo<InquiryVO> pageInfo = new PageInfo<>(isvc.iqList(pageNum, mnum));
		m.addAttribute("mnum", mnum);
		m.addAttribute("pageInfo", pageInfo);		
		return "/mypage/iqList";
	}
	
	// 문의내용 상세보기 페이지
	@GetMapping("/iqDetail")
	public String iqDetail(@RequestParam int num, Model m) {
		InquiryVO detail = isvc.iqDetail(num);
		m.addAttribute("detail", detail);
		List<CommentVO> cm = isvc.getCommnet(num);
		m.addAttribute("cm", cm);
		return "mypage/iqDetail";
	}
	
	// 문의내용 올린 파일 다운로드 기능
	@GetMapping("/file/download/{num}")
	public ResponseEntity<Resource> fileDownload(@PathVariable int num,
			HttpServletRequest request)
	{
		// attach 테이블에서 att_num 번호를 이용하여 파일명을 구하여 위의 방법을 사용
		String filename = isvc.getFilename(num);
		Resource resource = (Resource)resourceLoader.getResource("WEB-INF/inquiry/"+filename);
		//System.out.println("파일명:"+resource.getFilename());
	    String contentType = null;
	    try {
	        contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	
	    if(contentType == null) {
	        contentType = "application/octet-stream";
	    }
	
	    return ResponseEntity.ok()
	            .contentType(MediaType.parseMediaType(contentType))
	            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
	            .body(resource);
	}
	
	// 문의내용 첨부파일 삭제.
	@PostMapping("/file/iqDelete")
	@ResponseBody
	public Map<String, Boolean> delete_file(@RequestParam int num){
		boolean deleted = isvc.delete_file(num, resourceLoader);
		Map<String, Boolean> map =new HashMap<>();
		map.put("deleted", deleted);
	return map;
	}

	// 문의내용 삭제
	@PostMapping("/iqDelete")
	@ResponseBody
	public Map<String, Boolean> iqDelete(@RequestParam int num) {
		boolean deleted = isvc.iqDelete(num);
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	// 문의내용 수정 폼 페이지
	@GetMapping("/iqEdit")
	public String iqEdit(@RequestParam int num, Model m) {
		InquiryVO detail = isvc.iqDetail(num);
		m.addAttribute("detail", detail);
		return "mypage/iqEdit";
	}
	
	// 문의내용 수정
	@PostMapping("/iqUpdate")
	@ResponseBody
	public Map<String, Boolean> update(@RequestParam(required = false) MultipartFile[] iqfiles,
							HttpServletRequest request, InquiryVO inquiry){
		Boolean iqupdated = isvc.iqUpdate(iqfiles, request, inquiry);
		
		Map<String, Boolean> map = new HashMap<>();
		map.put("iqupdated", iqupdated);
		return map;
	}
	
	// 예약현황 리스트 페이지
	@GetMapping("/reservationList/{pageNum}")
	public String reservationList(@PathVariable(required = false) int pageNum, 
								  @RequestParam(required = false) int mnum,
								  @SessionAttribute(value="email", required=false) String email, Model m) {
		if(email==null) {
			return "redirect:/tripfu";
		}
		rsvc.reservationList(pageNum, mnum);
		PageInfo<ReservationVO> rList = new PageInfo<>(rsvc.reservationList(pageNum, mnum));
		m.addAttribute("rList", rList);
		return "/mypage/reservationList";
	}
	
	// 예약현황 상세보기 페이지
	@GetMapping("/rDetail")
	public String rDetail(@RequestParam(required = false) int rnum, Model m) {
		ReservationVO rDetail = rsvc.rDetail(rnum);
		m.addAttribute("rDetail", rDetail);
		return "/mypage/rDetail";
	}
	
	// 상품 찜 목록 가져오기
	@GetMapping("/cartList")
	public String cart(@SessionAttribute("pcart") List<Integer> pcart,
						@SessionAttribute("fcart") List<Integer> fcart, Model m) {
		List<PProductVO> Plist = psvc.pcartList(pcart);
		List<FProductVO> Flist = psvc.fcartList(fcart);
		m.addAttribute("Plist", Plist);
		m.addAttribute("Flist", Flist);
		return "/mypage/cartList";
	}
	
}