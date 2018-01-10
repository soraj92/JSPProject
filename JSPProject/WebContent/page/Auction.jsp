<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="../js/Example.Modal.js"></script>
<title>금액</title>
</head>
<style>
</style>
<script type="text/javascript">

	function ActionFunction() {

		var price = $('#price').val();//사용자 입력값
		var board_num = $('#board_num').val();
		var ex_price = $('#setPrice').val();//기본 값

		var end = opener.document
		.getElementById("end").value;


		if(end == 'end')
		{
			alert("불가능");
			return;
		}
		if (price == "") {
			$('#myModalLabel').html('값 입력 오류');
			$('#content').html('가격을 입력해주세요.');
			$('#myModal').modal('show');
			return;
		}
		if (isNaN(price)) {
			$('#myModalLabel').html('값 입력 오류');
			$('#content').html('숫자만 입력 가능합니다.');
			$('#myModal').modal('show');
			return;
		}
		var ex_price1 = ex_price.replace('￦', '');
		var ex_price2 = ex_price1.replace(',', '');
		price *= 1;
		ex_price2 *= 1;
		if (price < ex_price2) {
			$('#myModalLabel').html('값 입력 오류');
			$('#content').html('기존 가격보다 적은 가격을 제시 할 수 없습니다.');
			$('#myModal').modal('show');
			return;
		}
		$.ajax({
			type : 'POST',
			url : '../AcutionServlet',
			//파리미터 변수 이름 : 값
			data : {
				price : price,
				board_num : board_num
			},
			success : function(result) {
				if (result == 1) {
					opener.location.reload();
					window.close();
				}
			}
		});
	}
	function getText() {
<%int num = Integer.parseInt((String) request.getParameter("num"));%>
	var num =
<%=num%>
	document.getElementById("setPrice").value = opener.document
				.getElementById("price" + (num + 1)).value;
		document.getElementById("board_num").value = opener.document
				.getElementById("price" + (num + 1) + "_board_Num").value;
		
		var end = opener.document
		.getElementById("end").value;


		if(end == 'end')
		{
			$('#myModalLabel').html('종료된 상품');
			$('#content').html('경매가 종료되었습니다. 5초 후 자동 종료 됩니다.');
			$('#myModal').modal('show');
			setInterval('closeWin()',5000);
		}
	}
	function closeWin()
	{
		window.close();
	}
	function setText() {
		opener.document.getElementById("price1").value = document
				.getElementById("price").value;

		opener.location.reload();
		window.close();
	}
</script>
<body onLoad="getText();">


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
				<form method="post" action="../auction.do" id="form">
					<h3 style="text-align: center;">금액수정</h3>
					<div class="form-group">
						<input type="text" class="form-control" maxlength="20"
							id="setPrice" readonly>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" maxlength="20" id="price">
						<input type="hidden" id="board_num">
					</div>
					<input type="button" class="btn btn-primary form-control"
						value="등록" id="checkBtn" onclick="ActionFunction()">
				</form>
			</div>
		</div>
	</div>

		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background-color:#B2EBF4;">
						<h4 class="modal-title" id="myModalLabel" style="font-size:3em; color:red"></h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body" id = "content" style="text-align:center; font-size:2em"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<!-- ie10-viewport-bug-workaround.js -->
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
	<!-- holder.js -->
</body>
</html>