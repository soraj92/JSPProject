<%@page import="java.text.NumberFormat"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/toolTip.css">
<style>
.containers {
	display: flex;
	flex-direction: column;
}

header {
	border-bottom: 1px solid gray;
	padding-left: 20px;
}

footer {
	border-top: 1px solid gray;
	padding: 20px;
	text-align: center;
}

.contents {
	display: flex;
	/*content: '';*/
	justify-content: center;
}

.contents aside {
	border-right: 1px solid gray;
}

.contents adBar {
	border-left: 1px solid gray;
}

@media ( max-width : 1340px) {
	.contents {
		flex-direction: column;
	}
	.contents aside, .contents adBar {
		border: none;
		flex-basis: auto;
	}
	main {
		order: 0;
	}
	aside {
		order: 1;
	}
	adBar {
		order: 2;
		display: none;
	}
}

aside, adBar {
	/*flex-basis: 350px;*/
	
}

main {
	flex-basis: 1040px;
	flex-shrink: 0;
	padding: 10px;
}

header {
	padding-top: 2.5rem;
}

.navmenu-header {
	padding: 0.75rem 1.25rem;
	margin-bottom: 0;
	background-color: rgba(0, 0, 0, .03);
	border-bottom: 1px solid rgba(0, 0, 0, .125)
}
</style>
<title>경매장</title>
<% Vector<Integer> time = (Vector<Integer>)request.getAttribute("time");
	int a = 0;
	int j = 0;
	int trr[] = new int[9];
	for(int t : time)
	{
		trr[j] = t;
		j++;
	}
		j = 0;

	String[] str = {"time1","time2","time3","time4","time5","time6","time7","time8","time9"};
	String[] end = {"end1","end2","end3","end4","end5","end6","end7","end8","end9"};
	String[] priceStr = {"price1","price2","price3","price4","price5","price6","price7","price8","price9"};
%>

<script>
		var openWin;
		
		function openChild(i)
		{
			window.name = "parent";
			var num = i;
			openWin = window.open('page/Auction.jsp?num='+num, 'child' , 'width=500px, height=300px');
		}
		var Time = new Array(<%=trr[0]%>, <%=trr[1]%>,<%=trr[2]%>,<%=trr[3]%>,<%=trr[4]%>,<%=trr[5]%>,<%=trr[6]%>,<%=trr[7]%>,<%=trr[8]%>);
		
		function msg_time() {	// 1초씩 카운트
			<%for(int i = 0; i < 9; i++)
				{%>
				
			if(Time[<%=i%>]>3600)
				m = Math.floor(Time[<%=i%>]/3600) + "시간 " + Math.floor(Time[<%=i%>]%3600/60) + "분 " + (Time[<%=i%>] % 60) + "초";	// 남은 시간 계산
			else if(Time[<%=i%>] >= 60)
				m = Math.floor(Time[<%=i%>]%3600/60) + "분 " + (Time[<%=i%>] % 60) + "초";
			else
				m = (Time[<%=i%>] % 60) + "초";

			if(Time[<%=i%>]<300)
				var msg = "<h2><font color='red'>" + m + "</font></h2>";
			else
				var msg = "<h2><font color='black'>" + m + "</font></h2>";
				
			if (Time[<%=i%>] < 0) {			// 시간이 종료 되었으면..
				
				//clearInterval(tid);		// 타이머 해제
				msg = "<h2>종료</h2>";
				document.getElementById("end"+<%=i+1%>).value = "end";
			}else
			{
				document.getElementById("end"+<%=i+1%>).value = "ing";
			}
			document.all.<%=str[i]%>.innerHTML = msg;		// div 영역에 보여줌 
					
			Time[<%=i%>]--;					// 1초씩 감소
			<%}%>
		}

		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
		
		
	</script>

</head>
<body>
	<%
		Vector<BoardVO> list = (Vector<BoardVO>) request.getAttribute("list");
		String price = "";
		String userID = (String)session.getAttribute("isLogin");
		if(userID == null)
			userID = "";
		//NumberFormat.getCurrencyInstance().format(1000000);
	%>
	<div class="containers">
		<header>
			<jsp:include page="navBar.jsp"></jsp:include>
		</header>
		<section class="contents">
			<aside>
				<jsp:include page="asideBar.jsp"></jsp:include>
			</aside>
			<main>
			<div class="row">
			<%
				int i = 0;
					if (list != null)
						for (BoardVO vo : list) {
							//￦
				%>
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card" style="height: 40rem">
						<a href="content.do?board_num=<%=vo.getBoard_num()%>" style="height: 20rem">
						<img class="card-img-top" src="imgupload/<%=vo.getImg() %>" alt="Card image cap" style="max-height: 20rem">
						</a>
						<div class="card-body">
							<h5 class="card-title"><%=vo.getBoard_subject()%></h5>
							<p class="card-text"><%=vo.getGoods_info()%></p>
							<input type = "hidden" id = "price<%=(i+1)+"_board_Num"%>" value = "<%=vo.getBoard_num()%>"/>
							<input type = "hidden" id = "price<%=i+1%>" value = "<%=NumberFormat.getCurrencyInstance().format(vo.getPrice())%>"/>
							<h4><%=NumberFormat.getCurrencyInstance().format(vo.getPrice())%></h4>
						</div>
						<div class="card-body">
							<div id="time<%=i+1%>"></div> 
							<input type = "hidden" id = "end<%=i+1%>" value = ""/>
							<input type = "hidden" id = "userID" value = "<%=userID%>"/>
						</div>
						<div class="card-body">
						<input type = "button" onclick = "openChild(<%=i %>)" value = "참여하기"/>
						<input type = "hidden" id = "<%=i%>" value = "<%=i%>"/>
							<!-- <a href="#"
								class="card-link">Another link</a> -->
						</div>
					</div>
				</div>
				<%
					i++;
					}
				%>
				</div>
			</main>
		</section>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>
	<script defer
		src="https://use.fontawesome.com/releases/v5.0.2/js/all.js"></script>
</body>
</html>