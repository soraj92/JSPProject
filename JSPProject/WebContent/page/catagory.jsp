<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../css/a.css" >
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
 a:hover{
    text-decoration: none;
    color : #F361A6;
    }
.dropdown{
		   top:10px;
		   padding-top: 10px;
		   padding-left: 30px;
		}

.container-fluid{
   color=#FF0000;
}

</style>
</head>
<body>
<div class="container-fluid">
<i class="fa fa-camera-retro"></i>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    여성의류
     <span class="caret"></span> 
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">헤더</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">맨투맨/후드티</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">반팔/긴팔티셔츠</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">셔츠/남방</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">원피스/가디건</a></li>
    <li role="presentation" class="dropdown-header">헤더</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">스커트/치마</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">청바지/스키니</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">반바지/핫팬츠</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">트레이닝/언더웨어</a></li>
    <li role="presentation" class="dropdown-header">헤더</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">자켓/코트</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">조끼/베스트</a></li>
    <li role="presentation" class="divider"></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">야상/점퍼/패딩</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    남성의류
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">맨투맨/후드티</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">반팔/긴팔티셔츠</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">셔츠/남방</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">니트/스웨터</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">면/캐주얼 바지</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">반바지/7~9부</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">청바지</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">트레이닝/언더웨어</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">자켓/코트</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">조끼/베스트</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">야상/점퍼/패딩</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    패션잡화
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">여성가방</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">남성가방</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">여성화</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">남성화</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">운동화/캐주얼화</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">주얼리/액세서리</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">안경/선글라스</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">지갑</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">시계</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">벨트/장갑/기타</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">모자</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    뷰티미용
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">스킨케어</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">네일아트/케어</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">헤어/바디</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">색조메이크업</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">남성화장품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">미용품/미용기기</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">썬케어</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">향수/캔들</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    스포츠/레저
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">자전거/MTB</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">전동킥보드/전동휠</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">인라인/스케이트보드</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">헬스/요가/골프</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">낚시/캠핑/등산</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">스키/스노우보드</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">수영</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">축구/야구/농구</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">기타구기 스포츠</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
   디지털/가전
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">모바일<a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">노트북/넷북</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">PC/모니터/주변기기</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">카메라/DSLR</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">가전제품<a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">음반/영상/관련기기</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">게임/타이틀</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    도서/티켓/취미/애완
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">도서/책</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">취미/키덜트</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">애완/반려</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">희귀/수집품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">예술/악기/수공예품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">티켓/항공권</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">기프티콘/쿠폰</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">상품권</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    생활/문구/가구/식품
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">생활용품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">주방용품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">가구</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">식품</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    차량/오토바이
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">오토바이/스쿠터</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">국산차(개인)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">국산차(딜러)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">수입차(개인)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">수입차(딜러)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">네비게이션/블랙박스</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">카오디오/영상</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">타이어/휠</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">차량/튜닝 용품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">차량 부품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">산업용품</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    유아동/출산
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
     <li role="presentation" class="dropdown-header">Dropdown header</li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">베이비의류(0-2세)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">여아의류(3-6세)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">남아의류(3-6세)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">여주니어의류(7세~)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">남주니어의류(7세~)</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">유아동신발/잡화</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">유아동용품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">출산/임부용품</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">교육/완구/인형</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">기저귀/수유/이유식</a></li>
  </ul>
</div>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    기타
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">기타1</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">기타2</a></li>
  </ul>
</div>


<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script> -->
</body>
</html>