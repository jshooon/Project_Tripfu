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
<title>Tripfu [회원문의내용 상세정보]</title>
<link rel="stylesheet" type="text/css" href="/css/admin/miqEdit.css">
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
<!-- 사이드바 시작 -->
<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
    <a href="/tripfu/mypage" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <span class="fs-5 fw-semibold">${name}님 반갑습니다.</span>
    </a>
   	 <ul class="list-unstyled ps-0">
    
	    <div>
	        <button class="btn btn-toggle align-items-center" 
	        				onclick = "location.href='/tripfu/admin/mlist/1'">
	          회원정보목록
	        </button>
	    </div>
	    <div>
	        <button class="btn btn-toggle align-items-center" 
	        				onclick = "location.href='/tripfu/admin/mreservationList/1'">
	          회원예약목록
	        </button>
	    </div>
	    <div>
	        <button class="btn btn-toggle align-items-center"
	        				onclick ="location.href='/tripfu/admin/miqList/1'" >
	          회원문의목록
	        </button>
	    </div>
    </ul>
  </div>
<!-- 사이드바 끝 -->

<!-- 본문시작 -->
<div class = "d">
<form onsubmit = "return cupdate();">
	<table class="table">
	  <thead>
		<h3 class ="ih"> 문의 상세내용 </h3>
	  </thead>

	  <tbody>
	    <tr>
	      <th scope="row">글 번호</th>
	      <td>${detail.num}</td>
	    </tr>
	    <tr>
	      <th scope="row">문의유형</th>
	      <td>${detail.iqtype}</td>
	    </tr>
	    <tr>
	      <th scope="row">작성자</th>
	      <td>
	      	<input type="hidden" class="form-control" id="iqauthor" name = "iqauthor" value = "${detail.iqauthor}">
	      	${detail.iqauthor}
	      </td>
	    </tr>
	    <tr>
	      <th scope="row">제 목</th>
	      <td>${detail.iqtitle}</td>
	    </tr>
	    <tr>
	      <th scope="row">내 용</th>
	      <td>${detail.iqcontents}</td>
	    </tr>
	    <tr>
	    <tr>
	      <th scope="row">첨 부</th>
		      <td>
	      		<c:choose>
					<c:when test="${fn:length(detail.iqfileinfo)>0}">
						<c:forEach var="f" items="${detail.iqfileinfo}" varStatus="status">
							<fmt:formatNumber var="kilo" value="${f.fsize/1024}" maxFractionDigits="0" />
								<div>${status.index+1}.
									<a href="/tripfu/admin/file/download/${f.fnum}">${f.fname}</a>(${kilo} kb)
								</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						첨부파일 없음
					</c:otherwise>
				</c:choose>
		      </td>
	    </tr>
	    <tr>
	      <th scope="row">날 짜</th>
	      <td>${detail.iqdate}</td>
	    </tr>
		<c:if test="${not empty cm}">
		    <tr>
		      <th scope="row">답 변</th>
		      	<td>
				 <c:forEach var="c" items="${cm}">
					<div id = "comments" class="col-12">
						<input type="text" class="form-control" id="com" name="comments" value = "${c.comments}" required>
						<input type = "hidden" id = "cnum" name = "cnum" value = "${c.num}" required>
						<button type="submit" id = "cbtn" class="btn btn-outline-secondary">저장</button>
						<button type="button" id = "cbtn" class="btn btn-outline-danger" 
								onclick ="cdelete(${c.num});">삭제</button>
					</div>
				</c:forEach>
		      </td>
		   </tr>
	    </c:if>
	  </tbody>
</table>
</form>
	<div class ="c">
	  <button type="button" id = "c" class="btn btn-outline-success" onclick ="location.href='/tripfu/admin/miqList/1'" >문의목록</button>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

	function cupdate(){
		
		if(!confirm('정말로 수정하시겠어요?')){
			return false;
		}
		
		var com = $('#com').val();
		var num = $('#cnum').val();

		var obj = {};
		obj.comments = com
		obj.num = num

		
		$.ajax({
			url:'/tripfu/admin/cupdate',
			method:'post',
			cache:false,
			data:obj,
			dataType:'json',
			success:function(res){
				alert(res.cupdate ? '수정 성공':'수정 실패');
				location.href = "/tripfu/admin/miqDetail?num=${detail.num}";
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
		return false;
	}
	
	// 문의내용 삭제
	function cdelete(num){
		
		if(!confirm('정말로 삭제하시겠어요?')){
			return;
		}
		
		var obj = {};
		obj.num = num;
		
		$.ajax({
			url:'/tripfu/admin/cdelete',
			method:'post',
			cache:false,
			data:obj,
			dataType:'json',
			success:function(res){
				alert(res.deleted ? '삭제 성공':'삭제 실패');
				location.href = "/tripfu/admin/miqDetail?num=${detail.num}";
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
	}
</script>
</body>
</html>