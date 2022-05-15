<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tripfu [회원정보 수정]</title>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/memberInfo.css">
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

            <!-- 본문 들어가는 부분 시작 -->
            <form id = "updateForm" class="form-horizontal" role="form" onsubmit = "return updated();">
		 		<h2 class = "title">개인정보수정</h2>
            	<input type="hidden" class="form-control" id = "mnum" name ="mnum" value = "${mnum}" >
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="email" class="col-lg-2 control-label">이메일</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="email" class="form-control" id = "email" name ="email" value = "${email}" readonly>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="pwd" class="col-lg-2 control-label">패스워드</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="password" class="form-control" id="pwd" name="pwd" data-rule-required="true" value = "${memberInfo.pwd}" disabled>
                    </div>
                    </div>
                </div>
                           
                <div class="form-group" id="divName">
                	<div class = "c">
	                    <label for="name" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control onlyHangul" id="name" name="name" data-rule-required="true" value = "${memberInfo.name}" disabled>
                    </div>
                    </div>
                </div>    
                <div class="form-group" id="divName">
                	<div class = "c">
	                    <label for="phone" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-8">
                        <input id="phone" class="form-control onlyNumber" type="text"  name = "phone" data-rule-required="true" value = "${memberInfo.phone}" placeholder="-를 제외하고 숫자만 입력하세요. / 10 ~11자리">
                    </div>
                        <button type="button" class="btn btn-secondary" onclick = "pcheck();">중복 확인</button>
                    </div>

                </div>    
                
                <div class="form-group">
                    <div id = "okbtn" class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary" >개인정보수정</button>
                        <button type="button" class="btn btn-danger" onclick = "secession();">회원탈퇴</button>
                    </div>
                </div>
            </form>
        	<!-- 본문 들어가는 부분 끝 -->
        
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
        <script src="/js/memberInfo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>