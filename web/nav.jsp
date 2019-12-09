<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/11/27
  Time: 5:13 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    String dir_nav=request.getContextPath();

%>
<script>
    $(function () {
        $('#login_btn').click(function () {
            location.href = "login.jsp";
        });
        $('#logout_btn').click(function () {
            if (confirm("로그아웃 하시겠습니까?")) {
                location.href = "<%=dir_nav%>/Get/logout.jsp";
            }
        })
        $('#toggle_btn').click(function () {
            $('#panel').toggle(500);
            $('.main').toggle();
            $('footer').toggle();
        })
    });
</script>
<nav class="navbar navbar-expand-lg navbar-light bg-light nav">
    <div>
        <img src="<%=dir_nav%>/images/logo.png" id="app_icon" width="40" height="40">
        <a class="navbar-brand" href="#" style="height: 40px; vertical-align: middle;"><b>BusLinker</b></a></div>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    </div>

    <div id="account_div">
        <%
            //로그인 되어 있을 시
            if (session.getAttribute("userName") != null) { %>
        <div>
            <label><%=session.getAttribute("userName") + "님"%>
            </label>
            <button type="button" class="btn btn-link dropdown-toggle"
                    id="logout_btn"
                    aria-expanded="false">
                로그아웃
            </button>
        </div>
        <% } else { %>
        <button type="button" class="btn btn-link dropdown-toggle"
                id="login_btn"
                aria-expanded="false">
            로그인
        </button>
        <% } %>
    </div>
    <button class="navbar-toggler" type="button" id="toggle_btn"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>