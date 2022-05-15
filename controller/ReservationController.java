package com.tripfu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tripfu.svc.reservation.ReservationSVC;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.reservation.ReservationVO;

@Controller
@RequestMapping("/tripfu/rv")
//@SessionAttributes({"pdname", "pname", "rvnum", "rnum", "onum"})
public class ReservationController {

	@Autowired
	private ReservationSVC svc;
	
	// 상품 예약 등록 후 요청 값 post방식 전송. 만약 로그인상태가 아닐 시 로그인 페이지로 전환.
	@PostMapping("/pd")
	@ResponseBody
	public Map<String, Boolean> reservation(ReservationVO reservation, MemberVO member, Model m){
		int s = reservation.getRprice();
		Map<String, Boolean> map = new HashMap<>();
		if(member.getEmail().equals(null) || member.getEmail().equals("")) {
			map.put("no", false);
			return map;
		} else {
			boolean ok = svc.Reservation(reservation);
			map.put("ok", ok);
			return map;		
		}
	}
	
	// 상품 취소 요청 값 받고 DB삭제 후 결과 값 post방식 전송.
	@PostMapping("/rCancel")
	@ResponseBody
	public Map<String, Boolean> rCancel(@RequestParam(required = false) int rnum){
		boolean rCancel = svc.rCancel(rnum);
		Map<String, Boolean> map = new HashMap<>();
		map.put("rCancel", rCancel);
		return map;
	}
}
