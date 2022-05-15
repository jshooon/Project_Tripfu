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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.github.pagehelper.PageInfo;
import com.tripfu.svc.admin.AdminSVC;
import com.tripfu.svc.inquiry.InquirySVC;
import com.tripfu.svc.product.ProductSVC;
import com.tripfu.svc.reservation.ReservationSVC;
import com.tripfu.vo.admin.AdminVO;
import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.reservation.ReservationVO;

@Controller
@RequestMapping("/tripfu/admin")
@SessionAttributes({"id", "name"})
public class AdminController {

	@Autowired
	private ProductSVC psvc;
	
	@Autowired
	private AdminSVC asvc;
	
	@Autowired
	private ReservationSVC rsvc;
	
	@Autowired 
	private InquirySVC isvc;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	// admin index홈페이지 접속
	@GetMapping("")
	public String adminIndex(Model m, @SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		List<PProductVO> Plist = psvc.getPlist();
		List<FProductVO> Flist = psvc.getFlist();		
		m.addAttribute("Plist", Plist);
		m.addAttribute("Flist", Flist);
		return "admin/index";
	}
	
	// 로그인 폼 페이지 접속
	@GetMapping("/login")
	public String loginForm() {
		return "/admin/loginForm";
	}
	
	// 로그인 요청 값 보내기
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Object> login(AdminVO admin, Model m){
		AdminVO ad = asvc.login(admin);
		String id = ad.getId();
		String name = ad.getName();
		boolean ok = false;
		if(ad!=null) ok = true;
		if(ok) {
			m.addAttribute("id", id);
			m.addAttribute("name", name);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("ok", ok);
		return map;
	}
	
	// 로그아웃 요청 받고 인덱스 페이지
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/tripfu/admin";
	}
	
	// 패키지 상품등록 페이지 접속
	@GetMapping("/addPproduct")
	public String pProductForm(@SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		return "/admin/addp";
	}
	
	// 패키지 상품등록
	@PostMapping("/addPproduct")
	@ResponseBody
	public Map<String, Boolean> addPproduct(PProductVO pproduct){
		boolean ok = asvc.addPproduct(pproduct);
		Map<String, Boolean> map = new HashMap<>();
		map.put("ok", ok);
		return map;
	}
	
	// 자유 상품등록 페이지 접속
	@GetMapping("/addFproduct")
	public String fProductForm(@SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		return "/admin/addf";
	}
	
	// 자유 상품등록
	@PostMapping("/addFproduct")
	@ResponseBody
	public Map<String, Boolean> addFproduct(FProductVO fproduct){
		boolean ok = asvc.addFproduct(fproduct);
		Map<String, Boolean> map = new HashMap<>();
		map.put("ok", ok);
		return map;
	}
	
	// 패키지 상품 업데이트할 정보 가져오기
	@GetMapping("/pedit")
	public String pedit(@RequestParam int pnum, Model m) {
		PProductVO pproduct = asvc.pedit(pnum);
		m.addAttribute("pproduct", pproduct);
		return "/admin/pedit";
	}
	
	// 자유 상품 업데이트할 정보 가져오기
	@GetMapping("/fedit")
	public String fedit(@RequestParam int pnum, Model m) {
		FProductVO fproduct = asvc.fedit(pnum);
		m.addAttribute("fproduct", fproduct);
		return "/admin/fedit";
	}
	
	//패키지 상품 업데이트
	@PostMapping("/pupdate")
	@ResponseBody
	public Map<String, Boolean> pupdate(PProductVO pproduct){
		int s = pproduct.getPnump();
		boolean update = asvc.pupdate(pproduct);
		Map<String, Boolean> map = new HashMap<>();
		map.put("update", update);
		return map;
	}
	
	//자유 상품 업데이트
	@PostMapping("/fupdate")
	@ResponseBody
	public Map<String, Boolean> fupdate(FProductVO fproduct){
		boolean update = asvc.fupdate(fproduct);
		Map<String, Boolean> map = new HashMap<>();
		map.put("update", update);
		return map;
	}
	
