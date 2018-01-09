<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <script src="js/bootstrap.js"></script> -->
<script type="text/javascript">

$(document).ready(function() {
    $("#checkBtn").on("click", function() {
       	registerCheckFuntion();
    });
    $("#register").on("click", function() {
       	registerFuntion();
    });
});

	function registerCheckFuntion(){
		var userID = $('#userID').val();
		$.ajax({
			type : 'POST',
			url : '../UserRegisterCheckServlet',
			//파리미터 변수 이름 : 값
			data: {userID : userID},
			success : function(result){
				if(result == 1) {
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				}else{
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-warning');

				}
				$('#checkModal').modal("show");
			}
		});
	}
	
	function registerFuntion(){
		alert("z");
		var userID = $('#userID').val();
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		var userName = $('#userName').val();
		var userAge = $('#userAge').val();
		var userPhone = $('#userPhone').val();
		var userGender = $('#userGender').val();
		var userEmail = $('#userEmail').val();
		
		$.ajax({
			type : 'POST',
			url : '../.login',
			//파리미터 변수 이름 : 값
			data: {userID : userID, userPassword1 : userPassword1, userPassword2 : userPassword2,
				userName : userName, userAge : userAge, userPhone : userPhone, userGender : userGender,
				userEmail : userEmail},
			success : function(result){
				if(result == 1) {
					opener.location.reload();
					window.close();
				}
			}
		});
	}
	function passwordCheckFunction(){
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if(userPassword1 != userPassword2){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		}else{
			$('#passwordCheckMessage').html('비밀번호가 맡아용');
		}
	}
</script>
<title>회원가입</title>
</head>
<body>
	<div class="container">
		<form method="post" action="../.login">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" ><h4 style="text-align: center">회원 등록 양식</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5>
						<td>
						<input class="form-control" type="text" id="userID" name="userID" maxlength="20" required="required" placeholder="아이디를 입력해주세요.">
						</td>
						<td style="width: 110px;">
						<button class="btn btn-primary"  type="button" id="checkBtn">중복체크</button>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5>
						<td colspan="2">
						<input class="form-control" type="password" onkeyup="passwordCheckFunction()"; id="userPassword1" id="userPassword1" maxlength="20" required="required" placeholder="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 120px;"><h5>비밀번호 확인</h5>
						<td colspan="2">
						<input class="form-control" type="password" onkeyup="passwordCheckFunction()"; id="userPassword2" id="userPassword2" maxlength="20" required="required" placeholder="비밀번호 확인을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="userName" id="userName" maxlength="20" required="required" placeholder="이름을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>나이</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="userAge" id="userAge" maxlength="20" required="required" placeholder="나이를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>연락처</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="userPhone" id="userPhone" maxlength="20" required="required" placeholder="연락처를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>성별</h5>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin: 0 auto;">
									<label class="btn btn-primary">
										<input type="radio" id="userGender" autocomplete="off" value="남자" checked>남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" id="userGender" autocomplete="off" value="여자">여자
									</label>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5>
						<td colspan="2">
						<input class="form-control" type="email" id="userEmail" name="userEmail" maxlength="20" required="required" placeholder="ex ) abcd12@google.com">
						</td>
					</tr>
					<tr>
						<td style="text-align: right" colspan="3">
						<h5 style="color : red;" id="passwordCheckMessage"></h5>
						<input class="btn btn-primary pull-right" type="button" value="회원가입" id="register" onclick="registerFunction()">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%
		String messageContent = null;
		 if(session.getAttribute("messageContent") != null){
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String) session.getAttribute("messageType");
		}
		if(messageContent != null){
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
		 	<div class="modal-dialog vertical-align-center">
		 		<div class="modal-content" <% if(messageType.equals("오류메세지")) out.println("panel-warning"); else out.println("panel-success"); %>>
		 			<div class="modal-header panel-heading">
		 				<button type="button" class="close" data-dismiss="modal">
		 					<span aria-hidden="true">&times;</span>
		 					<span class="sr-only">Close</span>
		 				</button>
		 				<h4 class="modal-title">
		 					<%= messageType %>
		 				</h4>
		 			</div>
		 			<div class="modal-body">
		 				<%= messageContent %>
		 			</div>
		 			<div class="modal-footer">
		 				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
		 			</div>
		 		</div>
			 </div>
		</div>
	</div>
	<script>
		$('#messageModal').modal('show');
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
		 	<div class="modal-dialog vertical-align-center">
		 		<div id="checkType" class="modal-content panel-info">
		 			<div class="modal-header panel-heading">
		 				<button type="button" class="close" data-dismiss="modal">
		 					<span aria-hidden="true">&times;</span>
		 					<span class="sr-only">Close</span>
		 				</button>
		 				<h4 class="modal-title">
		 					확인메세지
		 				</h4>
		 			</div>
		 			<div>
		 				<h5 class="modal-body" id="checkMessage"></h5>
		 			</div>
		 			<div class="modal-footer">
		 				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
		 			</div>
		 		</div>
			 </div>
		</div>
	</div>
	
	
<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script> -->
</body>
</html>