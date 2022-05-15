package com.tripfu.svc.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.tripfu.dao.admin.AdminDAO;
import com.tripfu.vo.admin.AdminVO;
import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;
import com.tripfu.vo.member.MemberVO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.reservation.ReservationVO;

@Service
public class AdminSVC {

	@Autowired
	private AdminDAO dao;
	
	// 로그인 하기 위한 관리자 정보 받기.
	public AdminVO login(AdminVO admin) {
		return dao.login(admin);
	}
	
	// 패키지상품 등록
	public boolean addPproduct(PProductVO pproduct) {
		return dao.addPproduct(pproduct) > 0;
	}
	
	// 자유상품 등록
	public boolean addFproduct(FProductVO fproduct) {
		return dao.addFproduct(fproduct) > 0;
	}
	
	// 패키지 상품 업데이트할 정보 가져오기
	public PProductVO pedit(int pnum) {
		return dao.pedit(pnum);
	}
	
	// 자유 상품 업데이트할 정보 가져오기
	public FProductVO fedit(int pnum) {
		return dao.fedit(pnum);
	}
	
	// 패키지상품 업데이트
	public boolean pupdate(PProductVO pproduct) {
		return dao.pupdate(pproduct) > 0;
	}
	
	// 자유상품 업데이트
	public boolean fupdate(FProductVO fproduct) {
		return dao.fupdate(fproduct) > 0;
	}
	
	// 패키지상품 삭제
	public boolean pdelete(int pnum) {
		return dao.pdelete(pnum) > 0;
	}

	// 자유상품 삭제
	public boolean fdelete(int pnum) {
		return dao.fdelete(pnum) > 0;
	}

	// 회원정보 가져오기
	public List<MemberVO> getmlist(int pageNum) {
		PageHelper.startPage(pageNum,3);
		List<MemberVO> mlist = dao.getmlist();
		return mlist;
	}

	// 회원정보 삭제하기
	public boolean mdelete(int mnum) {
		return dao.mdelete(mnum) > 0;
	}

	// 회원 예약정보 목록 불러오기
	public List<ReservationVO> getmrList(int pageNum) {
		PageHelper.startPage(pageNum,3);
		List<ReservationVO> mrList = dao.getmrList();
		return mrList;
	}

	// 회원 문의내역 가져오기
	public List<InquiryVO> miqList(int pageNum) {
		PageHelper.startPage(pageNum,3);
		List<InquiryVO> miqlist = dao.getmiqList();
		return miqlist;
	}

	// 회원 문의내용 댓글달기
	public boolean getComment(CommentVO comments) {
		return dao.getComment(comments);
	}

	// 회원 문의내용 수정
	public boolean cupdate(int num, String comments) {
		CommentVO com = new CommentVO();
		com.setNum(num);
		com.setComments(comments);
		return dao.cupdate(com);
	}

	// 회원 문의답변 삭제
	public boolean cDelete(int num) {
		return dao.cDelete(num);
	}

}
