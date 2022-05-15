package com.tripfu.dao.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tripfu.mapper.reservation.ReservationMapper;
import com.tripfu.vo.reservation.OrderVO;
import com.tripfu.vo.reservation.ReservationVO;

@Component
public class ReservationDAO {

	@Autowired
	private ReservationMapper rm;
	
	// 예약정보 저장.
	public boolean rSave(ReservationVO reservation) {
		return rm.rSave(reservation) > 0;
	}
	
	// 예약정보 리스트 가져오기.
	public List<ReservationVO> reservationList(int mnum) {
		return rm.reservationList(mnum);
	}
	
	// 예약상세정보 가져오기.
	public List<ReservationVO> rDetail(int rnum) {
		return rm.rDetail(rnum);
	}

	// 예약취소 요청 전달.
	public Boolean rCancel(int rnum) {
		return rm.rCancel(rnum) > 0;
	}
	
	// 예약 가능인원 가져오기.
	public int getaNump(int pnum) {
		return rm.getaNump(pnum);
	}

	// 예약목록 건수 가져오기
	public int getReservationCount(int mnum) {
		return rm.getReservationCount(mnum);
	}

}
