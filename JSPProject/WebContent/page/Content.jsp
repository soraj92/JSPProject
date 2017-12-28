<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2017-12-25
  Time: 오전 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/a.css">
<!-- <link href="../css/narrow-jumbotron.css" rel="stylesheet"> -->
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
			<%@include file="navBar.jsp"%>
		</header>
		<div class="content">
			<nav>
				<jsp:include page="catagory.jsp"></jsp:include>
			</nav>
			<main>
			<div class="container">
				<div>
					<h3 class="text-muted" style="text-align: center">글 제목</h3>
				</div>

				<main role="main">

				<div class="jumbotron">
					<h1 class="display-3">Jumbotron heading</h1>
					<p class="lead">Cras justo odio, dapibus ac facilisis in,
						egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor
						mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-lg btn-success" href="#" role="button">Sign
							up today</a>
					</p>
				</div>

				<div class="row marketing">
					<div class="col-lg-6">
						<h4>가격</h4>
						<p>15000원</p>

						<h4>구입시기</h4>
						<p>2017년 5월 30일</p>

						<h4>상품 설명</h4>
						<p>거의 안썼음</p>
					</div>

					<div class="col-lg-6">
						<h4>거래방식</h4>
						<p>직거래</p>

						<h4>거래 지역</h4>
						<p>서울</p>

						<!-- <h4>Subheading</h4>
            <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p> -->
					</div>
				</div>

				</main>
			</div>
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