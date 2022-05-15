package com.tripfu.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tripfu.vo.admin.AdminVO;
import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.reservation.ReservationVO;

@Mapper
public interface AdminMapper {

	// 로그인 하기 위한 관리자정보 받기.
	AdminVO login(AdminVO admin);
	
	// 패키지 상품 등록
	int addPproduct(PProductVO pproduct);

	// 자유 상품 등록
	int addFproduct(FProductVO fproduct);
	
	// 패키지 상품 업데이트할 정보 가져오기
	PProductVO pedit(int pnum);
	
	// 자유 상품 업데이트할 정보 가져오기
	FProductVO fedit(int pnum);
	
	// 패키지 상품 업데이트
	int pupdate(PProductVO pproduct);
	
	// 자유 상품 업데이트
	int fupdate(FProductVO fproduct);
	
	// 패키지 상품 삭제
	int pdelete(int pnum);

	// 자유 상품 삭제
	int fdelete(int pnum);

	// 회원정보 가져오기
	List<MemberVO> getmlist();

	// 회원정보 삭제하기
	int mdelete(int mnum);

	// 회원 예약정보 목록 불러오기
	List<ReservationVO> getmrList();

	// 회원 문의내역 가져오기
	List<InquiryVO> getmiqList();

	// 회원 문의내용 댓글달기
	int getComment(CommentVO comments);

	// 회원 문의내용 수정
	int cupdate(CommentVO com);

	// 회원 문의답변 삭제
	int cDelete(int num);

}
