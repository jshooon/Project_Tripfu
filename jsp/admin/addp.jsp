<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tripfu [패키지 상품등록]</title>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/admin/addp.css">
    </head>
    <body>
    

            
<!-- 네비바 시작 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/tripfu/admin">Tripfu</a>
       <!-- 마이페이지 로그아웃 로그인 회원가입 시작 -->
      <form class="d-flex">
     	 <c:choose>
	        <c:when test="${not empty sessionScope.id}">
			      	<div class="dropdown">
					  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
					    상품등록
					  </a>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					    <li><a class="dropdown-item" href="/tripfu/admin/addPproduct">패키지</a></li>
					    <li><a class="dropdown-item" href="/tripfu/admin/addFproduct">자유</a></li>
					  </ul>
					</div>
			      	<button id = "sbtn" type="button" class="btn btn-outline-primary" onclick ="location.href='/tripfu/admin/cmanagement'">고객관리</button>
			      	<button id = "sbtn" type="button" class="btn btn-outline-primary" onclick ="location.href='/tripfu/admin/logout'">로그아웃</button>
	        </c:when>
	        <c:otherwise>
			      	<button id = "sbtn" type="button" class="btn btn-outline-primary" onclick ="location.href='/tripfu/admin/login'">로그인</button>
	        </c:otherwise>
	     </c:choose>
      </form>
      <!-- 마이페이지 로그아웃 로그인 회원가입 끝 -->
    </div>
</nav>
<!-- 네비바 끝 -->


            <!-- 본문 들어가는 부분 시작 -->
		 		<h2 class = "title">패키지상품 등록</h2>
            <form id = "addpForm" class="form-horizontal" role="form" onsubmit = "return addpProduct();">
            	<input type="hidden" class="form-control" id = "mnum" name ="mnum" value = "${mnum}" >
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="pname" class="col-lg-2 control-label">상품명</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "pname" name ="pname" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="area" class="col-lg-2 control-label">지역</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "area" name ="area" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="type" class="col-lg-2 control-label">여행유형</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "type" name ="type" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="price" class="col-lg-2 control-label">상품가</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "price" name ="price" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="sdate" class="col-lg-2 control-label">출발일</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="date" class="form-control" id = "sdate" name ="sdate" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="edate" class="col-lg-2 control-label">도착일</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="date" class="form-control" id = "edate" name ="edate" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="fname" class="col-lg-2 control-label">상세사진</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "fname" name ="fname" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="ifname" class="col-lg-2 control-label">홈사진</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "ifname" name ="ifname" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="pnump" class="col-lg-2 control-label">상품인원</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "pnump" name ="pnump" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="ptitle" class="col-lg-2 control-label">상품제목</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "ptitle" name ="ptitle" required>
                    </div>
                    </div>
                </div>
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="pcontents" class="col-lg-2 control-label">상품내용</label>
                    <div id = "ediv" class="col-lg-8" >
                        <textarea class="form-control" id = "pcontents" name ="pcontents" required></textarea>
                    </div>
                    </div>
                </div>
				<div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="latitude" class="col-lg-2 control-label">위도</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "latitude" name ="latitude" required>
                    </div>
                    </div>
                </div>                
                <div class="form-group" id="divEmail">
                	<div class = "c">
                    	<label for="longitude" class="col-lg-2 control-label">경도</label>
                    <div id = "ediv" class="col-lg-8" >
                        <input type="text" class="form-control" id = "longitude" name ="longitude" required>
                    </div>
                    </div>
                </div>                    
                <div class="form-group">
                    <div id = "okbtn" class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">상품등록</button>
                        <button type="reset" class="btn btn-danger">취소</button>
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
        <script src="/js/admin/addp.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>