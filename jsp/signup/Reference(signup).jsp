<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tripfu [회원가입]</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <style>
        	.title {text-align: center;}
        	.form-control-4nth {width : 200px;} 
        </style>
    </head>
    <body>
        <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            
            <div class="row">
                <p></p>
                <div class="col-md-12">
                    <small>
                    <a href="#">홈</a> | <a href="#">로그인</a>
                    </small>
                </div>
            </div>
            <!--// 헤더 들어가는 부분 -->
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
            <!-- 본문 들어가는 부분 -->
                
 		<h2 class = "title">회원가입</h2>
 
            <form class="form-horizontal" role="form" method="post" action="javascript:alert( 'success!' );">
            
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="email" data-rule-required="true" placeholder="ex) Tripfu@abc.com" maxlength="40">
                    </div>
                </div>
                
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
                    <div class="col-lg-10">
                        <label class="radio-inline">
                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="M" checked> 남
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="F"> 여
                        </label>
                    </div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </div>
                </div>
            </form>
        
        
        <script>
        
            $(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                
                $('.onlyAlphabetAndNumber').keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                    }
                });
                
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
            
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
                
                //------- 검사하여 상태를 class에 적용
                $('#id').keyup(function(event){
                    
                    var divId = $('#divId');
                    
                    if($('#id').val()==""){
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                });
                
                $('#password').keyup(function(event){
                    
                    var divPassword = $('#divPassword');
                    
                    if($('#password').val()==""){
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                });
                
                $('#passwordCheck').keyup(function(event){
                    
                    var passwordCheck = $('#passwordCheck').val();
                    var password = $('#password').val();
                    var divPasswordCheck = $('#divPasswordCheck');
                    
                    if((passwordCheck=="") || (password!=passwordCheck)){
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                });
                
                $('#name').keyup(function(event){
                    
                    var divName = $('#divName');
                    
                    if($.trim($('#name').val())==""){
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                });
                
                $('#nickname').keyup(function(event){
                    
                    var divNickname = $('#divNickname');
                    
                    if($.trim($('#nickname').val())==""){
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                    }else{
                        divNickname.removeClass("has-error");
                        divNickname.addClass("has-success");
                    }
                });
                
                $('#email').keyup(function(event){
                    
                    var divEmail = $('#divEmail');
                    
                    if($.trim($('#email').val())==""){
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                });
                
                $('#phoneNumber').keyup(function(event){
                    
                    var divPhoneNumber = $('#divPhoneNumber');
                    
                    if($.trim($('#phoneNumber').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                
                
                //------- validation 검사
                $( "form" ).submit(function( event ) {
                    
//                     var provision = $('#provision');
//                     var memberInfo = $('#memberInfo');
//                     var divId = $('#divId');
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');
                    var divName = $('#divName');
                    var divNickname = $('#divNickname');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');
                    
                    //이메일
                    if($('#email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                        $('#email').focus();
                        return false;
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                    
                    //회원가입약관
//                     if($('#provisionYn:checked').val()=="N"){
//                         modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
//                         modal.modal('show'); //모달 띄우기
                        
//                         provision.removeClass("has-success");
//                         provision.addClass("has-error");
//                         $('#provisionYn').focus();
//                         return false;
//                     }else{
//                         provision.removeClass("has-error");
//                         provision.addClass("has-success");
//                     }
                    
                    //개인정보취급방침
//                     if($('#memberInfoYn:checked').val()=="N"){
//                         modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
//                         modal.modal('show');
                        
//                         memberInfo.removeClass("has-success");
//                         memberInfo.addClass("has-error");
//                         $('#memberInfoYn').focus();
//                         return false;
//                     }else{
//                         memberInfo.removeClass("has-error");
//                         memberInfo.addClass("has-success");
//                     }
                    
                    //아이디 검사
//                     if($('#id').val()==""){
//                         modalContents.text("아이디를 입력하여 주시기 바랍니다.");
//                         modal.modal('show');
                        
//                         divId.removeClass("has-success");
//                         divId.addClass("has-error");
//                         $('#id').focus();
//                         return false;
//                     }else{
//                         divId.removeClass("has-error");
//                         divId.addClass("has-success");
//                     }
                    
                    //패스워드 검사
//                     if($('#password').val()==""){
//                         modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
//                         modal.modal('show');
                        
//                         divPassword.removeClass("has-success");
//                         divPassword.addClass("has-error");
//                         $('#password').focus();
//                         return false;
//                     }else{
//                         divPassword.removeClass("has-error");
//                         divPassword.addClass("has-success");
//                     }
                    
                    //패스워드 확인
                    if($('#passwordCheck').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                    
                    //패스워드 비교
//                     if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
//                         modalContents.text("패스워드가 일치하지 않습니다.");
//                         modal.modal('show');
                        
//                         divPasswordCheck.removeClass("has-success");
//                         divPasswordCheck.addClass("has-error");
//                         $('#passwordCheck').focus();
//                         return false;
//                     }else{
//                         divPasswordCheck.removeClass("has-error");
//                         divPasswordCheck.addClass("has-success");
//                     }
                    
                    //이름
                    if($('#name').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#name').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                    
//                     //별명
//                     if($('#nickname').val()==""){
//                         modalContents.text("별명을 입력하여 주시기 바랍니다.");
//                         modal.modal('show');
                        
//                         divNickname.removeClass("has-success");
//                         divNickname.addClass("has-error");
//                         $('#nickname').focus();
//                         return false;
//                     }else{
//                         divNickname.removeClass("has-error");
//                         divNickname.addClass("has-success");
//                     }
                    

                    
                    //휴대폰 번호
                    if($('#phoneNumber').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#phoneNumber').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                    
                
                });
                
            });
            
        </script>
                <!--// 본문 들어가는 부분 -->
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
        </div>
    </body>
</html>