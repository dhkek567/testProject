<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="page-header min-vh-100">
	<div class="container">
		<div class="row">
			<div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
				<div class="position-relative bg-gradient-info h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center"
					style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/illustrations/illustration-lock.jpg'); background-size: cover;">
				</div>
			</div>
			<div
				class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
				<div class="card card-plain">
					<div class="card-header">
						<h4 class="font-weight-bolder">회원가입</h4>
						<p class="mb-0">회원등록 후, 저희 서비스와 함께해요!</p>
					</div>
					<div class="card-body">
						<form role="form" method="post" action="/signup.do" id="signupForm">
							<font class="font-weight-bold text-xs mt-1 mb-0 error">${errors.memId }</font>
							<div class="input-group input-group-outline mb-3">
								<input type="text" class="form-control" id="memId" name="memId" placeholder="아이디">
							</div>
							<font class="text-primary font-weight-bold text-xs mt-1 mb-0 error">${errors.memPw }</font>
							<div class="input-group input-group-outline mb-3">
								<input type="text" class="form-control" id="memPw" name="memPw" placeholder="비밀번호">
							</div>
							<div class="input-group input-group-outline mb-3">
								<input type="text" class="form-control" id="memPwRe" placeholder="비밀번호 재입력">
							</div>
							<font class="text-primary font-weight-bold text-xs mt-1 mb-0 error">${errors.memName }</font>
							<div class="input-group input-group-outline mb-3">
								<input type="text" class="form-control" id="memName" name="memName" placeholder="이름">
							</div>
							<font class="font-weight-bold text-xs mt-1 mb-0 error">${errors.memNickname }</font>
							<div class="input-group input-group-outline mb-3">
								<input type="text" class="form-control" id="memNickname" name="memNickname" placeholder="닉네임">
								<input type="button" class="form-control" id="nickChkBtn" value="중복확인"/>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" id="agree" value="Y"> 
								<label class="form-check-label" for="agree">개인정보 동의</label>
							</div>
							<font class="text-primary font-weight-bold text-xs mt-1 mb-0 error"></font>
							<div class="text-center">
								<button type="button" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" id="signupBtn">가입하기</button>
							</div>
						</form>
					</div>
					<div class="card-footer text-center pt-0 px-lg-2 px-1">
						<p class="mb-2 text-sm mx-auto">
							우리 서비스 회원이세요? 
							<a href="/signin.do" class="text-primary text-gradient font-weight-bold">로그인</a>
						</p>
						<font class="text-primary font-weight-bold text-xs mt-1 mb-0 error"></font>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var signupForm = $("#signupForm");
	var signupBtn = $("#signupBtn");
	var memId = $("#memId");
	var nickChkBtn = $("#nickChkBtn");
	var idFlag = false; // 아이디 중복 체크 여부 flag
	var nickFlag = false; // 닉네임 사용 여부 flag
	
	
	// memId에 키보드 입력 이벤트가 일어났을 떄 
	memId.keyup(function(){
		var id = $(this).val();
		
		if(id.length < 4){
			errPrint(0, "아이디는 4자리부터 시작합니다.", "red")
			return false;
		}
		
		var data ={
				memId : id
		}
		
		$.ajax({
			type : "post",
			url : "/idCheck.do",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "text",		//produces 를 사용했기 때문에 dataType 작성 필수
			success : function(res){
				if(res == "NOTEXIST"){
					errPrint(0, "사용가능한 아이디 입니다.", "green");
					idFlag = true;
				}else{
					errPrint(0, "아이디가 중복됩니다.", "red");
					idFlag = false;
				}
			}
		});
	});
	
	nickChkBtn.on("click", function(){
		var nickname = $("#memNickname").val();
		
		if(nickname == null || nickname == ""){
			errPrint(3, "닉네임을 입력해주세요.", "red");
			return false
		}
		
		var data = {
				memNickname : nickname
		}
		
		$.ajax({
			type : "post",
			url : "/nickNameCheck.do",
			data : JSON.stringify(data),
			dataType : "text",
			contentType : "application/json;charset=utf-8",
			success : function(res){
				if(res == "NOTEXIST"){
					errPrint(3, "사용가능한 닉네임입니다", "green");
					nickFlag = true;
				}else{
					errPrint(3, "중복된 닉네임입니다.","green");
					nickFlag = false;
				}
			}
			
		})
	});
	
	
	
	signupBtn.on("click", function(){
		var color = "red";	// 에러를 표시하기 위한 색깔(기본 빨강색)
		var id = $("#memId").val();
		var pw = $("#memPw").val();
		var pwre = $("#memPwRe").val();
		var name = $("#memName").val();
		var nickname = $("#memNickname").val();
		var agree = $("#agree:checked").val();
		var pwFlag = true;	// 비밀번호 일치 여부(비밀번호 = 재입력 비밀번호)
		var agreeFlag = false;
		
		errInit(); // 기존 에러메시지 초기화 
		
		// alert를 이용한 알림창 대신 에러 텍스트를 에러 표시자리에 출력
		if(id == null || id == ""){
			errPrint(0, "아이디를 입력해주세요.", color);
			return false;
		}
		
		if(pw == null || pw == ""){
			errPrint(1, "비밀번호를 입력해주세요.", color);
			return false;
		}
		
		if(pwre == null || pwre == ""){
			errPrint(1, "비밀번호 재입력을 입력해주세요.", color);
			return false;
		}
		if(pw != pwre){
			errPrint(1, "비밀번호가 일치하지 않습니다..", color);
			pwFlag = false; 	// 비밀번호 불일치
			return false;
		}
		
		if(name == null || name == ""){
			errPrint(2, "이름을 입력해주세요.", color);
			return false;
		}
		if(nickname == null || nickname == ""){
			errPrint(3, "닉네임을 입력해주세요.", color);
			return false;
		}
		// 개인정보 처리방침 동의여부 (방법1)
// 		if(agree != "Y"){
// 			errPrint(4, "개인정보 동의를 체크해주세요.", color);
// 			return false;
// 		}else{
// 			agreeFlag = true;  // 동의 체크
// 		}
		
		// 개인정보 처리방침 동의여부 (방법2)
		if($("#agree").is(":checked")){
			agreeFlag = true; // 동의 체크
		}else{
			errPrint(4, "개인정보 동의를 체크해주세요.", color);
			return false;
		}
		
		if(pwFlag && idFlag && nickFlag && agreeFlag){
			signupForm.submit();
		}else{
			if(!pwFlag)
				errPrint(5, "비밀번호가 일치하지 않아 진행할 수 없습니다.", color);
			if(!idFlag)
				errPrint(5, "아이디 중복체크를 진행해주세요.", color);
			if(!nickFlag)
				errPrint(5, "닉네임 중복체크를 진행해주세요.", color);
			if(!agreeFlag)
				errPrint(5, "개인정보 동의에 체크되어 있지 않습니다.", color);
		}
	});
});

function errPrint(idx, msg, color){
	$(".error:eq("+idx+")").text(msg).attr("color", color);
}

function errInit(){
	$(".error").text(""); //에러 메시지를 전부 초기화 
}
</script>















