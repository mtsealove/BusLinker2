<%@ page import="BusLinker.NoticeManager" %>
<%@ page import="BusLinker.Notice" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/02
  Time: 6:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    request.setCharacterEncoding("euc-kr");
    int notice_id = Integer.parseInt(request.getParameter("notice_id").toString());
    NoticeManager noticeManager = new NoticeManager(0);
    Notice notice = noticeManager.getNoticeById(notice_id);
    String userID = session.getAttribute("userID").toString();
    if (userID.equals(notice.getMemberID())) {  //사용자 인증
        if (noticeManager.DeleteNotice(notice_id)) {
            out.println("<script>alert('공지사항이 삭제되었습니다');location.href='../notice.jsp'</script>");
        }
    } else {
        out.println("<script>alert('올바은 접근이 아닙니다');history.go(-1)</script>");
    }
%>
