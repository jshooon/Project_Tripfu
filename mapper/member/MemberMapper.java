package com.tripfu.mapper.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tripfu.vo.member.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 회원가입 회원정보 전달.
	int signup(MemberVO member);

	// 회원탈퇴 회원번호 전달.
	int secession(int mnum);
	
	// 로그인 하기 위한 회원정보 받기.
	List<Map<String, Object>> login(MemberVO member);

	// 이메일 중복체크 조회 비교
	String eCheck(String email);
	
	// 휴대폰 중복체크 조회 비교
	String pCheck(String phone);

	// 회원정보 조회
	MemberVO memberInfo(int mnum);

	// 회원정보 수정
	int memberEdit(MemberVO member);

	// 날씨 정보 가져오기위한 영문 도시이름 가져오기
	String getename(String wsearch);

}
