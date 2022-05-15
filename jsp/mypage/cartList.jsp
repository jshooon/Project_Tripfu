<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="utf-8">
<title>Tripfu [찜목록]</title>
<link rel="stylesheet" type="text/css" href="/css/cartList.css">
</head>
<body>
<!-- 네비바 시작 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/tripfu">Tripfu</a>
<!-- 마이페이지 로그아웃 로그인 회원가입 시작 -->
      <form class="d-flex">
     	 <c:choose>
	        <c:when test="${not empty sessionScope.email}">
			      	<button id = "sbtn" type="button" class="btn btn-outline-primary" onclick ="location.href='/tripfu/mypage'">Mypage</button>
			      	<button id = "sbtn" type="button" class="btn btn-outline-primary" onclick ="location.href='/tripfu/logout'">Log Out</button>
	        </c:when>
	        	<c:otherwise>
			      	<button id = "sbtn" type="button" class="btn btn-outline-primary" onclick ="location.href='/tripfu/login'">Log In</button>
			      	<button id = "sbtn" type="button" class="btn btn-outline-primary" onclick ="location.href='/tripfu/signup'">Sign Up</button>
	        	</c:otherwise>
	     </c:choose>
      </form>
<!-- 마이페이지 로그아웃 로그인 회원가입 끝 -->
    </div>
</nav>
<!-- 네비바 끝 -->

<!-- 사이드바 시작 -->
<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
    <a href="/tripfu/mypage" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <span class="fs-5 fw-semibold">${name}님 반갑습니다.</span>
    </a>
   	 <ul class="list-unstyled ps-0">
    
	    <div>
	        <button class="btn btn-toggle align-items-center" 
	        				onclick = "location.href='/tripfu/mypage/memberInfo?mnum=${mnum}'">
	          개인정보수정
	        </button>
	    </div>
	    <div>
	        <button class="btn btn-toggle align-items-center" 
	        				onclick = "location.href='/tripfu/mypage/cartList'">
	          찜목록
	        </button>
	    </div>
	    <div>
	        <button class="btn btn-toggle align-items-center" 
	        				onclick = "location.href='/tripfu/mypage/reservationList/1?mnum=${mnum}'">
	          예약내역조회
	        </button>
	    </div>
	    <div>
	        <button class="btn btn-toggle align-items-center"
	        				onclick ="location.href='/tripfu/mypage/iqList/1?mnum=${mnum}'" >
	          1:1문의내역
	        </button>
	    </div>
    </ul>
  </div>
<!-- 사이드바 끝 -->

<!-- 본문 시작 -->
<!-- 테이블 헤드 시작 -->
<div class = "l">
	<h3 class = "ih"> 찜목록 </h3>
<table class="table">
  <thead>
    <tr>    
      <th scope="col">여행유형</th>
      <th scope="col">여행지</th>
      <th scope="col">상품명</th>
      <th scope="col">여행기간</th>
    </tr>
  </thead>
<!-- 테이블 헤드 끝 -->
<!-- 테이블 바디 시작 --> 
  <tbody>
	 <c:forEach var = "p" items="${Plist}">
	    <tr>
	      <td>${p.type }</td>
	      <td><img src="/images/${p.pname}.jpg" class="rounded mx-auto d-block" width = "100px;" height = 100px;></td>
	      <td>${p.pname}</td>
	      <td>${p.sdate} ~ ${p.edate}</td>
	      <td><button type="button" class="btn btn-outline-primary" 
	      			onclick = "location.href='/tripfu/pc/pdetail/${p.pnum}'">예약바로가기</button></td>
	    </tr>
	 </c:forEach>
	 <c:forEach var = "f" items="${Flist}">
	    <tr>
	      <td>${f.type }</td>
	      <td><img src="/images/${f.pname}.jpg" class="rounded mx-auto d-block" width = "100px;" height = 100px;></td>
	      <td>${f.pname}</td>
	      <td></td>
	      <td><button type="button" class="btn btn-outline-primary" 
	      			onclick = "location.href='/tripfu/pc/fdetail/${f.pnum}'">예약바로가기</button></td>
	    </tr>
	 </c:forEach>
  </tbody>
<!-- 테이블 바디 끝 --> 
</table>
<!-- 본문 끝 -->

</div>
	<hr/>
            <!-- 푸터 들어가는 부분 -->
            <div>
                <p class="text-center">
                    <medium><strong>Tripfu</strong></medium><br>
                    <small>대표 : 지 성훈 ㆍ 주소 :  중랑구 ㆍ 사업자등록번호:123-12-12345 ㆍ 전화 : 02-123-1234</small><br>
                    <small>Copyrightⓒ test.com All rights reserved.</small>
                </p>
            </div>
            <!--// 푸터 들어가는 부분 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>