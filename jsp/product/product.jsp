<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Kakao Map API Key -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9c25eec12b76614d844bfdc96d4acd9"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sidebars/">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Tripfu ${product.pname}</title>

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
<link rel="stylesheet" type="text/css" href="/css/product.css">
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
    
  <!-- 예약 폼 시작 -->
<form id = "reservationForm" onsubmit = "return reservation();">
<main id = "rv">
  <div class="flex-shrink-0 p-3 bg-white" style="width: 350px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="50" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold" style = "font-weight: bold;">상품예약</span>
      <input type = "hidden" name = "email" value = "${sessionScope.email}">
    </a>
	<c:choose>
		<c:when test="${not empty pproduct}">
		     <div class="flex-grow-1">
		        <div id = "rpname" class="col-sm">
		          <label for="firstName" class="form-label">상품명</label>
		          <label for="firstName" id = "pname" class="form-label">${pproduct.pname}</label>
		          	<input type="hidden" name = "rpname" value="${pproduct.pname}" required>
		        </div>
		      </div>
		      
		     <div class="flex-grow-1">
		        <div id = "rtype" class="col-sm">
		          <label for="firstName" class="form-label">상품타입</label>
		          <label for="firstName" id = "type" class="form-label">${pproduct.type}</label>
		          	<input type="hidden" name = "rtype" value="${pproduct.type}" required>
		        </div>
		      </div>
		      
		     <div class="flex-grow-1">
		        <div  class="col-sm">
		          <label for="firstName" class="form-label">회원성함</label>
		          <label for="firstName" id = "mname" class="form-label">${name}</label>
		          	<input type="hidden" name = "mname" value="${name}" required>
		        </div>
		      </div>
		      
		     <div class="flex-grow-1">
		        <div  class="col-sm">
		          <label for="firstName" class="form-label">상품가</label>
		          <label for="firstName" id = "price" class="form-label">${pproduct.price}원</label>
		          	<input type="hidden" name = "rprice" value="${pproduct.price}" required>
		        </div>
		      </div>
		     <div class="flex-grow-1">
		        <div  class="col-sm">
		          <label for="firstName" class="form-label">출발일</label>
		          <label for="firstName" id = "psdate" class="form-label">${pproduct.sdate}</label>
		          	<input type="hidden" name = "sdate" value="${pproduct.sdate}" required>
		        </div>
		      </div>
		     <div class="flex-grow-1">
		        <div  class="col-sm">
		          <label for="firstName" class="form-label">도착일</label>
		          <label for="firstName" id = "pedate" class="form-label">${pproduct.edate}</label>
		          	<input type="hidden" name = "edate" value="${pproduct.edate}" required>
		        </div>
		      </div>
		          <div>
					<select id = "pnump" name = "nump" class="form-select form-select-md mb-3" onchange="ppriceChange(this)"  aria-label=".form-select-lg example" >
					  <option selected id = "default" value = "0" disabled="disabled">인원선택 (예약 가능인원 ${aNump}명)</option>
					  <option value = "1">1명</option>
					  <option value = "2">2명</option>
					  <option value = "3">3명</option>
					  <option value = "4">4명</option>
					  <option value = "5">5명</option>
					</select>
		          </div>
		          
			<hr>
		    <!-- 인원선택이 null이 아니면 금액보이고 1명 추가당 금액 * 인원수 -->
	         <div class="flex-grow-1">
	         	<div>
	              <label id = "pricelabel" class="form-label">총 예약금액</label>
	              <label id = "pprices"></label> <label>원</label>
	         	</div>
	              	<input type="hidden" class="form-control" name="rprice"  value="" required>
	          </div>
	          
	        </c:when>
	        <c:otherwise>
				<div class="flex-grow-1">
			        <div id = "rpname" class="col-sm">
			          <label for="firstName" class="form-label">상품명</label>
			          <label for="firstName" id = "pname" class="form-label">${fproduct.pname}</label>
			          	<input type="hidden" name = "rpname" value="${fproduct.pname}" required>
			        </div>
				</div>
			      
			     <div class="flex-grow-1">
			        <div id = "rtype" class="col-sm">
			          <label for="firstName" class="form-label">상품타입</label>
			          <label for="firstName" id = "type" class="form-label">${fproduct.type}</label>
			          	<input type="hidden" name = "rtype" value="${fproduct.type}" required>
			        </div>
			      </div>
			      
			     <div class="flex-grow-1">
			        <div  class="col-sm">
			          <label for="firstName" class="form-label">회원성함</label>
			          <label for="firstName" id = "mname" class="form-label">${name}</label>
			          	<input type="hidden" name = "mname" value="${name}" required>
			        </div>
			      </div>
			      
			     <div class="flex-grow-1">
			        <div  class="col-sm">
			          <label for="firstName" class="form-label">상품가</label>
			          <label for="firstName" id = "price" class="form-label">${fproduct.price}원</label>
			          	<input type="hidden" name = "rprice" value="${fproduct.price}" required>
			        </div>
			      </div>
		       			<div class = "sedate">
							<div>출발일</div>
								<input type="date" id="sdate" class="form-control" name = "sdate" min = "0"/>
							<div>도착일</div>
								<input type="date" id="edate" class="form-control" name = "edate" />
						</div>
						<div>
							<select id = "fnump" name = "nump" class="form-select form-select-md mb-3" onchange="fpriceChange(this)"  aria-label=".form-select-lg example" >
							  <option selected value = "0">인원선택</option>
							  <option value = "1">1명</option>
							  <option value = "2">2명</option>
							  <option value = "3">3명</option>
							  <option value = "4">4명</option>
							  <option value = "5">5명</option>
							</select>
						</div>
	          <hr>
	          
	          <!-- 인원선택이 null이 아니면 금액보이고 1명 추가당 금액 * 인원수 -->
	         <div class="flex-grow-1">
	         	<div>
	              <label id = "pricelabel" class="form-label">총 예약금액</label>
	              <label id = "fprices"></label> <label>원</label>
	         	</div>
	              	<input type="hidden" class="form-control" name="rprice"  value="" required>
	          </div>
	        </c:otherwise>
		</c:choose>
          
            <div class="col-mb-3">
	           <label for="rname" class="form-label">예약자명</label>
	            <input type="text" class="form-control" id="rname" name = "rname" required>
            </div>
            
            <div class="col-mb-3">
	           <label for="rphone" class="form-label">휴대폰번호</label>
	            <input type="text" class="form-control" id="rphone" name = "rphone" required>
            </div>
            
            <div class="col-mb-3">
	           <label for="remail" class="form-label">이메일</label>
	            <input type="text" class="form-control" id="remail" name = "remail" required>
            </div>
	</div>
	
    	<div class="vstack gap-2 col-md-3 mx-auto">
		  <button type="submit" class="btn btn-danger">예약</button>
		</div>
