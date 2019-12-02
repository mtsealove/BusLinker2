<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/11/29
  Time: 5:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusLinker.Account" %>
<%@ page import="BusLinker.Member" %>

<%
    Account account = new Account();
    request.setCharacterEncoding("euc-kr");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    Member member = account.Login(id, pw);

    response.setContentType("application/json");

    if (member != null) {
        //세션 설정
        session.setAttribute("userID", member.getID());
        session.setAttribute("userName", member.getName());
        session.setAttribute("userClass", member.getClassID());
    }
    //결과 반환
    out.print(member.toJson().toJSONString());;
%>
