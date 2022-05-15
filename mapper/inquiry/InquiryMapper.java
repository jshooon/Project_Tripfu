package com.tripfu.mapper.inquiry;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tripfu.vo.admin.CommentVO;
import com.tripfu.vo.inquiry.InquiryVO;

@Mapper
public interface InquiryMapper {

	// 문의내용 저장
	int iqSave(InquiryVO inquiry);

	// 문의내용 첨부파일 저장
	int iqFileInfo(Map<String, Object> map);

	// 문의리스트 가져오기
	List<InquiryVO> list(int mnum);
	
	// 문의리스트 가져오기2
	List<Map<String, Object>> iqList(Map<String, Object> map);
	
	// 문의상세내용 가져오기
	List<Map<String, Object>> iqDetail(int num);

	// 문의 첨부파일 이름 가져오기
	String getFilename(int num);

	// 문의 첨부파일 삭제
	int deleteFileInfo(int num);

	// 문의내용 업데이트
	int iqUpdate(InquiryVO inquiry);

	// 문의내용 삭제
	int iqDelete(int num);

	// 문의내역 건수 가져오기
	int getInquiryCount(int mnum);

	// 답변 가져오기
	List<CommentVO> getComment(int num);
	
}
