<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tripfu [관리자]</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/admin/loginForm.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/admin/index.css">
</head>
<body>
<!-- 네비바 시작 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/tripfu/admin">Tripfu</a>
    <!-- 검색창 시작-->
	    <div>
	      <form id = "searchForm" class="d-flex" action = "/tripfu/admin/pc" >
	        <input class="form-control me-2" type="text" name = "search" placeholder="당신을 위한여행 Trip for you!"/>
	        <button class="btn btn-outline-primary" type="submit">검색</button>
	      </form>
	    </div>
	 <!-- 검색창 끝 -->
	 
      <!-- 여행분류 리스트 시작 -->
	      <div>
	        <button type="button" class="btn btn-outline-success"
	        			onclick = "location.href='/tripfu/admin/pProduct'">
	        	패키지여행
	        </button>
	        <button type="button" class="btn btn-outline-success"
	        			onclick = "location.href='/tripfu/admin/fProduct'">
	        	자유여행
	        </button>
	      </div>
	  <!-- 여행분류 리스트 끝 -->
	  
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

<!-- 캐러셀 시작 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href = "/tripfu/pc/fdetail/5">
      	<img src="/images/제주도.jpg" class="d-block w-100" alt="...">
      </a>
    </div>
    <div class="carousel-item">
      <a href = "/tripfu/pc/pdetail/3">
      	<img src="/images/통영.jpg" class="d-block w-100" alt="...">
      </a>
    </div>
    <div class="carousel-item">
       <a href = "/tripfu/pc/fdetail/2">
 	     <img src="/images/부산.jpg" class="d-block w-100" alt="...">
 	  </a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<!-- 캐러셀 끝 -->

<!-- 카드 시작 -->
<div class="flex">

			<c:forEach var = "p" items="${Plist}">
				<div class="col-lg-3 col-md-6">
					<div class="card" style="width: 18rem;">
						<a href = "/tripfu/pc/pdetail/${p.pnum}">
						  <img src="/images/${p.ifname}" class="card-img-top" alt="...">
						</a>
					  <div class="card-body">
					    <h5 class="card-title">${p.ptitle}</h5> 
					    <label class ="ptype">${p.type} 여행</label>
					    <p class="card-text">${p.pcontents}</p>
				  	  </div>
				  		<c:if test="${not empty sessionScope.id }">
				  			<a href="/tripfu/admin/pedit?pnum=${p.pnum}" id = "fbtn"class="btn btn-outline-success">수정하기</a>
						    <a href="javascript:pdeleted(${p.pnum});" id = "pbtn" class="btn btn-outline-danger">삭제하기</a>			  	  	
				  	  	</c:if>
					    <a href="/tripfu/pc/pdetail/${p.pnum}" class="btn btn-outline-primary">예약하기</a>
					</div>
				</div>
			</c:forEach>
			<c:forEach var = "f" items="${Flist}">
				<div class="col-lg-3 col-md-6">
					<div class="card" style="width: 18rem;">
						<a href = "/tripfu/pc/fdetail/${f.pnum}">
						  <img src="/images/${f.ifname}" class="card-img-top" alt="...">
						</a>
					  <div class="card-body">
					    <h5 class="card-title">${f.ptitle}</h5> 
					    <label class ="ptype">${f.type} 여행</label>
					    <p class="card-text">${f.pcontents}</p>
				  	  </div>
				  	  	<c:if test="${not empty sessionScope.id }">
						    <a href="/tripfu/admin/fedit?pnum=${f.pnum}" id = "fbtn"class="btn btn-outline-success">수정하기</a>			  	  	
						    <a href="javascript:fdeleted(${f.pnum});" id = "fbtn"class="btn btn-outline-danger">삭제하기</a>			  	  	
				  	  	</c:if>
					    <a href="/tripfu/pc/fdetail/${f.pnum}" class="btn btn-outline-primary">예약하기</a>
					</div>
				</div>
			</c:forEach>
	</div>
<!-- 카드 끝 -->

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
		<script src="/js/admin/index.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>