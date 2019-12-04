<%@ page import="BusLinker.Account" %>
<%@ page import="org.json.simple.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/04
  Time: 3:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //ID 중복 체크
    request.setCharacterEncoding("utf-8");
    String ID = request.getParameter("ID").toString();
    Account account = new Account();
    JSONObject object = new JSONObject();
    if (account.IDCheck(ID)) {
        object.put("result", true);
    } else {
        object.put("result", false);
    }

    out.println(object.toJSONString());
%>
