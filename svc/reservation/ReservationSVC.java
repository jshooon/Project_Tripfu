package com.tripfu.svc.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tripfu.dao.reservation.ReservationDAO;
import com.tripfu.vo.reservation.OrderVO;
import com.tripfu.vo.reservation.ReservationVO;

@Service
public class ReservationSVC {

	 @Autowired
	 private ReservationDAO dao;
	
	 // 예약정보 전달.
	 @Transactional(rollbackFor={Exception.class})
	 public boolean Reservation(ReservationVO reservation) {	
		return dao.rSave(reservation);
	}

	 // 예약정보리스트 가져오기.
	 public List<ReservationVO> reservationList(int pageNum, int mnum) {
		 PageHelper.startPage(pageNum,3);
		 List<ReservationVO> list = dao.reservationList(mnum);
		 return list;
	 }
	 
	 // 예약상세정보 가져오기.
	 public ReservationVO rDetail(int rnum) {
		List<ReservationVO> list = dao.rDetail(rnum);
		
		ReservationVO reservation = new ReservationVO();
		reservation.setRnum(list.get(0).getRnum());
		reservation.setRtype(list.get(0).getRtype());
		reservation.setRpname(list.get(0).getRpname());
		reservation.setRname(list.get(0).getRname());
		reservation.setNump(list.get(0).getNump());
		reservation.setRprice(list.get(0).getRprice());
		reservation.setRdate(list.get(0).getRdate());

		return reservation;
	}
	 
	 // 예약취소하기.
	 public Boolean rCancel(int rnum) {
		return dao.rCancel(rnum);
	}
	 
	 // 예약가능인원 가져오기.
	 public int getaNump(int pnum) {
		return dao.getaNump(pnum);
	}

	// 예약목록 건수 가져오기
	public int getReservationCount(int mnum) {
		return dao.getReservationCount(mnum);
	}

}
