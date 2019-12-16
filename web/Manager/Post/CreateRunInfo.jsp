<%@ page import="BusLinker.Route.RouteManager" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/16
  Time: 2:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String owner[] = request.getParameterValues("owner");
    String catStr[] = request.getParameterValues("cat");
    String actionStr[] = request.getParameterValues("action");
    int cat[] = new int[24];
    int action[] = new int[24];
    String address[] = request.getParameterValues("address");
    String name = request.getParameter("alias");
    String bus_id = request.getParameter("bus_id");
    String center_id = request.getParameter("center_id");

    System.out.println(bus_id);
    System.out.println(center_id);

    for (int i = 0; i < catStr.length; i++) {
        cat[i] = Integer.parseInt(catStr[i]);
        action[i] = Integer.parseInt(actionStr[i]);
    }

    RouteManager routeManager = new RouteManager();
    if (routeManager.CreateRoute(bus_id, center_id, name, owner, cat, action, address))
        out.println("<script>alert('운행정보가 등록되었습니다');location.href='../RunInfo.jsp';</script>");
    else
        out.println("<script>alert('오류가 발생하였습니다');history.go(-1);</script>");

%>
