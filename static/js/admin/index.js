	// 패키지 상품 삭제
	function pdeleted(pnum){
		if(!confirm('상품을 삭제하시겠습니까?')){
			location.href = "/tripfu/admin";
		}
		var obj = {};
		obj.pnum = pnum;
		
		$.ajax({
			url : '/tripfu/admin/pdelete',
			method : 'post',
			cache : false,
			data : obj,
			dataType : 'json',
			success : function(res){
				alert(res.deleted ? '상품이 삭제되었습니다.' : '상품 삭제를 실패했습니다.');
				location.href = "/tripfu/admin";
			},
			error : function(xhr, status, err){
				alert('에러 : ' + xhr + status + err);
			}
		});
	}
	
	// 자유 상품 삭제
	function fdeleted(pnum){
		if(!confirm('상품을 삭제하시겠습니까?')){
			return location.href = "/tripfu/admin";
		}
		var obj = {};
		obj.pnum = pnum;
		
		$.ajax({
			url : '/tripfu/admin/fdelete',
			method : 'post',
			cache : false,
			data : obj,
			dataType : 'json',
			success : function(res){
				alert(res.deleted ? '상품이 삭제되었습니다.' : '상품 삭제를 실패했습니다.');
				location.href = "/tripfu/admin";
			},
			error : function(xhr, status, err){
				alert('에러 : ' + xhr + status + err);
			}
		});
	}
