<%@ page import="BusLinker.Account" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/02
  Time: 9:41 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String Name = request.getParameter("Name").toString();
    String BusinessNum = request.getParameter("BusinessNum").toString();
    String BusinessAddr = request.getParameter("BusinessAddr").toString();
    String CenterAddr = request.getParameter("CenterAddr").toString();
    String Category = request.getParameter("Category").toString();
    String Contact = request.getParameter("Contact").toString();
    String Mail = request.getParameter("Mail").toString();
    String Password = request.getParameter("Password").toString();

    Account account = new Account();
    if(account.CreateOwner(Name, BusinessNum, BusinessAddr, CenterAddr, Category, Contact, Mail, Password)) {
        out.println("<script>alert('회원가입이 완료되었습니다');location.href='../../index.jsp';</script>");
    } else {
        out.println("<script>alert('오류가 발생하였습니다');history.go(-1);</script>");
    }
%>
