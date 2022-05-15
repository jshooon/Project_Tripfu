<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="utf-8">
<title>Tripfu [회원정보목록]</title>
<link rel="stylesheet" type="text/css" href="/css/admin/memberList.css">
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

<!-- 본문 시작 -->
<div class = "l">
	<h3 class = "ih"> 회원정보목록 </h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">이메일</th>
      <th scope="col">비밀번호</th>
      <th scope="col">이름</th>
      <th scope="col">생년월일</th>
      <th scope="col">성별</th>
      <th scope="col">전화번호</th>
    </tr>
  </thead>
  
  <tbody>
	 <c:forEach var = "m" items="${mlist.list}">
	    <tr>
	      <td>${m.email}</td>
	      <td>${m.pwd}</td>
	      <td>${m.name}</td>
	      <td>${m.birth}</td>
	      <td>${m.gender}</td>
	      <td>${m.phone}</td>
	      <td><button type="button" class="btn btn-outline-danger" 
	      			onclick = "mdelete(${m.mnum});">삭제하기</button></td>
	    </tr>
	 </c:forEach>
  </tbody>
</table>
<!-- 본문 끝 -->

	<!-- 페이징 시작 -->				
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href = "/tripfu/admin/mlist/${mlist.navigateFirstPage}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
			    <c:forEach var = "pageNum" items = "${mlist.navigatepageNums}">
			    	<c:choose>									
						<c:when test = "${mlist.pageNum == pageNum}"> <!-- n이 현재 페이지와 같다면, -->
			    			<li class="page-item active"><a class="page-link" href = "/tripfu/admin/mlist/${pageNum}">${pageNum}</a></li>
			    		</c:when>
			    		<c:otherwise>
			    		<li class="page-item"><a class="page-link" href = "/tripfu/admin/mlist/${pageNum}">${pageNum}</a></li>
			    		</c:otherwise>
			    	</c:choose>		
			    </c:forEach>
			   <li class="page-item">
			    <a class="page-link" href = "/tripfu/admin/mlist/${mlist.navigateLastPage}"  aria-label="Next">
			       <span aria-hidden="true">&raquo;</span>
			    </a>
			   </li> 
			  </ul>
			</nav>
	<!-- 페이징 끝 -->
	
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

		<script type="text/javascript">
		function mdelete(mnum){
			
			if(!confirm('회원정보를 삭제하시겠습니까?')){
				return;
			}
			
			var obj = {};
			obj.mnum = mnum;
			
			$.ajax({
				url:'/tripfu/admin/mdelete',
				method:'post',
				cache:false,
				data:obj,
				dataType:'json',
				success:function(res){
						alert(res.mdelete ? '회원정보가 삭제되었습니다.' : '회원정보 삭제를 실패했습니다');
						
						if(res.mdelete) location.href = "/tripfu/admin/mlist/1";
				},
				error:function(xhr,status,err){
					alert('에러 : ' + xhr + status, err);
				}
			});
			
		}
		</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>