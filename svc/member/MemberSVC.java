package com.tripfu.svc.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tripfu.dao.inquiry.InquiryDAO;
import com.tripfu.dao.member.MemberDAO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.PProductVO;

@Service
public class MemberSVC {
	
	@Autowired
	private MemberDAO mdao;
	
	// 회원가입 회원정보 전달.
	public boolean signup(MemberVO member) {
		return mdao.signup(member);
	}
	
	// 회원탈퇴 회원번호 전달.
	public Boolean secession(int mnum) {
		return mdao.secession(mnum) > 0;
	}
	
	// 로그인 하기 위한 회원정보 받기.
	public List<Map<String, Object>> login(MemberVO member) {
		return mdao.login(member);
	}
	
	// 이메일 중복체크 조회 비교
	public boolean eCheck(String email) {
		return mdao.eCheck(email) == null;
	}
	
	// 휴대폰 중복체크 조회 비교
	public boolean pcheck(String phone) {
		return mdao.pCheck(phone) == null;
	}

	// 회원정보 조회
	public MemberVO memberInfo(int mnum) {
		return mdao.memberInfo(mnum);
	}

	// 회원정보 수정
	public boolean memberEdit(MemberVO member) {
		return mdao.memberEdit(member) > 0;
	}

	// 날씨 정보 가져오기위한 영문 도시이름 가져오기
	public String getename(String wsearch) {
		return mdao.getename(wsearch);
	}

}
