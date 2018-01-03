<%@page import="vo.BoardVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="css/toolTip.css">
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

        @media (max-width: 1340px) {
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
    <jsp:include page="navBar.jsp"></jsp:include>
    </header>
    <section class="contents">
        <aside>
        <jsp:include page="asideBar.jsp"></jsp:include>
        </aside>
        <main>
<%
 			BoardVO vo = (BoardVO) request.getAttribute("vo");
			
 %>
			<div class="container">
				<div>
					<h3 class="text-muted" style="text-align: center"><%=vo.getBoard_subject()%></h3>
				</div>

				<main role="main">
				<div class="jumbotron">
					<p class="lead">
					<img src="imgupload/1.PNG" /></p>
				</div>

				<div class="row marketing">
					<div class="col-lg-6">
						<h4>가격</h4>
						<p><%=vo.getPrice()%>원
						</p>

						<h4>구입시기</h4>
						<p><%=vo.getPurchasing_time()%></p>

						<h4>상품 설명</h4>
						<p><%=vo.getGoods_info()%></p>
					</div>

					<div class="col-lg-6">
						<h4>거래방식</h4>
						<%
							if (vo.getChoice_way() == 0) {
						%>
						<p>직거래</p>
						<%
							} else {
						%>
						<p>택배거래</p>
						<%
							}
						%>
						<h4>거래 지역</h4>
						<p>서울</p>

						<!-- <h4>Subheading</h4>
            <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p> -->
					</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
        integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
        crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.2/js/all.js"></script>

</body>
</html>