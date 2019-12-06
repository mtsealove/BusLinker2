<%@ page import="BusLinker.Table.TableManager" %>
<%@ page import="BusLinker.Table.Owner" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/04
  Time: 5:38 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int page_num = 0;
    try {
        page_num = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {

    }
%>
<html>
<head>
    <title>화주사 조회</title>
    <%@include file="../../config.jsp" %>
    <%@include file="../../check_manager.jsp" %>
</head>
<body>
<%@include file="../../nav.jsp" %>
<%@include file="../../panel.jsp" %>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">화주사 조회</h4>
            <table class="table table-hover " style="text-align: center">
                <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>업체명</th>
                    <th>업체 주소</th>
                    <th>Mobile</th>
                    <th>Email</th>
                </tr>
                </thead>
                <tbody>
                <%
                    TableManager manager = new TableManager();
                    int sep = 13;
                    ArrayList<Owner> owners = manager.getOwners(page_num, sep);
                    int index = page_num * sep + 1;
                    for (Owner owner : owners) { %>
                <tr>
                    <td><%=index%>
                    </td>
                    <td><%=owner.getName()%>
                    </td>
                    <td><%=owner.getAddr()%>
                    </td>
                    <td><%=owner.getMobile()%>
                    </td>
                    <td><%=owner.getEmail()%>
                    </td>
                </tr>
                <% index++;
                } %>
                </tbody>
            </table>
            <nav>
                <ul class="pagination justify-content-center">
                    <%
                        int previous = page_num - 1;
                        int next = page_num + 1;
                        String disable="";
                        if(page_num==0) disable="disabled";
                        int page_count=manager.GetOwnerCount();
                    %>

                    <li class="page-item <%=disable%>">
                        <a class="page-link" href="Owner.jsp?page=<%=previous%>" tabindex="-1">이전</a>
                    </li>
                    <% for (int i = page_num; i < page_num + 10; i++) {
                        if(i>Math.ceil(page_count/sep)) break;
                        String active = "";
                        if (i == page_num) active = "active"; %>
                    <li class="page-item <%=active%>"><a class="page-link"
                                                         href="Owner.jsp?page=<%=i%>"><%=i + 1%>
                    </a></li>
                    <% }
                        if(page_num==manager.GetOwnerCount()/sep) disable="disabled";
                        else disable="";
                    %>

                    <li class="page-item <%=disable%>">
                        <a class="page-link" href="Owner.jsp?page=<%=next%>">다음</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</section>
<%@include file="../../footer.jsp" %>
</body>
</html>
