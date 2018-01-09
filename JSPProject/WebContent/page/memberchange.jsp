<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import = "dao.UserDAO"; %>
<%@ page import = "java.sql.Connection"; %>
<%@ page import = "java.sql.PreparedStatement"; %>
<%@ page import = "java.sql.ResultSet"; %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form method="post" action="">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" ><h4 style="text-align: center">회원 정보 변경</h4>
					</tr>
				</thead>
				<% 
					/* Connection con = null;
					PreparedStatement ps = null;
					ResultSet rs = null; */
					
					/* public Connection getConnection()
					{//Connection  -> dbcp (서버가 db와의 connection을 대신 해준다.)		
						Context ctx;
						try {
							ctx = new InitialContext();
							ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MySQL");
							con = ds.getConnection();
						} catch (Exception e) {
							System.out.println("DB 커넥션 실패 : " + e);
						}
						return con;
					} */
				%>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5>
						<td>
						<input class="form-control" type="text" id="userID" name="userID" maxlength="20">
						</td>
						
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5>
						<td colspan="2">
						<input class="form-control" type="password" onkeyup="passwordCheckFunction()"; id="userPassword1" name="userPassword1" maxlength="20" required="required" placeholder="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="userName" name="userName" maxlength="20" required="required" placeholder="이름을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>나이</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="userAge" name="userAge" maxlength="20" required="required" placeholder="나이를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>연락처</h5>
						<td colspan="2">
						<input class="form-control" type="text" id="userPhone" name="userPhone" maxlength="20" required="required" placeholder="연락처를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>성별</h5>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin: 0 auto;">
									<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="여자">여자
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
						<input class="btn btn-primary pull-right" type="submit" value="회원가입">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>