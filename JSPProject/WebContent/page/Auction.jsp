<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>금액</title>
</head>
<script type="text/javascript">

$(document).ready(function() {
    $("#checkBtn").on("click", function() {
    	ActionFunction();
    });
});

function ActionFunction(){
	var price = $('#price').val();
	var board_num = $('#board_num').val();
	var ex_price = $('#setPrice').val();
	var ex_price1 = ex_price.replace('￦','');
	var ex_price2 = ex_price1.replace(',','');
	if(price < ex_price2)
	{
		alert(price);
		alert(ex_price2);
		alert("기존 값보다 비싼 가격을 제시해주세요.");
		return;
	}
	$.ajax({
		type : 'POST',
		url : '../AcutionServlet',
		//파리미터 변수 이름 : 값
		data: {price : price, board_num : board_num},
		success : function(result){
			if(result == 1) {
				opener.location.reload();
				window.close();
			}
		}
	});
}
	function getText(){
		<%int num = Integer.parseInt((String)request.getParameter("num"));
		System.out.println(num);%>
		var num = <%=num%>
		
		document.getElementById("setPrice").value = opener.document.getElementById("price"+(num+1)).value;
		document.getElementById("board_num").value = opener.document.getElementById("price"+(num+1)+"_board_Num").value;
	}
	
	function setText(){
		opener.document.getElementById("price1").value = document.getElementById("price").value;
		/* document.form.action = "../auction.do?product_type=A"
		documnet.form.submit(); */
		
		opener.location.reload();
		window.close();
	}
</script>
<body onLoad = "getText()">


	<!-- <nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
		<a class="navbar-brand" href="main.jsp">jsp 게시판 웹사이트</a>
		</div>
	</nav> -->
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method = "post" action = "../auction.do" id = "form">
					<h3 style="text-align: center;">금액수정</h3>
					<div class="form-group">
						<input type="text" class="form-control" maxlength="20" id = "setPrice" readonly>
					</div>
					<div class="form-group">	
						<input type="text" class="form-control" maxlength="20" id = "price">
						<input type="hidden" id = "board_num">
					</div>
					<input type="button" class="btn btn-primary form-control" value="등록" id = "checkBtn" onclick = "ActionFunction()">
				</form>
		</div>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	
</body>
</html>