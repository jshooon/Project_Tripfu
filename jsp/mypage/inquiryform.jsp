<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>title [문의내역 작성]</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/inquiryform.css">
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
<div class = "iqF">
	<form id="iqForm" onsubmit="return iqSave();" enctype="multipart/form-data">
		<!-- 안내 및 유의사항 -->
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
	        안내 및 유의사항
	      </button>
	    </h2>
	    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
	      <div class="accordion-body">
	        <div class = "g">- 1:1 문의는 사이트 이용 등 일반 상담만 가능합니다.<br>
				 - 상품 구매 및 취소는 나의 정보 > 주문내역 > 주문상세보기를 통해 처리 가능합니다.<br>
				 - 사이트에서 처리가 되지 않는 주문 및 교환, 반품 문의는 고객센터 02-123-1234으로 연락하여 주시기 바랍니다.<br>
				 - 상담문의 답변은 나의 정보 > 1:1 문의내역에서 확인이 가능합니다.
			</div>
			<div class = "n">
				 - 고객센터 운영시간 : 평일 9시 ~ 18시 / 토, 일 공휴일 휴무
			</div>
	      </div>
	    </div>
	  </div>
	  <hr>
	  
	  	<!-- 작성자 -->
		<p>
			<div class="col-12">
	              <label for="iqauthor" class="form-label">작성자 : ${name}</label>
	              <input type="hidden" class="form-control" id="iqauthor" name = "iqauthor" value = "${name}">
			</div>
		</p>
		
	  	<!-- 문의유형 -->
		<p>
			<select class="form-select form-select-md mb-3" aria-label=".form-select-lg example" name = "iqtype">
			  <option selected disabled="disabled">문의유형</option>
			  <option>회원정보</option>
			  <option>주문/결제</option>
			  <option>취소/교환</option>
			</select>
	  	</p>
	  	
		
	  	<!-- 문의제목 -->
		<p>
			<div class="col-12">
	              <label for="title" class="form-label">제목</label>
	              <input type="text" class="form-control" id="title" name = "iqtitle" placeholder="제목을 입력해주세요 (최대 20자)" required>
			</div>
		</p>
	
		<!-- 문의내용 -->
	
		<label for="address" class="form-label">내용</label>
		<button type="reset" onclick = "reset();" id = "cbtn" class="btn btn-outline-secondary">작성내용초기화</button>
			<div class="form-floating">
	  			<textarea class="form-control" name = "iqcontents" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
	  			<label for="floatingTextarea2">Comments</label>
			</div>
		<p>
			<div class="input-group">
			  <input type="file" class="form-control" id="inputGroupFile04" name = "iqfiles" aria-describedby="inputGroupFileAddon04" aria-label="Upload" multiple>
			  <button class="btn btn-outline-secondary" type="reset" id="inputGroupFileAddon04" name = "iqcontents">취소</button>
			</div>
		</p>
		
			<div id = "r">
				<button type="submit" class="btn btn-outline-primary" >접수</button>
				<button type="button" class="btn btn-outline-danger" onclick ="location.href='/tripfu/mypage/iqList/1?mnum=${mnum}'">취소</button>
			</div>
	</form>
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
		// 문의내용 초기화
		function reset(){
			$('#cbtn').val('');
		}
		
		// 문의내용 저장
		function iqSave(){
			var formData = new FormData($("#iqForm")[0]);
			$.ajax({
				url : '/tripfu/mypage/iqSave',
				method : 'post',
				enctype: 'multipart/form-data',
				processData: false,
			    contentType: false,
				cache : false,
				data : formData,
				dataType : 'json',
				success : function(res){
					alert(res.iqSaved ? '문의사항이 접수 되었습니다.' : '문의사항 접수를 실패 하였습니다.');
					location.href = "/tripfu/mypage/iqList/1?mnum=${mnum}";
				}, 
				error : function(xhr, status, err){
					alert('에러 : ' + xhr + status, err);
				}
			});
			return false;
		}
		</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>