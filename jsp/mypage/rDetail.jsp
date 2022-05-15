<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>Tripfu [예약 상세정보]</title>
<link rel="stylesheet" type="text/css" href="/css/rDetail.css">
</head>
<body>

<!-- 네비바 시작 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/tripfu">Tripfu</a>
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

<!-- 본문시작 -->
<div class = "d">
	<table class="table">
	  <thead>
	    <tr>
	      <h3 class = "ih"> 예약 상세정보 </h3>
	  </thead>
	  
	  <tbody>

		    <tr>
		      <th scope="row">예약 번호</th>
			      <td>${rDetail.rnum}
				      <input type="hidden" class="form-control" id="iqauthor" name = "iqauthor" value = "${name}">
			      </td>
		    </tr>
		    <tr>
		      <th scope="row">상품 유형</th>
		      <td>${rDetail.rtype}</td>
		    </tr>
		    <tr>
		      <th scope="row">상품명</th>
		      <td>${rDetail.rpname}</td>
		    </tr>
		    <tr>
		      <th scope="row">예약자</th>
		      <td>${rDetail.rname}</td>
		    </tr>
		    <tr>
		      <th scope="row">인원</th>
		      <td>${rDetail.nump}명</td>
		    </tr>
		    <tr>
		      <th scope="row">총 판매가</th>
		      <td>${rDetail.rprice}원</td>
		    </tr>
		    <tr>
	
		    <tr>
		      <th scope="row">접수일</th>
		      <td>${rDetail.rdate}</td>
		    </tr>

	  </tbody>
</table>
	<div class ="c">
		<button type="button" id = "b" class="btn btn-outline-secondary" 
				onclick = "location.href = '/tripfu/mypage/reservationList/1?mnum=${mnum}'">예약목록</button>
		<button type="button" id = "b" class="btn btn-outline-danger" 
				onclick = "rCancel(${rDetail.rnum})">예약취소</button>
	</div>
</div>
<!-- 본문 끝 -->

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
    	<script type="text/javascript">

	// 예약취소
	function rCancel(rnum){
		
		if(!confirm('예약을 취소하시겠어요?')){
			return;
		}
		var obj = {};
		obj.rnum = rnum;
		$.ajax({
			url:'/tripfu/rv/rCancel',
			method:'post',
			cache:false,
			data:obj,
			dataType:'json',
			success:function(res){
				alert(res.rCancel ? '예약이 취소되었습니다.':'예약취소 기간이 아닙니다.');
				location.href = "/tripfu/mypage/reservationList/1?mnum=${mnum}";
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
	}
</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>