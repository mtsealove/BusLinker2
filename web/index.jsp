<%@ page import="BusLinker.Table.NoticeManager" %>
<%@ page import="BusLinker.Table.Notice" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/11/27
  Time: 4:07 오후
  To change this template use File | Settings | File Templates.

--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <%@ include file="config.jsp" %>
    <title>버스링커</title>

    <script>
        $(function () {
            $('.notice_tr').click(function () {
                var notice_id=$(this).attr('data-notice-id');
                location.href="board_notice.jsp?notice_id="+notice_id;
            })
        });
    </script>
</head>
<body>
<!--nav-->
<%@include file="nav.jsp" %>

<!--panel-->
<%@include file="panel.jsp" %>

<div class="main">
    <div class="card">
        <img src="images/tmp_intro2.jpg" class="card-img-top" height="300">
        <div class="card-body">
            <h4 class="card-title">
                BusLinker
            </h4>
            <p class="card-text">버스링커는 이러한 회사입니다</p>
            <span class="more"><a href="intro.jsp?current=1">자세히 알아보기</a></span>
        </div>
    </div>

    <div class="bottom_div">
        <div class="card card_helf" style="margin-right: 0.5%">
            <div class="card-body">
                <h4 class="card-title">공지사항</h4>

                <table class="table table-hover">
                    <%
                        NoticeManager noticeManager = new NoticeManager(3);
                        ArrayList<Notice> notices = noticeManager.GetNotice(0);
                        for(Notice notice:notices) { %>
                        <tr class="notice_tr" data-notice-id="<%=notice.getNoticeID()%>">
                            <td><%=notice.getTitle()%></td>
                            <td><%=notice.getNoticeTime().substring(0, 16)%></td>
                        </tr>
                        <% } %>
                </table>
                <span class="more"><a href="notice.jsp?current=1">더보기</a></span>
            </div>
        </div>

        <div class="card card_helf" style="margin-left: 0.5%">
            <div class="card-body">
                <h4 class="card-title">연락처</h4>
                <p>대표: 박두용</p>
                <p><a href="tel:01039269116">Phone: 010-3926-9116</a></p>
                <p><a href="mailto:pdy@gmail.com">Mail: pdy@gmail.com</a></p>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<%@include file="footer.jsp" %>
</body>
</html>
