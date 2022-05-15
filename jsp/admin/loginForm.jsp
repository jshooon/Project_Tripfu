<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Tripfu</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/admin/loginForm.css">
  </head>
  <body class="text-center">
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
    
    		<!-- 본문 들어가는 부분 -->	
			<main class="form-signin">
			  <form id = "loginForm" onsubmit = "return login();">
			    <img class="mb-4" src="/images/logo.png" alt="" width="72" height="34">
			
			    <div class="form-floating">
			      <input type="text" class="form-control" id="id" name ="id">
			      <label for="floatingInput">id</label>
			    </div>
			    <div class="form-floating">
			      <input type="password" class="form-control" id="pwd" name = "pwd">
			      <label for="floatingPassword">Password</label>
			    </div>
			
			    <div class="checkbox mb-3">
			      <label>
			        <input type="checkbox" value="remember-me"> Remember me
			      </label>
			    </div>
			    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2022.04.05–ing</p>
			  </form>
			</main>
			<!-- 본문 들어가는 부분 끝 -->
	<script src="/js/admin/loginForm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
