<%@page import="vo.GoodsInfoVO"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.GoodsInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%-- <<<<<<< HEAD
<link rel="stylesheet" href="css/a.css">
<style>
#navBar {
	box-shadow: 0 2px 4px -1px rgba(0, 0, 0, 0.125), 0 4px 5px 0
		rgba(0, 0, 0, 0.125), 0 1px 10px 0 rgba(0, 0, 0, 0.300);
	background-color: rgba(87, 182, 230, 0.75);
}

.containers {
	display: flex;
	flex-direction: column;
}

header {
	padding-top: 5.5rem;
}

footer {
	border-top: 1px solid gray;
	padding: 20px;
	text-align: center;
}

.content {
	display: flex;
	padding-left: 15%;
}

.content nav {
	/* border-right: 1px solid gray; */
	
}

.content main {
	/* border-right: 1px solid gray; */
	
}

.content aside {
	border-left: 1px solid gray;
}

@media ( max-width : 500px) {
	.content {
		flex-direction: column;
	}
	.content nav, .content aside {
		border: none;
		flex-basis: auto;
	}
	main {
		order: 0;
	}
	nav {
		order: 1;
	}
	aside {
		order: 2;
		display: none;
	}
}

nav, aside {
	flex-basis: 175px;
	flex-shrink: 0;
}

main {
	padding: 10px;
}

.dropdown {
	top: 10px;
	padding-top: 10px;
	padding-left: 30px;
}

.container-fluid {color =#FF0000;
	
}
</style>
</head>
<body>
	<div class="containers">
		<header>
			<%@include file="page/navBar.jsp"%>
		</header>
		<div class="content">
			<nav>
				<jsp:include page="page/catagory.jsp"></jsp:include>
			</nav>
			<main>
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

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="content.do"><img class="card-img-top"
								src="http://placehold.it/700x400" alt=""></a>
======= --%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<link rel="stylesheet" href="css/a.css">
<!-- 폰트어썸 링큐 -->
<link rel=”stylesheet” href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>
<style>
#navBar {
	box-shadow: 0 2px 4px -1px rgba(0, 0, 0, 0.125), 0 4px 5px 0
		rgba(0, 0, 0, 0.125), 0 1px 10px 0 rgba(0, 0, 0, 0.300);
	background-color: rgba(87, 182, 230, 0.75);
}

.containers {
	display: flex;
	flex-direction: column;
}

header {
	padding-top: 5.5rem;
}

footer {
	border-top: 1px solid gray;
	padding: 20px;
	text-align: center;
}

.content {
	display: flex;
	padding-left: 15%;
}

.content nav {
	/* border-right: 1px solid gray; */
	
}

.content main {
	/* border-right: 1px solid gray; */
	
}

.content aside {
	border-left: 1px solid gray;
}

@media ( max-width : 500px) {
	.content {
		flex-direction: column;
	}
	.content nav, .content aside {
		border: none;
		flex-basis: auto;
	}
	main {
		order: 0;
	}
	nav {
		order: 1;
	}
	aside {
		order: 2;
		display: none;
	}
}

nav, aside {
	flex-basis: 175px;
	flex-shrink: 0;
}

main {
	padding: 10px;
}

.dropdown {
	top: 10px;
	padding-top: 10px;
	padding-left: 30px;
}

.container-fluid {color =#FF0000;
	
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="containers">
		<header>
		<jsp:include page="page/navBar.jsp"></jsp:include>
		</header>
		<div class="content">
			<nav>
				<jsp:include page="page/catagory.jsp"></jsp:include>
			</nav>
			<main>
			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
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
				Vector<GoodsInfoVO> list = null;
				
				if(request.getAttribute("list")== null) { 
				GoodsInfoDAO dao = new GoodsInfoDAO();
				list = dao.getMainList();
				}else 
				{
				list =(Vector<GoodsInfoVO>)request.getAttribute("list"); 
				}
				
				for(GoodsInfoVO i : list) { %>
						<%-- 상품 list --%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
						<%-- 사진 첨부의 경우.. 이름만 가져오면 되지 않나? --%>
							<a href="content.do"><img class="card-img-top" src="img/<%=i.getImg()%>"       
								alt=""></a>

							<div class="card-body">
								<h4 class="card-title">
								<%-- 글 제목  --%>
									<a href="content.do"><%=i.getBoard_subject()%></a>
								</h4>
								<%-- 희망 가격 --%>
								<h5><%=i.getPrice()%></h5>
								<%-- 상품 설명 --%>
								<p class="card-text"><%=i.getGoods_info()%></p>
							</div>
						</div>
					</div>
					<%} %> <%-- for문 끝 --%>
				</div>
			</div>
			<form action= "page/write.jsp" method ="post">
			<input type="submit" value= "글 등록하기">
			</form>
			</main>

		</div>
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
</body>
</html>