<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tripfu [회원가입 양식]</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/signupForm.css">
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

            <!-- 본문 들어가는 부분 -->
                
        <div class="container"><!-- 좌우측의 공간 확보 -->
 		<h2 class = "title">회원가입</h2>
 
            <form id = "signupForm" class="form-horizontal" role="form" onsubmit = "return signup();">
            
                <div class="form-group" id="divEmail">
                    <label for="email" class="col-lg-2 control-label">이메일</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="email" class="form-control" id = "email" name ="email" data-rule-required="true" placeholder="name@example.com" >
                    
	                        <button type="button" id = "ebt" class="btn btn-secondary"
	                        		onclick = "echeck();">중복확인
	                        </button>
                    </div>
                </div>
                
                <div class="form-group" id="divPassword">
                    <label for="pwd" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-8">
                        <input type="password" class="form-control" id="pwd" name="pwd" data-rule-required="true" placeholder="패스워드 / 4 ~ 12자리">
                    </div>
                </div>
                           
                <div class="form-group" id="divName">
                    <label for="name" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control onlyHangul" id="name" name="name" data-rule-required="true" placeholder="한글만 입력 가능합니다. / 2 ~ 5자리" >
                    </div>
                    
                </div>
                <div class="form-group" id="divBirth">
                    <label for="birth" class="col-lg-2 control-label">생년월일</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control onlyNumber" id="birth" name="birth" data-rule-required="true" placeholder="ex) 910101 / 6자리">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="gender" class="col-lg-2 control-label">성별</label>
                    <div class="col-lg-8">
                        <label class="radio-inline">
                            <input type="radio" id="gender" name="gender" value="M" checked> 남
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="gender" name="gender" value="F"> 여
                        </label>
                    </div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="phone" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control onlyNumber" id="phone" name = "phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요. / 10 ~11자리">
                    </div>
                </div>
                
                <div class="form-group">
                    <div id = "okbtn" class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">회원가입</button>
                        <button type="button" class="btn btn-danger" onclick = "location.href = '/tripfu'">취소</button>
                    </div>
                </div>
            </form>
        
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
        </div>
        <script src="/js/signupForm.js"></script>
    </body>
</html>