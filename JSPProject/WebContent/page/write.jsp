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

<style>
.zz {
	padding: .25rem .75rem;
	font-size: 1.25rem;
	line-height: 1;
	background-color: transparent;
	/*border: 1px solid transparent;*/
	border: 1.5px solid rgba(0, 0, 0, 0.25);
	border-radius: .25rem
}

.head-nav {
	height: 46px;
	background: #343a40;
	/*border: 1px tomato solid;*/
	padding: .5rem 1rem;
	display: flex;
	justify-content: space-between;
	/*padding-left: 0.75rem;
                    !*padding-top: ;*!
                    padding-top: auto;
                    padding-bottom: auto;
                    background-color: rgba(0, 0, 0, .03);
                    border-bottom: 1px solid rgba(0, 0, 0, .125)*/

	/*            position: relative;
                                display: -webkit-box;
                                display: -ms-flexbox;
                                display: flex;
                                -ms-flex-wrap: wrap;
                                flex-wrap: wrap;
                                -webkit-box-align: center;
                                -ms-flex-align: center;
                                align-items: center;
                                -webkit-box-pack: justify;
                                -ms-flex-pack: justify;
                                justify-content: space-between;*/
}

.zz:hover {
	background-color: black;
	color: white;
	padding: 10px;
	width: 100px;
	height: 50px;
	-webkit-transition: all 500ms cubic-bezier(0.680, 0, 0.265, 1);
	/* older webkit */
	-webkit-transition: all 500ms cubic-bezier(0.680, -0.550, 0.265, 1.550);
	-moz-transition: all 500ms cubic-bezier(0.680, -0.550, 0.265, 1.550);
	-o-transition: all 500ms cubic-bezier(0.680, -0.550, 0.265, 1.550);
	transition: all 500ms cubic-bezier(0.680, -0.550, 0.265, 1.550);
	/* easeInOutBack */
	-webkit-transition-timing-function: cubic-bezier(0.680, 0, 0.265, 1);
	/* older webkit */
	-webkit-transition-timing-function: cubic-bezier(0.680, -0.550, 0.265, 1.550);
	-moz-transition-timing-function: cubic-bezier(0.680, -0.550, 0.265, 1.550);
	-o-transition-timing-function: cubic-bezier(0.680, -0.550, 0.265, 1.550);
	transition-timing-function: cubic-bezier(0.680, -0.550, 0.265, 1.550);
	/* easeInOutBack */
}

.containers {
	display: flex;
	flex-direction: column;
}

/*border-bottom: 1px solid gray;*/
header {
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
			<jsp:include page="navBar.jsp"></jsp:include>
			<%--<br><br><br><br>--%>
			<%--<button class="zz" type="button">버튼임</button>--%>
		</header>
		<section class="contents">
			<aside>
				<jsp:include page="asideBar.jsp"></jsp:include>
			</aside>
			<main>

			<form action="../write.do" method="post"
				enctype="multipart/form-data">
				<div style="border: 1px #ddd solid;">
					<div>
						<div style="display: inline-block">
							<i class="far fa-address-book fa-3x"></i>
						</div>
						<div style="display: inline-block">
							<div><%=session.getAttribute("isLogin")%>
							</div>
							<div>포인트</div>
						</div>
					</div>
					<div
						style="border-top: 1px #ddd solid; text-align: center; padding: 1rem;">
						<div></div>
						<div></div>

						<div>
							<%--<div style="border: 1px #757575 solid; padding: .725rem;">--%>
							<div>
								<input type="text" name="productPrice" placeholder="가격">
								<input type="text" name="purchasing-time" placeholder="구입시기">

								<select name="main-category" onchange="categoryChange(this)"
									required>
									<option selected value="">1차 분류</option>
									<option value="clothes">의류</option>
									<option value="accessory">패션/잡화</option>
									<option value="sports">스포츠</option>
									<option value="electronics">디지털/가전</option>
									<option value="etc">기타</option>
									<option value="auction">경매장</option>
								</select> <select id="small-category" name="small-category">
									<option selected>대분류를 선택 해 주세요</option>
								</select>

							</div>
						</div>
						<input class="form-set" type="text" placeholder="제목을 입력해 주세요."
							name="subject" required
							style="border-bottom-left-radius: 0; border-bottom-right-radius: 0; margin-bottom: -1px;">
						<textarea class="form-control" id="productComment"
							name="productComment"
							style="resize: none; margin-bottom: -1px; border-bottom-left-radius: 0; border-bottom-right-radius: 0; border-top-left-radius: 0; border-top-right-radius: 0"
							rows="5" placeholder="판매할 상품에 대한 코멘트를 남겨주세요!"></textarea>

						<div style="display: inline-flex; width: 100%;">
							<input type='file' id="imgUpload" name="imgUpload"
								accept=".JPG,.GIF,.PNG,.BMP,.HEIF"
								style="border-top-left-radius: 0; border-top-right-radius: 0; border-bottom-right-radius: 0" />
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal"
								style="border-bottom-left-radius: 0; border-top-left-radius: 0; border-top-right-radius: 0">
								이미지 확인</button>
						</div>

						<!-- Button trigger modal -->


						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">사진 확인</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<img id="blah" src="#" alt="사진을 선택한 후 다시 시도해 주세요."
											style="height: 300px; width: 300px;" name="imgUpload" />
										<%--</div>

                                        <div class="modal-footer">--%>

									</div>


								</div>

							</div>
						</div>
						<div>
							<div>
								<input type="radio" name="apply" value="직거래" id="직거래"
									onclick="div_show(this.value,'divshow');"> <label
									class="custom-control-label" for="직거래"> 직거래 </label>
							</div>
							<div>
								<input type="radio" name="apply" value="택배거래" id="택배거래"
									onclick="div_show(this.value,'divshow');"> <label
									class="custom-control-label" for="택배거래">택배거래</label>
							</div>
							<div id="divshow" style="display: none;"
								data-tooltip-text="희망하는 거래 장소를 기입해 주세요.">

								<input type="text" name="input-place" class="cleargogo">
							</div>

							<div id="trade-sel" style="border: 1px powderblue solid;">

								<p>거래 방법을 선택해 주세요.</p>
							</div>

							<div id="trade-dirent" style="display: none;">

								<p>택배거래를 선택 하셨습니다.</p>
							</div>
						</div>
					</div>

				</div>
	<div style="text-align: right; padding-right: 1rem;">
		<button type="submit" class="btn btn-success">작성</button>
		<button type="button" class="btn btn-danger">취소</button>
	</div>

	</form>
	</div>

	</main>
	<adBar> </adBar>
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
		$('input').addClass('form-control');
	</script>
	<script src="../js/fileUploadView.js"></script>
	<script>
		function div_show(s, ss) {

			if (s == "직거래") {

				document.getElementById(ss).style.display = "";
				$('#trade-sel').css('display', 'none');
				$('#trade-dirent').css('display', 'none');

			} else {

				document.getElementById(ss).style.display = "none";
				$('.cleargogo').val('');
				$('#trade-sel').css('display', 'none');
				$('#trade-dirent').css('display', '');
				$('#trade-dirent').css('border', '1px powderblue solid');

			}

		}
	</script>
	<script>
		$('select').addClass('custom-select');
	</script>
	<script src="../js/categoryChange.js"></script>
	<script>
		$('.zz').click(function() {
			// $('.head-nav').css('height', '400px');
			$('.head-nav').addClass('asd');
		});

		$('select').addClass('custom-select custom-select-sm');
	</script>

</body>
</html>