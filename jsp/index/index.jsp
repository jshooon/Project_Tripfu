<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tripfu</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<!-- 네비바 시작 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/tripfu">Tripfu</a>
    <!-- 검색창 시작-->
	    <div>
	      <form id = "searchForm" class="d-flex" action = "/tripfu/pc" >
	        <input class="form-control me-2" type="text" name = "search" placeholder="당신을 위한여행 Trip for you!">
	        <button class="btn btn-outline-primary" type="submit">검색</button>
	      </form>
	    </div>
	 <!-- 검색창 끝 -->
	 
      <!-- 여행분류 리스트 시작 -->
	      <div>
	        <button type="button" class="btn btn-outline-success"
	        			onclick = "location.href='/tripfu/pc/pProduct'">
	        	패키지여행
	        </button>
	        <button type="button" class="btn btn-outline-success"
	        			onclick = "location.href='/tripfu/pc/fProduct'">
	        	자유여행
	        </button>
	      </div>
	  <!-- 여행분류 리스트 끝 -->
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
<!-- 지역별 날씨현황 시작 -->
	<div id = "weather">
	    <div class="row row-cols-1 row-cols-md-12 text-center">
	      <div class="col">
	        <div class="card mb-4 rounded-3 shadow-sm border-light">
	          <div class="card-header py-3 border-light">
	            <h4 class="my-0 fw-normal">
					지역별 날씨현황
				</h4>
	          </div>
	          <div class="card-body">
	            <h2 class="card-title pricing-card-title">
					<div class="CurrIcon"></div>
					<div class="CurrTemp"></div>
					<div class="City"></div>
	            </h2>
			    <div>
			      <form id = "weatherForm" class="d-flex" action = "/tripfu/searchWeather">
			        <input class="form-control me-2" type="search" name = "wsearch" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			      </form>
			    </div>
	          </div>
	        </div>
	      </div>
   		 </div>
	</div>
<!-- 지역별 날씨현황 끝 -->
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
				  	  <button id = "cartbtn" class="btn btn-outline-danger" onclick = "addpcart(${p.pnum});">
				  	  	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
						  <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
						</svg>
				  	  </button>
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
						<button id = "cartbtn" class="btn btn-outline-danger" onclick = "addfcart(${f.pnum});">
					  	  	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
							  <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
							</svg>
						</button>
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
	<script src="/js/index.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>