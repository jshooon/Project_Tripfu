package com.tripfu.dao.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripfu.mapper.product.ProductMapper;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.product.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private ProductMapper pm;
	
	// 상품정보 가져오기
	public List<Map<String, Object>> getProductInfo(int pnum) {
		return pm.getProductInfo(pnum);
	}
	
	// 패키지 상품 상세정보 가져오기
	public List<Map<String, Object>> getpProductInfo(int pnum) {
		return pm.getpProductInfo(pnum);
	}
	
	// 자유 상품 상세정보 가져오기
	public List<Map<String, Object>> getfProductInfo(int pnum) {
		return pm.getfProductInfo(pnum);
	}

	// 상품검색정보 가져오기
	public List<ProductVO> getSearchInfo(String search) {
		return pm.getSearchInfo(search);
	}

	// 상품 인덱스 사진파일이름 가져오기
	public List<Map<String, Object>> getList() {
		return pm.getList();
	}
	
	// 패키지 상품 인덱스 사진파일이름 가져오기
	public List<Map<String, Object>> getPlist() {
		return pm.getPlist();
	}

	// 자유 상품 인덱스 사진파일이름 가져오기
	public List<Map<String, Object>> getFlist() {
		return pm.getFlist();
	}

	// 패키지상품 검색정보 가져오기
	public List<PProductVO> getpSearchInfo(String search) {
		return pm.getpSearchInfo(search);
	}

	// 자유상품 검색정보 가져오기
	public List<FProductVO> getfSearchInfo(String search) {
		return pm.getfSearchInfo(search);
	}

	// 패키지상품 정보 가져오기
	public List<PProductVO> getPproducts() {
		return pm.getPproducts();
	}

	// 자유상품 정보 가져오기
	public List<FProductVO> getFproducts() {
		return pm.getFproducts();
	}

	// 패키지상품 등록
	public int addPproduct(PProductVO pproduct) {
		return pm.addPproduct(pproduct);
	}

	// 찜 목록 패키지상품 정보 가져오기
	public List<PProductVO> pcartList(List<Integer> pcart) {
		return pm.pcartList(pcart);
	}

	// 찜 목록 자유상품 정보 가져오기
	public List<FProductVO> fcartList(List<Integer> fcart) {
		return pm.fcartList(fcart);
	}

}
