<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/01
  Time: 8:09 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    //사용자 권한 체크
    try {
        int userClass = Integer.parseInt(session.getAttribute("userClass").toString());
        if (userClass != 1) { %>
<script>
    alert('권한이 없습니다.\n관리자라면 다시 시도하세요.');
    history.go(-1);
</script>
<% }
} catch (Exception e) { %>
<script>
    alert('권한이 없습니다.\n관리자라면 다시 시도하세요.');
    history.go(-1);
</script>
<% } %>