	// 패키지 상품삭제
	@PostMapping("/pdelete")
	@ResponseBody
	public Map<String, Boolean> pdelete(@RequestParam("pnum") int pnum){
		boolean deleted = asvc.pdelete(pnum);
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	// 자유 상품삭제
	@PostMapping("/fdelete")
	@ResponseBody
	public Map<String, Boolean> fdelete(@RequestParam("pnum") int pnum){
		boolean deleted = asvc.fdelete(pnum);
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	// 상품검색
	@GetMapping("/pc")
	public String search(@RequestParam(required=false) String search, Model m){
		List<PProductVO> pInfo = psvc.getpSearchInfo(search);
		List<FProductVO> fInfo = psvc.getfSearchInfo(search);
		m.addAttribute("pInfo", pInfo);
		m.addAttribute("fInfo", fInfo);
		return "/admin/search";
	}
	
	// 패키지상품 검색
	@GetMapping("/pProduct")
	public String pProduct(Model m) {
		List<PProductVO> pproduct = psvc.getPproducts();
		m.addAttribute("pproduct",pproduct);
		return "/admin/search";
	}
	
	// 자유상품 검색
	@GetMapping("/fProduct")
	public String fProduct(Model m) {
		List<FProductVO> fproduct = psvc.getFproducts();
		m.addAttribute("fproduct",fproduct);
		return "/admin/search";
	}
	
	// 고객관리페이지 접속
	@GetMapping("/cmanagement")
	public String cmanagement(@SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		return "admin/cmanagement";
	}
	
	// 회원정보 불러오기
	@GetMapping("/mlist/{pageNum}")
	public String mlist(@PathVariable(required = false) int pageNum, Model m, @SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		PageInfo<MemberVO> mlist = new PageInfo<>(asvc.getmlist(pageNum));
		m.addAttribute("mlist", mlist);
		return "admin/memberList";
	}
	
	// 회원정보 삭제하기
	@PostMapping("mdelete")
	@ResponseBody
	public Map<String, Boolean> mdelete(@RequestParam int mnum){
		boolean mdelete = asvc.mdelete(mnum);
		Map<String, Boolean> map = new HashMap<>();
		map.put("mdelete", mdelete);
		return map;
	}
	
	// 회원 예약정보 목록 불러오기
	@GetMapping("/mreservationList/{pageNum}")
	public String mreservationList(@PathVariable(required = false) int pageNum, Model m, @SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		PageInfo<ReservationVO> rlist = new PageInfo<>(asvc.getmrList(pageNum));
		m.addAttribute("rlist", rlist);
		return "/admin/mreservationList";
	}
	
	// 회원 예약상세정보 불러오기
	@GetMapping("/mrDetail")
	public String mrDetail(@RequestParam(required = false) int rnum, Model m, @SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		ReservationVO mrDetail = rsvc.rDetail(rnum);
		m.addAttribute("mrDetail", mrDetail);
		return "/admin/mrDetail";
	}
	
	// 회원 예약상품 취소
	@PostMapping("/mrCancel")
	@ResponseBody
	public Map<String, Boolean> rCancel(@RequestParam(required = false) int rnum){
		boolean rCancel = rsvc.rCancel(rnum);
		Map<String, Boolean> map = new HashMap<>();
		map.put("rCancel", rCancel);
		return map;
	}
	
	// 회원 문의내역 가져오기
	@GetMapping("/miqList/{pageNum}")
	public String miqList(@PathVariable(required = false) int pageNum, Model m, @SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		PageInfo<InquiryVO>pageInfo = new PageInfo<>(asvc.miqList(pageNum));
		m.addAttribute("pageInfo", pageInfo);		
		return "/admin/miqList";
	}
	
	// 회원 문의내역 상세보기
	@GetMapping("/miqDetail")
	public String miqDetail(@RequestParam int num, Model m, @SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		InquiryVO detail = isvc.iqDetail(num);
		m.addAttribute("detail", detail);
		List<CommentVO> cm = isvc.getCommnet(num);
		m.addAttribute("cm", cm);
		return "admin/miqDetail";
	}

	// 회원 문의내용 올린 파일 다운로드 기능
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
	
	// 회원 문의내용 삭제
	@PostMapping("/miqDelete")
	@ResponseBody
	public Map<String, Boolean> iqDelete(@RequestParam int num) {
		boolean deleted = isvc.iqDelete(num);
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	// 회원 문의내용 댓글달기 
	@PostMapping("/comment")
	@ResponseBody
	public Map<String, Boolean> comment(CommentVO comments, Model m){
		boolean ok = asvc.getComment(comments);
		Map<String, Boolean> map = new HashMap<>();
		map.put("ok", ok);
		return map;
	}
	
	// 회원 문의답변 가져오기
	@GetMapping("cEdit")
	public String cEdit(@RequestParam int num, Model m,
						@SessionAttribute(value="id", required=false) String id) {
		if(id==null) {
			return "redirect:/tripfu/admin/login";
		}
		InquiryVO detail = isvc.iqDetail(num);
		m.addAttribute("detail", detail);
		List<CommentVO> cm = isvc.getCommnet(num);
		m.addAttribute("cm", cm);
		return "/admin/miqEdit";
	}
	
	// 회원 문의답변 수정
	@PostMapping("/cupdate")
	@ResponseBody
	public Map<String, Boolean> cupdate(@RequestParam(required=false) int num,
										@RequestParam(required=false) String comments){
		boolean cupdate = asvc.cupdate(num, comments);
		Map<String, Boolean> map = new HashMap<>();
		map.put("cupdate", cupdate);
		return map;
	}
	
	// 회원 문의답변 삭제
	@PostMapping("/cdelete")
	@ResponseBody
	public Map<String, Boolean> cDelete(@RequestParam int num) {
		boolean deleted = asvc.cDelete(num);
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
}
