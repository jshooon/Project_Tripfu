package com.tripfu.mapper.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.product.ProductVO;

@Mapper
public interface ProductMapper {

	// 상품정보 가져오기
	List<Map<String, Object>> getProductInfo(int pnum);
	
	// 패키지 상품 상세정보 가져오기
	List<Map<String, Object>> getpProductInfo(int pnum);
	
	// 자유 상품 상세정보 가져오기
	List<Map<String, Object>> getfProductInfo(int pnum);

	// 상품검색정보 가져오기
	List<ProductVO> getSearchInfo(String pname);

	// 상품 인덱스 사진파일이름 가져오기
	List<Map<String, Object>> getList();
	
	// 패키지상품 인덱스 사진파일이름 가져오기
	List<Map<String, Object>> getPlist();

	// 자유 상품 인덱스 사진파일이름 가져오기
	List<Map<String, Object>> getFlist();

	// 패키지상품 검색정보 가져오기
	List<PProductVO> getpSearchInfo(String search);

	// 자유상품 검색정보 가져오기
	List<FProductVO> getfSearchInfo(String search);

	// 패키지 상품 정보 가져오기
	List<PProductVO> getPproducts();

	// 자유 상품 정보 가져오기
	List<FProductVO> getFproducts();

	// 패키지 상품 등록
	int addPproduct(PProductVO pproduct);

	// 찜 목록 패키지상품 정보 가져오기
	List<PProductVO> pcartList(List<Integer> pcart);

	// 찜 목록 자유상품 정보 가져오기
	List<FProductVO> fcartList(List<Integer> fcart);

}