</main>
</form>

<!-- 예약 폼 끝 -->
<!-- 디테일 사진 시작 -->
<c:choose>
	<c:when test="${not empty pproduct }">
		<div id = "img">
		    <img src = "/images/${pproduct.fname}"  />
			<div id="map" style="width:812px;height:300px;"></div>
		</div>
	</c:when>
	<c:otherwise>
		<div id = "img">
		    <img src = "/images/${fproduct.fname}"  />
			<div id="map" style="width:812px;height:300px;"></div>
		</div>
	</c:otherwise>
</c:choose>
<!-- 디테일 사진 끝 -->

<!-- 지도를 표시할 div -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9c25eec12b76614d844bfdc96d4acd9"></script>
<script>
<c:choose>
	<c:when test="${not empty pproduct }">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
		center: new kakao.maps.LatLng(${pproduct.latitude}, ${pproduct.longitude}), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
		};
		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${pproduct.latitude}, ${pproduct.longitude}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
	</c:when>
	<c:otherwise>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
		center: new kakao.maps.LatLng(${fproduct.latitude}, ${fproduct.longitude}), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
		};
		
		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${fproduct.latitude}, ${fproduct.longitude}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);  
	</c:otherwise>
</c:choose>
</script>
<script type="text/javascript">
<c:choose>
	<c:when test="${not empty pproduct}">
	// 패키지 인원수 선택시 총 금액 합산 값 + 화면표시 이벤트.
	function ppriceChange(rp){
		const pprice = rp.value * ${pproduct.price};
		document.getElementById("pprices").innerText = pprice;
		$('input[name=rprice]').attr('value', pprice);
		
		// 예약가능인원 초과시 리셋
			var rnump = $('#pnump').val();
			if(rnump > ${aNump}){
				alert('상품이 마감 되었습니다.');
				location.href = "/tripfu/pc/pdetail/${pnum}";				
			}		
	}
	</c:when>
    <c:otherwise>
	// 자유 인원수 선택시 총 금액 합산 값 + 화면표시 이벤트.
 	function fpriceChange(rp){
 		const fprice = rp.value * ${fproduct.price};
 		document.getElementById("fprices").innerText = fprice;
 		$('input[name=rprice]').attr('value', fprice);
 	}
	</c:otherwise>
</c:choose>
	// 예약정보 전달.
	function reservation(){
		
		if(!confirm('예약 하시겠습니까?')){
			return;
		}

		var sdate_val = $('#sdate').val();
		var edate_val = $('#edate').val();
		var nump_val = $('#nump').val();
		var rname_val = $('#rname').val();
		var rphone_val = $('#rphone').val();
		var remail_val = $('#remail').val();
		
		if(sdate_val == ''){
			alert('출발일은 필수입력 항목입니다.')
			return;
		}
		if(edate_val == ''){
			alert('도착일은 필수입력 항목입니다.')
			return;
		}
		if(nump_val == ''){
			alert('인원수는 필수입력 항목입니다.')
			return;
		}
		if(rname_val == ''){
			alert('예약자 성함은 필수입력 항목입니다.')
			return;
		}
		if(rphone_val == ''){
			alert('예약자 휴대폰번호는 필수입력 항목입니다.')
			return;
		}
		if(remail_val == ''){
			alert('예약자 이메일은 필수입력 항목입니다.')
			return;
		}
		
		var rvpd = $('#reservationForm').serialize();
		
		$.ajax({
			url : '/tripfu/rv/pd',
			method : 'post',
			cache : false,
			data : rvpd,
			dataType : 'json',
			success : function(res){
				if(res.ok){
					alert('예약 되었습니다.');
					location.href = "/tripfu/mypage/reservationList/1?mnum=${mnum}";
				} else {
					alert('로그인이 필요한 페이지입니다.');
					location.href = "/tripfu/login";
				}	
			},
			error : function(xhr, status, err){
				alert('에러 : ' + xhr, status, err);
			}
		});
		return false;
	}
</script>

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
  </body>
</html>
