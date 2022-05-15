		function login(){
			
			var email_val = $('#email').val();
			var pwd_val = $('#pwd').val();
			
			if(email_val == ''){
				alert('이메일은 필수입력 항목입니다.')
			}
			if(pwd_val == ''){
				alert('패스워드는 필수입력 항목입니다.')
			}
			
			var serData = $('#loginForm').serialize();
			
			$.ajax({
				url:'/tripfu/admin/login',
				method:'post',
				cache:false,
				data:serData,
				dataType:'json',
				success:function(res){
						alert(res.ok ? '관리자님 환영합니다.' : '아이디, 비밀번호를 확인해 주세요.');
						
						if(res.ok) location.href = "/tripfu/admin";
				},
				error:function(xhr,status,err){
					alert('이메일, 비밀번호를 확인해 주세요.');
				}
			});
			return false;
		}