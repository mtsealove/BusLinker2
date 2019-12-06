<%@ page import="BusLinker.Table.TableManager" %>
<%@ page import="java.awt.geom.Area" %>
<%@ page import="BusLinker.Table.Company" %><%--
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
</head>
<body>
<%@include file="../nav.jsp" %>
<%@include file="../panel.jsp" %>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">운행경로</h4>
            <!--버스사 선택-->
            <form>
                <select name="Company">
                    <option>버스사 선택</option>
                    <%
                        TableManager manager = new TableManager();
                        ArrayList<Company> companies=manager.getCompanies(0, 1000);
                        for(Company company:companies) { %>
                            <option value="<%=company.getEmail()%>"><%=company.getBusinessName()%></option>
                        <% } %>
                </select>
            </form>
        </div>
    </div>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>
