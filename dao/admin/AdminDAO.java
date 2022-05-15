package com.tripfu.dao.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripfu.mapper.admin.AdminMapper;
import com.tripfu.vo.admin.AdminVO;
import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.reservation.ReservationVO;

@Repository
public class AdminDAO {

	@Autowired
	private AdminMapper am;

	public AdminVO login(AdminVO admin) {
		return am.login(admin);
	}
	
	// 패키지상품 등록
	public int addPproduct(PProductVO pproduct) {
		return am.addPproduct(pproduct);
	}

	// 자유상품 등록
	public int addFproduct(FProductVO fproduct) {
		return am.addFproduct(fproduct);
	}
	
	// 패키지 상품 업데이트할 정보 가져오기
	public PProductVO pedit(int pnum) {
		return am.pedit(pnum);
	}
	
	// 자유 상품 업데이트할 정보 가져오기
	public FProductVO fedit(int pnum) {
		return am.fedit(pnum);
	}
	
	// 패키지상품 업데이트
	public int pupdate(PProductVO pproduct) {
		return am.pupdate(pproduct);
	}
	
	// 자유상품 업데이트
	public int fupdate(FProductVO fproduct) {
		return am.fupdate(fproduct);
	}
	
	// 패키지상품 삭제
	public int pdelete(int pnum) {
		return am.pdelete(pnum);
	}

	// 자유상품 삭제
	public int fdelete(int pnum) {
		return am.fdelete(pnum);
	}

	// 회원정보 가져오기
	public List<MemberVO> getmlist() {
		return am.getmlist();
	}

	// 회원정보 삭제하기
	public int mdelete(int mnum) {
		return am.mdelete(mnum);
	}

	// 회원 예약정보 목록 불러오기
	public List<ReservationVO> getmrList() {
		return am.getmrList();
	}

	// 회원 문의내역 가져오기
	public List<InquiryVO> getmiqList() {
		return am.getmiqList();
	}

	// 회원 문의내용 댓글달기
	public boolean getComment(CommentVO comments) {
		return am.getComment(comments) > 0;
	}

	// 회원 문의내용 수정
	public boolean cupdate(CommentVO com) {
		return am.cupdate(com) > 0;
	}

	// 회원 문의답변 삭제
	public boolean cDelete(int num) {
		return am.cDelete(num) > 0;
	}

}
