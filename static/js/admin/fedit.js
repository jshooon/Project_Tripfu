        // 자유 상품 업데이트
        	function fupdate(){
        		
		        if(!confirm('상품을 수정하시겠습니까?')){
		        	return;
		        }
		        // 입력항목 체크 변수 선언.
		         var pname_val = $('#pname').val();
				 var area_val = $('#area').val();
		         var type_val = $('#type').val();
				 var price_val = $('#price').val();
				 var fname_val = $('#fname').val();
				 var ifname_val = $('#ifname').val();
				 var ptitle_val = $('#ptitle').val();
				 var pcontents_val = $('#pcontents').val();
		 

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
        		
        		
        		// 폼 데이터 변환 후 변수저장.
        		var serData = $('#fupdateForm').serialize();
        		
        		// 폼 데이터 값 post방식으로 서버 전달.
				$.ajax({
					url : '/tripfu/admin/fupdate',
					method : 'post',
					cache : false,
					data : serData,
					dataType : 'json',
					success : function(res){
						alert(res.update ? '상품이 수정 되었습니다.' : '상품 수정을 실패했습니다.');
						location.href = "/tripfu/admin";
					},
					error : function(xhr, status, err){
						alert('에러 : ' + xhr + status + err);
					}
				});
        		return false;
        	}