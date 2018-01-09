<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>로그인</title>
<script type="text/javascript">
$(document).ready(function() {
    $("#checkBtn").on("click", function() {
    	LoginFunction();
    });
});

function LoginFunction(){
	var userID = $('#userID').val();
	var userPassword = $('#userPassword').val();

	$.ajax({
		type : 'POST',
		url : '../login.do',
		//파리미터 변수 이름 : 값
		data: {userID : userID, userPassword : userPassword},
		success : function(result){
			if(result == 1) {
				opener.location.reload();
				window.close();
			}
		}
	});
}
</script>
</head>
<body>

	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="../login.do">
					<h3 style="text-align: center;">로그인화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" id="userID" maxlength="20">
					</div>
					<div class="form-group">	
						<input type="password" class="form-control" placeholder="비밀번호" id="userPassword" maxlength="20">
					</div>
					<input type="button" id="checkBtn" class="btn btn-primary form-control" value="로그인" onclick="LoginFunction()">
				</form>
		</div>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>