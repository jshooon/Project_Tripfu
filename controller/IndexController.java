package com.tripfu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.tripfu.svc.member.MemberSVC;
import com.tripfu.svc.product.ProductSVC;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;

@Controller
@RequestMapping("/tripfu")//집 localhost:8080/tripfu
@SessionAttributes({"email", "name", "mnum", "pcart", "fcart"})// 학원 localhost/tripfu
public class IndexController {
	
	@Autowired
	private MemberSVC msvc;
	
	@Autowired	
	private ProductSVC psvc;
	
	
	// index홈페이지 접속
	@GetMapping("")
	public String index(@SessionAttribute(required=false) List<Integer> pcart, 
						@SessionAttribute(required=false) List<Integer> fcart, Model m) {
		// cart를 생성하여 model에 저장하면 @SessionAttributes("cart")에 "cart" 란 이름을
		// 지정했기 때문에 HttpSession에도 자동으로 저장된다
		if(pcart==null && fcart==null) {// 아직 세션에 cart 가 생성되어 있지 않은 경우에만 cart를 생성한다
			m.addAttribute("pcart", new ArrayList<Integer>());
			m.addAttribute("fcart", new ArrayList<Integer>());			
		}
		
		List<PProductVO> Plist = psvc.getPlist();
		List<FProductVO> Flist = psvc.getFlist();		
		m.addAttribute("Plist", Plist);
		m.addAttribute("Flist", Flist);
		return "index/index";
	}
	
	// 회원가입 폼 페이지 접속
	@GetMapping("/signup")
	public String signupForm() {
		return "signup/signupForm";
	}
	
	// 회원가입 요청 값 보내기
	@PostMapping("/signup")
	@ResponseBody
	public Map<String, Boolean>	signup(MemberVO member){
		Map<String, Boolean> map = new HashMap<>();
		map.put("signup", msvc.signup(member));
		return map;
	}
	
	// 회원탈퇴 요청 값 보내기
	@PostMapping("/secession")
	@ResponseBody
	public Map<String, Boolean>	secession(@RequestParam("mnum") int mnum, SessionStatus status, Model m){		
		Map<String, Boolean> map = new HashMap<>();
		map.put("secession", msvc.secession(mnum));
		return map;
	}
	
	// 이메일 중복체크 요청 값 보내기
	@PostMapping("/echeck")
	@ResponseBody
	public Map<String, Boolean> eCheck(@RequestParam("email") String email, Model m){
		Map<String, Boolean> map = new HashMap<>();
		map.put("echeck", msvc.eCheck(email));
		return map;
	}
	
	// 휴대폰 중복체크 요청 값 보내기
	@PostMapping("/pcheck")
	@ResponseBody
	public Map<String, Boolean> pCheck(@RequestParam("phone") String phone, Model m){
		Map<String, Boolean> map = new HashMap<>();
		map.put("pcheck", msvc.pcheck(phone));
		return map;
	}
	
	// 로그인 폼 페이지 접속
	@GetMapping("/login")
	public String loginForm() {
		
		return "login/loginForm";
	}
	
	// 로그인 요청 값 보내기
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Object> login(MemberVO member, Model m){
		List<Map<String, Object>>list = msvc.login(member);
		String email = (String)list.get(0).get("email");
		String name = (String)list.get(0).get("name");
		int mnum = (int)list.get(0).get("mnum");
		boolean ok = false;
		if(list!=null) ok = true;
		if(ok) {
			m.addAttribute("email", email);
			m.addAttribute("name", name);
			m.addAttribute("mnum", mnum);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("ok", ok);
		return map;
	}
	
	// 로그아웃 요청 받고 인덱스 페이지
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/tripfu";
	}
	
	// 날씨 정보 가져오기위한 영문 도시이름 가져오기
	@GetMapping("/searchWeather")
	public String searchWeather(@RequestParam(required = false) String wsearch, Model m) {
		String ws = msvc.getename(wsearch);
		m.addAttribute("ws", ws);
		return "/index/search";
	}
}
