	// 패키지상품 찜목록에 추가
	function addpcart(cpnum){
	 
		var obj = {};
		obj.cpnum = cpnum;
		
		$.ajax({
			url : '/tripfu/pc/addpcart',
			method : 'post',
			cache : false,
			data : obj,
			dataType : 'json',
			success : function(res){
				alert(res.save ? '상품을 찜하셨습니다!' : '이미 찜한 상품입니다.');
				if(res.save) location.href = "/tripfu/mypage/cartList";
			},
			error : function(xhr, status, err){
				alert('에러 : ' + xhr, status, err);
			}
		});
		
 	}
	// 자유상품 찜목록에 추가
	function addfcart(cpnum){
	 
		var obj = {};
		obj.cpnum = cpnum;
		
		$.ajax({
			url : '/tripfu/pc/addfcart',
			method : 'post',
			cache : false,
			data : obj,
			dataType : 'json',
			success : function(res){
				alert(res.save ? '상품을 찜하셨습니다!' : '이미 찜한 상품입니다.');
				if(res.save) location.href = "/tripfu/mypage/cartList";
			},
			error : function(xhr, status, err){
				alert('에러 : ' + xhr, status, err);
			}
		});
		
 	}
		$("button[id^=cartbtn]").on('click',function(){
			console.log($("button[id^=cartbtn]").val);
            if(clicked){
                $(this).css('background-color', 'red');
                clicked  = false;
            }
		});
		
	// 날씨
	//<c:choose>
		//<c:when test="${not empty ws}">
			$(document).ready(function() {
				
				$.ajax({
					url:'http://api.openweathermap.org/data/2.5/weather?q=' + 'seoul' + '&appid=0c62a3ebf630a12f44a747a608a22b12&units=metric',
					dataType:'json',
					type:'GET',
					success:function(data){
					
					var $Icon = data.weather[0].icon;
					var $Temp = Math.floor(data.main.temp) + 'º';
					var $city = data.name;
					$('.CurrIcon').append('<img src ="http://openweathermap.org/img/wn/' + $Icon + '.png"/>');
					$('.CurrTemp').prepend($Temp);
					$('.City').append($city);
					}
					})
				});
		//</c:when>
		//<c:otherwise>
		//	$(document).ready(function() {
		//		$.ajax({
		//			url:'http://api.openweathermap.org/data/2.5/weather?q=' + '${ws}' + '&appid=0c62a3ebf630a12f44a747a608a22b12&units=metric',
		//			dataType:'json',
		//			type:'GET',
		//			success:function(data){
		//			
		//			var $Icon = data.weather[0].icon;
		//			var $Temp = Math.floor(data.main.temp) + 'º';
		//			var $city = data.name;
		//			$('.CurrIcon').append('<img src ="http://openweathermap.org/img/wn/' + $Icon + '.png"/>');
		//			$('.CurrTemp').prepend($Temp);
		//			$('.City').append($city);
		//			}
		//			})
		//		});
	//	</c:otherwise>
//	</c:choose>