
// 로그인 체크
function login(){
			
			var email = $('#email').val();
			var pwd = $('#pwd').val();
			var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
			var pwdRegExp = /^[a-zA-z0-9]{4,12}$/;
			
			if (!emailRegExp.test(email)) {
        			alert('이메일 양식을 확인해주세요.');
        			return false;
        	}
			if(email == ''){
				alert('이메일은 필수입력 항목입니다.')
			}
			
			if (!pwdRegExp.test(pwd)) {
        		alert('비밀번호 양식을 확인해주세요.');
        			return false;
        	}
			if(pwd == ''){
				alert('패스워드는 필수입력 항목입니다.')
			}
			
			var serData = $('#loginForm').serialize();
			
			$.ajax({
				url:'/tripfu/login',
				method:'post',
				cache:false,
				data:serData,
				dataType:'json',
				success:function(res){
						alert(res.ok ? 'Welcome to Tripfu!!!' : '이메일, 비밀번호를 확인해 주세요.');
						
						if(res.ok) location.href = "/tripfu";
				},
				error:function(xhr,status,err){
					alert('이메일, 비밀번호를 확인해 주세요.');
				}
			});
			return false;
		}