package com.tripfu.mapper.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tripfu.vo.reservation.ReservationVO;

@Mapper
public interface ReservationMapper {
	
	// 예약정보 저장
	int rSave(ReservationVO reservation);
	
	// 예약정보리스트 가져오기
	List<ReservationVO> reservationList(int mnum);

	// 예약상세정보 가져오기
	List<ReservationVO> rDetail(int rnum);

	// 예약취소
	int rCancel(int rnum);

	// 예약 가능인원 가져오기
	int getaNump(int pnum);

	// 예약목록 건수 가져오기
	int getReservationCount(int mnum);

}
