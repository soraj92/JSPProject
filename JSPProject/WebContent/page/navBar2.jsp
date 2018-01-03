<!--<nav class="navbar navbar-expand-md navbar-dark navbar-light fixed-top"-->
<!--style="box-shadow:0 2px 4px -1px rgba(0,0,0,0.06), 0 4px 5px 0 rgba(0,0,0,0.06), 0 1px 10px 0 rgba(0,0,0,0.08)">-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>&nbsp;&nbsp;
            <button class="btn btn-primary" onclick="window.open('page/login.jsp')">로그인</button></a>
			<a role="button" aria-disabled="true"><button class="btn btn-secondary" onclick="window.open('page/register.jsp')">회원가입</button></a>
        </div>
    </nav>

</div>
</nav>
