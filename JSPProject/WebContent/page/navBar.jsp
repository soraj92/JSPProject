<!--<nav class="navbar navbar-expand-md navbar-dark navbar-light fixed-top"-->
<!--style="box-shadow:0 2px 4px -1px rgba(0,0,0,0.06), 0 4px 5px 0 rgba(0,0,0,0.06), 0 1px 10px 0 rgba(0,0,0,0.08)">-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<script type="text/javascript">
	var openWin;
	
	function openLogin(i)
	{
		var win = i;
		window.name = "parent";
		if(win == 'page/login.jsp')
			openWin = window.open(win , 'child' , 'width=500px, height=300px');
		else
			openWin = window.open(win,'child');
	}
</script>
</head>
<div class="pos-f-t">

    <nav class="navbar navbar-dark bg-dark fixed-top">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-list"></i>
            <%--<span class="navbar-toggler-icon"></span>--%>
        </button>
        <div class="collapse" id="navbarToggleExternalContent">
			<div class="bg-dark p-4">
				<h4 class="text-white">Collapsed content</h4>
				<span class="text-muted">Toggleable via the navbar brand.</span>
			</div>
			<%
				if (session.getAttribute("isLogin") != null) {
			%>
			<font size="5em" color="white" ><%= session.getAttribute("isLogin") %>님 환영합니다.</font>>
			<form action = "myPage.com" method ="post">
			<input type="submit" class="btn btn-primary" value="내정보" /></form>
			<a role="button" aria-disabled="true"><button class="btn btn-secondary" onclick="window.open('page/logout.jsp')">로그아웃</button></a>
			<%
				} else {
			%>
			<i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>&nbsp;&nbsp;
			<button class="btn btn-primary"
				onclick="openLogin('page/login.jsp')">로그인</button>
			 <a role="button" aria-disabled="true"><button
					class="btn btn-secondary"
					onclick="window.open('page/register.jsp')">회원가입</button></a>
			<%
				}
			%>

		</div>
    </nav>
</div>
