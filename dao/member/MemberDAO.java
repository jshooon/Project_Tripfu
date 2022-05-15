package com.tripfu.dao.member;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tripfu.mapper.member.MemberMapper;
import com.tripfu.vo.member.MemberVO;

@Component
public class MemberDAO {
	
	@Autowired
	private MemberMapper mm;
	
	// 회원가입 회원정보 전달.
	public boolean signup(MemberVO member) {
		return mm.signup(member) > 0;
	}
	
	// 회원탈퇴 회원번호 전달.
	public int secession(int mnum) {
		return mm.secession(mnum);
	}
	
	// 로그인 하기 위한 회원정보 받기.
	public List<Map<String, Object>> login(MemberVO member) {
		return mm.login(member);
	}

	// 이메일 중복체크 조회 비교
	public String eCheck(String email) {
		return mm.eCheck(email);
	}
	
	// 휴대폰 중복체크 조회 비교
	public String pCheck(String phone) {
		return mm.pCheck(phone);
	}

	// 회원정보 조회
	public MemberVO memberInfo(int mnum) {
		return mm.memberInfo(mnum);
	}

	// 회원정보 수정
	public int memberEdit(MemberVO member) {
		return mm.memberEdit(member);
	}

	// 날씨 정보 가져오기위한 영문 도시이름 가져오기
	public String getename(String wsearch) {
		return mm.getename(wsearch);
	}

}
