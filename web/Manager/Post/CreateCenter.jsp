<%@ page import="BusLinker.Account" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/09
  Time: 1:32 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String business_num = request.getParameter("business_num");
    String business_addr = request.getParameter("business_addr");
    String center_addr = request.getParameter("center_addr");
    String contact = request.getParameter("contact");
    String id = request.getParameter("id");

    Account account = new Account();
    if (account.CreateCenter(name, business_num, business_addr, center_addr, contact, id)) {
        out.println("<script>alert('물류센터가 등록되었습니다');location.href='../../index.jsp';</script>");
    } else {
        out.println("<script>alert('오류가 발생하였습니다');history.go(-1);</script>");
    }
%>
