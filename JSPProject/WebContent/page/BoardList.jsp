<%@page import="vo.ListPageVO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/toolTip.css">
<link rel="stylesheet" href="css/paging.css">
<style>
/*    .card-body {
	    -ms-flex: 1 1 auto;
	    flex: 1 1 auto;
	    padding: 1.25rem;
	} */
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
</head>
<body>
	<%
		Vector<BoardVO> list = (Vector<BoardVO>) request.getAttribute("list");
		String price = "";
		//NumberFormat.getCurrencyInstance().format(1000000);

		ListPageVO page_info = (ListPageVO) request.getAttribute("Mpage_info");
		int total_page = page_info.getTotal_page();
		int start_page = page_info.getStart_page();
		int end_page = page_info.getEnd_page();
		int current_page = page_info.getPage();
		int total_rows = page_info.getTotal_rows();
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
					if (list != null)
						for (BoardVO vo : list) {
				%>
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card">
						<a href="content.do?board_num=<%=vo.getBoard_num()%>"><img
							class="card-img-top" src="imgupload/<%=vo.getImg()%>" alt="?"></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="content.do?board_num=<%=vo.getBoard_num()%>"><%=vo.getBoard_subject()%></a>
							</h4>
							<div class = "trade_state">
							<%if(vo.getTrade_state() == 3){ %>
							<span class ="finish">판매완료</span>
							<%}else if(vo.getTrade_state() == 2){ %>
							<span class ="trade">거래중</span>
							<%}else { %>
							<span class ="sale">판매중</span>
							<%} %>
							</div>
							<h5><%=NumberFormat.getCurrencyInstance().format(vo.getPrice())%></h5>
							<p class="card-text"><%=vo.getGoods_info()%></p>
						</div>
					</div>
				</div>
				<%
					}
				%>


			</div>
			<form action="page/write.jsp" method="post">
				<input type="submit" value="글 등록하기">
			</form>
			<div id ="paging">
				<%
					request.setAttribute("product_type",request.getParameter("product_type") );
								if(current_page<=1){
									out.print("<span class ='text'>이전</span>");
								}else{
									out.print("<a href='boardList.do?page="+(current_page-1)+"&product_type="+request.getAttribute("product_type")+"' class ='prev'>");
									out.print("이전</a>");
								}
						
						for(int i =start_page; i<=end_page; i++)
						{
							if(i == current_page){
								out.print("<span class = 'text'> "+i+" </span>");
							}else
							{
								out.print("<a href='boardList.do?page="+i+"&product_type="+request.getAttribute("product_type")+"'  class ='num'>");
								out.print(i+"</a>");
							}
						}
						if(current_page>=total_page)
						{
							out.print("<span class ='text'>다음</span>");
						}else{
							out.print("<a href='boardList.do?page="+(current_page+1)+"&product_type="+request.getAttribute("product_type")+"' class = 'prev'>");
							out.print("다음</a>");
						}
	
			%>
		
			</div>
			</main>
			<%--         <adBar>
            <%@include file="asideBar.jsp" %>
        </adBar> --%>
		</section>
		<footer>
			<a href="https://opentutorials.org/course/1">홈페이지</a>

		</footer>
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

	<script>
		$('.card-body').css('flex', 'none');
	</script>

</body>
</html>