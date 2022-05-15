        // 휴대폰 체크확인 위한 변수 선언.
       	 var pchecked = false;
        
        
        	function updated(){
        		
        // 입력항목 체크 변수 선언.
		 var pwd = $('#pwd').val();
		 
		 		// 휴대폰번호 체크확인
        		if(pchecked == false){
    				alert('휴대폰번호 중복을 확인 하세요.');
    				return;
    			}
        		// 비밀번호 확인
        		if(pwd_val =='') {
        			alert('비밀번호는 필수입력 항목입니다.');
        			return false;
        		}
        		// 휴대폰번호 확인
        		if(phone =='') {
        			alert('휴대폰번호는 필수입력 항목입니다.');
        			return false;
        		}
        		
        		// 폼 데이터 변환 후 변수저장.
        		var serData = $('#updateForm').serialize();
        		
        		// 폼 데이터 값 post방식으로 서버 전달.
        		$.ajax({
        			url : '/tripfu/mypage/memberEdit',
        			method : 'post',
        			cache : false,
        			data : serData,
        			dataType : 'json',
        			success : function(res){
        				alert(res.updated ? '개인정보가 변경되었습니다.' : '잘못된 정보를 입력 하셨습니다.');
        				if(res.updated) location.href = "/tripfu/mypage";
        			},
        			error : function(xhr, status, err){
        				alert('에러 : ' + xhr, status, err);
        			}
        		});
        		return false;
        	}
        	
        	// 휴대폰 중복 체크
        	function pcheck(){
        		var phone = $('#phone').val();
        		var phoneRegExp = /^[0-9]{10,11}$/;
        		if(phone==''){
        			alert('휴대폰번호는 필수입력 항목입니다.');
        			return;
        		}
        		if (!phoneRegExp.test(phone)) {
        			alert('휴대폰 번호 양식을 확인해주세요.');
        			return false;
        		}
        		
        		// 제이슨 오브젝트 변수에 휴대폰 값 저장.
        		var obj = {};
        		obj.phone = phone;
        		
        		// 휴대폰 데이터 값 post방식으로 서버 전달.
        		$.ajax({
        			url : '/tripfu/pcheck',
        			method : 'post',
        			cache : false,
        			data : obj,
        			dataType : 'json',
        			success : function(res){
        				alert(res.pcheck ? '사용가능한 휴대폰 번호 입니다.' : '이미 등록된 휴대폰번호 입니다.');
        				pchecked = res.pcheck;
        			},
        			error : function(xhr, status, err){
        				alert('에러 : ' + xhr + status + err);
        			}
        		});
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