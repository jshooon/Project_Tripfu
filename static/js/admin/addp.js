        	function addpProduct(){
        		
		        if(!confirm('상품을 등록하시겠습니까?')){
		        	return;
		        }
		        // 입력항목 체크 변수 선언.
		         var pname_val = $('#pname').val();
				 var area_val = $('#area').val();
		         var type_val = $('#type').val();
				 var price_val = $('#price').val();
				 var sdate_val = $('#sdate').val();
				 var edate_val = $('#edate').val();
				 var fname_val = $('#fname').val();
				 var ifname_val = $('#ifname').val();
				 var pnump_val = $('#pnump').val();
				 var ptitle_val = $('#ptitle').val();
				 var pcontents_val = $('#pcontents').val();
				 var latitude_val = $('#latitude').val();
				 var longitude_val = $('#longitude').val();
		 

		 		// 상품명 체크확인
        		if(pname_val == ''){
    				alert('상품명은 필수입력 항목입니다.');
    				return;
    			}
		 		// 지역명 체크확인
        		if(area_val == ''){
    				alert('지역명은 필수입력 항목입니다.');
    				return;
    			}
		 		// 여행유형 체크확인
        		if(type_val == ''){
    				alert('여행유형은 필수입력 항목입니다.');
    				return;
    			}
		 		// 상품가격 체크확인
        		if(price_val == ''){
    				alert('상품가격은 필수입력 항목입니다.');
    				return;
    			}
		 		// 출발일 체크확인
        		if(sdate_val == ''){
    				alert('출발일은 필수입력 항목입니다.');
    				return;
    			}
		 		// 도착일 체크확인
        		if(edate_val == ''){
    				alert('도착일은 필수입력 항목입니다.');
    				return;
    			}
		 		// 상세사진 체크확인
        		if(fname_val == ''){
    				alert('상세사진은 필수입력 항목입니다.');
    				return;
    			}
		 		// 홈사진 체크확인
        		if(ifname_val == ''){
    				alert('홈사진은 필수입력 항목입니다.');
    				return;
    			}
		 		// 상품인원 체크확인
        		if(pnump_val == ''){
    				alert('상품인원은 필수입력 항목입니다.');
    				return;
    			}
		 		// 상품제목 체크확인
        		if(ptitle_val == ''){
    				alert('상품제목은 필수입력 항목입니다.');
    				return;
    			}
		 		// 상품내용 체크확인
        		if(pcontents_val == ''){
    				alert('상품내용은 필수입력 항목입니다.');
    				return;
    			}
		 		// 위도 체크확인
        		if(latitude_val == ''){
    				alert('위도는 필수입력 항목입니다.');
    				return;
    			}
		 		// 경도 체크확인
        		if(longitude_val == ''){
    				alert('경도는 필수입력 항목입니다.');
    				return;
    			}
        		
        		
        		// 폼 데이터 변환 후 변수저장.
        		var serData = $('#addpForm').serialize();
        		
        		// 폼 데이터 값 post방식으로 서버 전달.
        		$.ajax({
        			url : '/tripfu/admin/addPproduct',
        			method : 'post',
        			cache : false,
        			data : serData,
        			dataType : 'json',
        			success : function(res){
        				alert(res.ok ? '상품이 등록되었습니다.' : '상품등록을 실패하였습니다.');
        				if(res.ok) location.href = "/tripfu/admin";
        			},
        			error : function(xhr, status, err){
        				alert('에러 : ' + xhr, status, err);
        			}
        		});
        		return false;
        	}
        	        	
        	// 회원탈퇴 
        	function secession(){
        		if(!confirm('회원탈퇴 하시 겠습니까?')){
        			return;
        		}
        		
        		// 제이슨 오브젝트 변수에 회원번호 값 저장.
           		var mnum = $('#mnum').val();
        		
        		var obj = {};
        		obj.mnum = mnum;
        		
        		// 회원번호 post방식으로 서버 전달.
        		$.ajax({
        			url : '/tripfu/secession',
        			method : 'post',
        			cache : false,
        			data : obj,
        			dataType : 'json',
        			success : function(res){
        				alert(res.secession ? 'Tripfu를 이용해주셔서 감사합니다.' : '회원탈퇴가 불가능 합니다.');
        				location.href = "/tripfu/logout";
        			},
        			error : function(xhr, status, err){
        				alert('에러 : ' + xhr + status + err);
        			}
        		});
        	}