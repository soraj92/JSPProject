<%@page import="vo.UserVO"%>
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
<%System.out.println( request.getRealPath( request.getContextPath() ) ); %>
	<div class="containers">
		<header>

			<jsp:include page="./navBar.jsp"></jsp:include>

		</header>
		<section class="contents">
			<aside>
				<jsp:include page="./asideBar.jsp"></jsp:include>
			</aside>
			<main>
			<div class="col-lg-9">


				<%-- 상단에 mypage문구? 이미지와  이름, 사람모양이미지 --%>
				<%-- 가운데 개인정보 변경 버튼 누르기  --%>
				<%-- 테이블 안에는 내가 등록한 게시글의 글번호, 제목 ,거래 현황을 보여줌 --%>
				<%-- 로그인 후 끌고다니는 내 아이디 정보 ! session or 쿠키에 저장되어있는 , 아이디를 통해서  --%>
				<%-- 보여지는 글번호는 .. db에있는글번호 말고, 각 개수를 볼 수 있도록 새로 번호를 부여해준다. --%>
				<%-- 거래상태는 판매완료('3') 으로 바뀌었을 경우  변경하지 못하도록 설정해준다. --%>
				<table class="table table-bordered table-hover"
					style="text-align: center; border: 1px solid #dddddd">
					<%
						UserVO vo = (UserVO) request.getAttribute("userInfo");
						Vector<GoodsInfoVO> my_list = (Vector<GoodsInfoVO>) request.getAttribute("my_list");
						int cnt = 0; // 내가 등록한 게시글 번호는 db랑 별개로 개수를 볼 수 있도록 새로 부여해준다.
						String state = "";
					%>
					<tr>
						<!--  사용자 이름, point 가져오기 -->
						<td colspan="3">이름 : <%=vo.getUserName()%></td>
						<td colspan="2">포인트 : <%=vo.getUserPoint()%></td>
					</tr>

					<tr>
						<td colspan="5"></td>
					</tr>
					<tr>
						<td colspan="5">
							<!-- 	<form action ="./pwdCheck.jsp" method="post"> --> <a
							role="button" aria-disabled="true"><button
									class="btn btn-secondary" onclick="window.open('Update.do')">회원정보
									변경</button></a> <!-- </form> -->
						</td>
					</tr>
					<tr>
						<td colspan="5"></td>
					</tr>

					<!-- 사용자의 게시글 제목, 상태  가져오기 -->
					<tr>
						<%
							for (GoodsInfoVO li : my_list) {
								cnt++;
						%>
						<td>
							<!-- no : --><%=cnt%>
						</td>
						<!-- board_subject :  -->
						<td><a href="content.do?board_num=<%=li.getBoard_num()%>"
							style="color: black"><%=li.getBoard_subject()%></a></td>


						<%-- trade_state : --%>
						<td>
							<%
								if (li.getTrade_state() == 1) {
										state = "판매중";
									} else if (li.getTrade_state() == 2) {
										state = "거래중";
									} else {
										state = "거래 완료";
									}
							%> <%=state%>
						</td>


						<form action="./trade_change.com" method="post">
							<td><select name="trade_state">

									<!--  <option value="1" <c:if test=""></c:if> >테스트</option> -->
									<%
										if (li.getTrade_state() == 1) {
									%>
									<option value="1" selected>판매중</option>
									<option value="2">거래중</option>
									<option value="3">판매완료</option>
									<%
										} else if (li.getTrade_state() == 2) {
									%>
									<option value="1">판매중</option>
									<option value="2" selected>거래중</option>
									<option value="3">판매완료</option>
									<%
										} else {
									%>
									<option value="1">판매중</option>
									<option value="2">거래중</option>
									<option value="3" selected>판매완료</option>
									<%
										}
									%>


							</select></td>
							<td><input type="hidden" name="board_num"
								value=<%=li.getBoard_num()%>> <%-- board_num :<%=li.getBoard_num()%> --%>
								<%-- board_num 부분은 나중에 삭제 내가 보기위해 넣은거 --%> <%
 	if (li.getTrade_state() != 3) {
 			//판매 상태가 3(판매완료)이 아닐 경우에만 버튼을 만들어 준다.
 %> <input class="form-control" type="submit"
								value="변경" /> <%
 	} else {
 %>판매완료<%
 	}
 %></td>
						</form>
					</tr>
					<%
						}
					%>
				</table>

			</div>
			<form action="./write.jsp" method="post">
				<input type="submit" value="글 등록하기">
			</form>



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