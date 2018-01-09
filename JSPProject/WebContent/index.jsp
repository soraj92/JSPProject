<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ListPageVO"%>
<%@page import="vo.GoodsInfoVO"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.GoodsInfoDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype>
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
</head>
<body>
	<div class="containers">
		<header>
			<jsp:include page="page/navBar.jsp"></jsp:include>
		</header>
		<section class="contents">
			<aside>
				<jsp:include page="page/asideBar.jsp"></jsp:include>
			</aside>
			<main> <%
 	Vector<GoodsInfoVO> list = (Vector<GoodsInfoVO>) request.getAttribute("list");
 	if (list == null) {
 %> <jsp:forward page="index.com" /> <!-- 페이지 나누기 위한 정보 -->
			<%
				}
				//검색에서 넘어온 경우
				/* String category =(String)request.getAttribute("category"); // 검색조건 (카테고리별 )
				String searchword = (String)request.getAttribute("searchword"); // 검색 단어
				*/
				ListPageVO page_info = (ListPageVO) request.getAttribute("page_info");
				int total_page = page_info.getTotal_page();
				int start_page = page_info.getStart_page();
				int end_page = page_info.getEnd_page();
				int current_page = page_info.getPage();
				int total_rows = page_info.getTotal_rows();
			%>
			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Second slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">
					<%

						for (GoodsInfoVO i : list) {
					%>
					<%-- 상품 list --%>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card" style="height: 25rem">
							<a href="content.do?board_num=<%=i.getBoard_num()%>" style="height: 20rem"><img
								class="card-img-top" src="imgupload/<%=i.getImg()%>" alt="" style="max-height: 20rem"></a>
							<div class="card-body">
								<h4 class="card-title">
									<%-- 글제목 --%>
									<a href="content.do?board_num=<%=i.getBoard_num()%>"><%=i.getBoard_subject()%></a>
								</h4>
								<%-- 희망 가격 --%>
								<h5><%=NumberFormat.getCurrencyInstance().format(i.getPrice())%></h5>

								<%-- 상품 설명 --%>
								<p class="card-text"><%=i.getGoods_info()%></p>
							</div>
							<%-- card-body --%>
						</div>
						<%-- card --%>
					</div>
					<%-- col-lg-4 col-md-6 mb-4 --%>

					<%
						}
					%>
					<%-- for문 끝 --%>
				</div>
				<%-- class = row --%>
			</div>
			<%-- col-9 --%>


			<form action="page/write.jsp" method="post">
				<input type="submit" value="글 등록하기">
			</form>

			<%
				// if(searchword == null){
				//검색 기능 추가했을경우 if문 안에다가 넣어주기
				// [이전]
				if (current_page <= 1) {
					out.print("[이전]");
				} else {
					out.print("<a href=index.com?page=" + (current_page - 1) + ">");
					out.print("[이전]</a>");
				}

				for (int i = start_page; i <= end_page; i++) {
					if (i == current_page) {
						out.print("[" + i + "]");
					} else {
						out.print("<a href=index.com?page=" + i + ">");
						out.print(i + "</a>");
					}
				}
				if (current_page >= total_page) {
					out.print("[다음]");
				} else {
					out.print("<a href=index.com?page=" + (current_page + 1) + ">");
					out.print("[다음]</a>");
				}
			%> </main>
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