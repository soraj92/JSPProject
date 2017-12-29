<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <nav class="navbar navbar-expand-md navbar-dark navbar-light fixed-top" id="navBar">

        <!--style="background-color: rgba(87,182,230,0.75)"-->

        <div class="container">
       <%
        String requestURI = request.getRequestURI();// /Board/qwrite.do
		String contextPath = request.getContextPath();// /Board
		String cmd = requestURI.substring(contextPath.length());// /qwrite.do
		if(requestURI.contains("index.jsp"))//cmd.equals("/index.jsp")
		{
        %>
            <a class="navbar-brand" href="index.jsp">
                SHOP
            </a>
        <%}else{ %>
	        <a class="navbar-brand" href="../index.jsp">
	                SHOP
            </a>
       <%} %> 

            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
                    data-target="#navbarsExampleDefault"
                    aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <i class="fa fa-user-o" aria-hidden="true"></i>

            <div class="navbar-collapse collapse" id="navbarsExampleDefault">
               
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>&nbsp;&nbsp;
            <button class="btn btn-primary" onclick="window.open('page/login.jsp')">로그인</button></a>
			<a role="button" aria-disabled="true"><button class="btn btn-secondary" onclick="window.open('page/register.jsp')">회원가입</button></a>
			
        </div>
    </nav>
</body>
</html>