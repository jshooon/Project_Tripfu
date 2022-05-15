package com.tripfu.svc.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tripfu.dao.product.ProductDAO;
import com.tripfu.vo.product.FProductVO;
import com.tripfu.vo.product.PProductVO;
import com.tripfu.vo.product.ProductVO;

@Service
public class ProductSVC {

	@Autowired
	private ProductDAO dao;
	

	
	// 패키지 상품 상세정보 가져오기
	public PProductVO getpProductInfo(int pnum) {
		List<Map<String, Object>> list = dao.getpProductInfo(pnum);
		PProductVO product = new PProductVO();
		
		if(!list.isEmpty()) {
							product.setPnum((int)list.get(0).get("pnum"));
							product.setPname((String)list.get(0).get("pname"));
							product.setArea((String)list.get(0).get("area"));
							product.setType((String)list.get(0).get("type"));
							product.setPrice((int)list.get(0).get("price"));
							product.setSdate((java.sql.Date)list.get(0).get("sdate"));
							product.setEdate((java.sql.Date)list.get(0).get("edate"));
							product.setFname((String)list.get(0).get("fname"));
							product.setIfname((String)list.get(0).get("ifname"));
							product.setPnump((int)list.get(0).get("pnump"));
							product.setPtitle((String)list.get(0).get("ptitle"));
							product.setPcontents((String)list.get(0).get("pcontents"));
							product.setLatitude((String)list.get(0).get("latitude"));
							product.setLongitude((String)list.get(0).get("longitude"));
		}
		return product;
	}

	// 자유 상품 상세정보 가져오기
	public FProductVO getfProductInfo(int pnum) {
		List<Map<String, Object>> list = dao.getfProductInfo(pnum);
		FProductVO product = new FProductVO();
		
		if(!list.isEmpty()) {
							product.setPnum((int)list.get(0).get("pnum"));
							product.setPname((String)list.get(0).get("pname"));
							product.setArea((String)list.get(0).get("area"));
							product.setType((String)list.get(0).get("type"));
							product.setPrice((int)list.get(0).get("price"));
							product.setFname((String)list.get(0).get("fname"));
							product.setIfname((String)list.get(0).get("ifname"));
							product.setPtitle((String)list.get(0).get("ptitle"));
							product.setPcontents((String)list.get(0).get("pcontents"));
							product.setLatitude((String)list.get(0).get("latitude"));
							product.setLongitude((String)list.get(0).get("longitude"));
		}
		return product;
	}
	
	// 상품검색정보 가져오기
	public List<ProductVO> getSearchInfo(String search) {
		List<ProductVO> list = dao.getSearchInfo(search);
		return list;
	}

	// 상품 인덱스 사진파일이름 가져오기
	public List<Map<String,Object>> getList() {
		return dao.getList();
	}

	// 패키지 상품 인덱스 사진파일이름 가져오기
	public List<PProductVO> getPlist() {
		List<Map<String, Object>> list = dao.getPlist();
		List<PProductVO> Plist = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			PProductVO product = new PProductVO();
			product.setPnum((int)list.get(i).get("pnum"));
			product.setSdate((java.sql.Date)list.get(i).get("sdate"));
			product.setEdate((java.sql.Date)list.get(i).get("edate"));
			product.setIfname((String)list.get(i).get("ifname"));
			product.setPname((String)list.get(i).get("pname"));
			product.setType((String)list.get(i).get("type"));
			product.setPtitle((String)list.get(i).get("ptitle"));
			product.setPcontents((String)list.get(i).get("pcontents"));
			Plist.add(product);
		}
		return Plist;
	}

	// 자유 상품 인덱스 사진파일이름 가져오기
	public List<FProductVO> getFlist() {
		List<Map<String, Object>> list = dao.getFlist();
		List<FProductVO> Flist = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			FProductVO product = new FProductVO();
			product.setPnum((int)list.get(i).get("pnum"));
			product.setIfname((String)list.get(i).get("ifname"));
			product.setPname((String)list.get(i).get("pname"));
			product.setType((String)list.get(i).get("type"));
			product.setPtitle((String)list.get(i).get("ptitle"));
			product.setPcontents((String)list.get(i).get("pcontents"));
			Flist.add(product);
		}
		return Flist;
	}

	// 패키지상품 검색정보 가져오기
	public List<PProductVO> getpSearchInfo(String search) {
		List<PProductVO> list = dao.getpSearchInfo(search);
		return list;
	}

	// 자유상품 검색정보 가져오기
	public List<FProductVO> getfSearchInfo(String search) {
		List<FProductVO> list = dao.getfSearchInfo(search);
		return list;
	}

	// 패키지상품 정보 가져오기
	public List<PProductVO> getPproducts() {
		return dao.getPproducts();
	}

	// 자유상품 정보 가져오기
	public List<FProductVO> getFproducts() {
		return dao.getFproducts();
	}

	// 찜 목록 패키지상품 정보 가져오기
	public List<PProductVO> pcartList(List<Integer> pcart) {
		if(pcart.size()!=0) {
			return dao.pcartList(pcart);			
		}
		return null;
	}
	
	// 찜 목록 자유상품 정보 가져오기
	public List<FProductVO> fcartList(List<Integer> fcart) {
		if(fcart.size()!=0) {
			return dao.fcartList(fcart);			
		}
		return null;
	}
	
	// 찜 목록 건수 가져오기
	public int cartCount(List<Integer> pcart, List<Integer> fcart) {
		int c = 0;
		List<Integer> cart = new ArrayList<>();
		cart.addAll(pcart);
		cart.addAll(fcart);
		for(int i = 0; i < cart.size(); i++) {
			c++;
		}
		return c;
	}

}
