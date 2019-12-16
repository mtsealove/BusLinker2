<%@ page import="BusLinker.Route.RouteManager" %>
<%@ page import="BusLinker.Route.Route" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/06
  Time: 12:04 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>운행경로</title>
    <%@include file="../config.jsp" %>
    <%@include file="../check_manager.jsp" %>
    <script>
        $(function () {
            $('#register_btn').click(function () {
                location.href = "CreateRunInfo.jsp";
            });
        })
    </script>
</head>
<body>
<%@include file="../nav.jsp" %>
<%@include file="../panel.jsp" %>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">운행경로</h4>
            <table class="table table-hover">
                <thead class="thead-light">
                <tr>
                    <th class="text-left">경로명</th>
                    <th class="text-left">업체명</th>
                    <th class="text-left">버스사</th>
                    <th class="text-left">출발주소</th>
                </tr>
                </thead>
                <tbody>
                <%
                    RouteManager routeManager = new RouteManager();
                    ArrayList<Route> routes = routeManager.getRouteList(0, 13);
                    for (Route route : routes) { %>
                <tr>
                    <td><%=route.getAlias()%>
                    </td>
                    <td><%=route.getCenter()%>
                    </td>
                    <td><%=route.getBus()%>
                    </td>
                    <td><%=route.getAddr()%>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>

            <button class="btn btn-primary" id="register_btn">운행경로 등록</button>
        </div>
    </div>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>
