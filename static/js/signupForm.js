        // 이메일 체크확인 위한 변수 선언.
       	 var echecked = false;
        
        
        	function signup(){
        // 입력항목 체크 변수 선언.
		 var pwd = $('#pwd').val();
         var name = $('#name').val();
		 var birth = $('#birth').val();
		 var phone = $('#phone').val();
		 var pwdRegExp = /^[a-zA-z0-9]{4,12}$/;
		 var nameRegExp = /^[가-힣]{2,5}$/;
		 var birthRegExp = /^[0-9]{6}$/;
		 var phoneRegExp = /^[0-9]{10,11}$/;
        		
        		if(echecked == false){
    				alert('이메일 중복을 확인 하세요.');
    				return;
    			}
        		
        		if (!pwdRegExp.test(pwd)) {
        			alert('비밀번호 양식을 확인해주세요.');
        			return false;
        		}
        		if(pwd =='') {
        			alert('비밀번호는 필수입력 항목입니다.');
        			return false;
        		}
        		
        		if (!nameRegExp.test(name)) {
        			alert('이름 양식을 확인해주세요.');
        			return false;
        		}
        		if(name =='') {
        			alert('이름은 필수입력 항목입니다.');
        			return false;
        		}
        		
        		if (!birthRegExp.test(birth)) {
        			alert('생년월일 양식을 확인해주세요.');
        			return false;
        		}
        		if(birth =='') {
        			alert('생년월일은 필수입력 항목입니다.');
        			return false;
        		}
        		
        		if (!phoneRegExp.test(phone)) {
        			alert('휴대폰 번호 양식을 확인해주세요.');
        			return false;
        		}
        		if(phone =='') {
        			alert('휴대폰번호는 필수입력 항목입니다.');
        			return false;
        		}
        		
        		var serData = $('#signupForm').serialize();
        		
        		$.ajax({
        			url : '/tripfu/signup',
        			method : 'post',
        			cache : false,
        			data : serData,
        			dataType : 'json',
        			success : function(res){
        				alert(res.signup ? '회원가입 되었습니다.' : '잘못된 정보를 입력 하셨습니다.');
        				if(res.signup) location.href = "/tripfu/login";
        			},
        			error : function(xhr, status, err){
        				alert('에러 : ' + xhr, status, err);
        			}
        		});
        		return false;
        	}
        	
        	
        	function echeck(){
        		var email = $('#email').val();
        		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        		
        		if (!emailRegExp.test(email)) {
        			alert('이메일 양식을 확인해주세요.');
        			return false;
        		}
        		
        		if(email==''){
        			alert('이메일은 필수입력 항목입니다.');
        			return;
        		}
        		
        		var obj = {};
        		obj.email = email;
        		
        		$.ajax({
        			url : '/tripfu/echeck',
        			method : 'post',
        			cache : false,
        			data : obj,
        			dataType : 'json',
        			success : function(res){
        				alert(res.echeck ? '사용가능한 email 입니다.' : '사용할 수 없는 email 입니다.');
        				echecked = res.echeck;
        			},
        			error : function(xhr, status, err){
        				alert('에러 : ' + xhr + status + err);
        			}
        		});
        	}