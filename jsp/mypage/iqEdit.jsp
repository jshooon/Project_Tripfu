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
<title>Tripfu [문의내용 수정]</title>
<link rel="stylesheet" type="text/css" href="/css/iqEdit.css">
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
<!-- 본문 시작 -->
<div class = "e">
	<form id ="updateForm" onsubmit ="return updateit();" enctype="multipart/form-data">
		<table class="table">
		  <thead>
		      <h3 class = "ih"> 문의 상세내용 </h3>
		  </thead>
	
		  <tbody>
		    <tr>
		      <th scope="row">문의 번호</th>
		      
		      <td>
		      	<input type = "hidden" name = "num" value = "${detail.num}">
		      	${detail.num}
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">문의유형</th>
		      <td>
				<select class="form-select form-select-md mb-3" aria-label=".form-select-lg example" name = "iqtype" value = "${detail.iqtype}">
			  <option disabled="disabled">문의유형</option>
			  <option>회원정보</option>
			  <option>주문/결제</option>
			  <option>취소/교환</option>
				</select>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">작성자</th>
		      <td>${name}</td>
		    </tr>
		    <tr>
		      <th scope="row">제 목</th>
		      <td>
		      	<div class="col-12">
	              <input type="text" class="form-control" id="title" name = "iqtitle" value = "${detail.iqtitle}" required>
				</div>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">내 용</th>
		      <td>
				<div class="col-12">
	              <input type="text" class="form-control" id="title" name = "iqcontents" value = "${detail.iqcontents }" required>
				</div>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">첨 부</th>
			      <td>
		      		<c:choose>
						<c:when test="${fn:length(detail.iqfileinfo)>0}">
							<c:forEach var="f" items="${detail.iqfileinfo}" varStatus="status">
								<fmt:formatNumber var="kilo" value="${f.fsize/1024}" maxFractionDigits="0" />
									<div>${status.index+1}.
										<a href="/tripfu/mypage/file/download/${f.fnum}">${f.fname}</a>(${kilo} kb) 
										<a class="link_del" href="javascript:delete_file(${f.fnum});">삭제</a>
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
		      <th scope="row">첨부파일 추가</th>
		      <td>
		      	<div class="input-group">
				  <input type="file" class="form-control" id="inputGroupFile04" name = "iqfiles" aria-describedby="inputGroupFileAddon04" aria-label="Upload" multiple>
				  <button class="btn btn-outline-secondary" type="reset" id="inputGroupFileAddon04" name = "iqcontents">취소</button>
				</div>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">날 짜</th>
		      <td>${detail.iqdate}</td>
		    </tr>
		  </tbody>
	</table>
		<div class = "c">
		  <button type="submit" class="btn btn-outline-primary">저장</button>
		  <button type="button" class="btn btn-outline-danger" onclick ="location.href='/tripfu/mypage/iqDetail?num=${detail.num}'">취소</button>
		  <button type="button" id = "a" class="btn btn-outline-secondary" onclick ="location.href='/tripfu/mypage/iqList/1?mnum=${mnum}'" >문의목록</button>
		</div>
	</form>
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
	    	// 문의내용 업데이트
	    	function updateit(){
	    		if(!confirm('수정 하시겠어요?')){
	    			return;
	    		}
	    		
	    		var formData = new FormData($('#updateForm')[0]);
	
	    		$.ajax({
	    			url : '/tripfu/mypage/iqUpdate',
	    			method : 'post',
	    			enctype: 'multipart/form-data',
	    			processData: false,
	    		    contentType: false,
	    			cache : false,
	    			data : formData,
	    			dataType : 'json',
	    			success : function(res){
	    				alert(res.iqupdated ? '문의사항이 수정 되었습니다.' : '문의사항 수정을 실패 하였습니다.');
	    				location.href = "/tripfu/mypage/iqList/1?mnum=${mnum}";
	    			}, 
	    			error : function(xhr, status, err){
	    				alert('에러 : ' + xhr + status, err);
	    			}
	    		});
	    		return false;
	    	}
	    	
	    	// 문의내용 삭제
	    	function delete_file(num){
	    		
	    		if(!confirm('정말로 삭제하시겠어요?')){
	    			return;
	    		}
	    		
	    		var obj = {};
	    		obj.num = num;
	    		
	    		$.ajax({
	    			url:'/tripfu/mypage/file/iqDelete',
	    			method:'post',
	    			cache:false,
	    			data:obj,
	    			dataType:'json',
	    			success:function(res){
	    				alert(res.deleted ? '삭제 성공':'삭제 실패');
	    				location.href = "/tripfu/mypage/iqEdit?num=${detail.num}";
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