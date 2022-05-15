package com.tripfu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tripfu.svc.product.ProductSVC;
import com.tripfu.svc.reservation.ReservationSVC;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;

@Controller
@RequestMapping("/tripfu/pc")
public class ProductController {
	
	@Autowired
	private ProductSVC psvc;
	
	@Autowired
	private ReservationSVC rsvc;
	
	@Autowired
	ResourceLoader resourceLoader; //파일의 절대경로를 알기위한 클래스 변수.

	// 패키지상품상세정보 가져오기
	@GetMapping("/pdetail/{pnum}")
	public String pProduct(@PathVariable int pnum, Model m) {
		PProductVO pproduct = psvc.getpProductInfo(pnum);
		int aNump = rsvc.getaNump(pnum);
		m.addAttribute("pproduct",pproduct);
		m.addAttribute("aNump", aNump);
		return "/product/product";
	}
	
	// 자유상품상세정보 가져오기
	@GetMapping("/fdetail/{pnum}")
	public String fProduct(@PathVariable int pnum, Model m) {
		FProductVO fproduct = psvc.getfProductInfo(pnum);
		m.addAttribute("fproduct",fproduct);
		return "/product/product";
	}

	// 상품검색
	@GetMapping("")
	public String search(@RequestParam(required=false) String search, Model m){
		List<PProductVO> pInfo = psvc.getpSearchInfo(search);
		List<FProductVO> fInfo = psvc.getfSearchInfo(search);
		m.addAttribute("pInfo", pInfo);
		m.addAttribute("fInfo", fInfo);
		return "/index/search";
	}
	
	// 패키지상품 검색
	@GetMapping("/pProduct")
	public String pProduct(Model m) {
		List<PProductVO> pproduct = psvc.getPproducts();
		m.addAttribute("pproduct",pproduct);
		return "/index/search";
	}
	
	// 자유상품 검색
	@GetMapping("/fProduct")
	public String fProduct(Model m) {
		List<FProductVO> fproduct = psvc.getFproducts();
		m.addAttribute("fproduct",fproduct);
		return "/index/search";
	}
	
	// 패키지상품 찜 등록
	@PostMapping("/addpcart")
	@ResponseBody
	public Map<String, Boolean> addpcart(MemberVO member,
										@RequestParam("cpnum") int cpnum,
										@SessionAttribute("pcart") List<Integer> pcart, Model m){
		boolean save = false;
		Map<String, Boolean> map = new HashMap<>();
		if(pcart.contains(cpnum)) {
			save = false;
			map.put("save", save);
			return map;
		} else {			
			save = pcart.add(cpnum);
			map.put("save", save);
			return map;
		}
	}
	
	// 자유상품 찜 등록
	@PostMapping("/addfcart")
	@ResponseBody
	public Map<String, Boolean> addfcart(@RequestParam("cpnum") int cpnum,
										@SessionAttribute("fcart") List<Integer> fcart, Model m){
		boolean save = fcart.add(cpnum);
		Map<String, Boolean> map = new HashMap<>();
		if(fcart.contains(cpnum)) {
			save = false;
			map.put("save", save);
			return map;
		} else {			
			save = fcart.add(cpnum);
			map.put("save", save);
			return map;
		}
	}
	
}
