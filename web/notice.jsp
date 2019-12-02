<%@ page import="BusLinker.NoticeManager" %>
<%@ page import="BusLinker.Notice" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/01
  Time: 12:18 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <%@include file="config.jsp" %>
    <title>공지사항</title>
    <script>
        $(function () {
            //공지사항 작성
            $('#create_btn').click(function () {
                location.href = "create_notice.jsp";
            });
            //각 공지사항 클릭 메서드
            $('.notice_item').click(function () {
                var notice_id = $(this).attr('data-notice-id');
                location.href = 'board_notice.jsp?notice_id=' + notice_id;
            })
        });
    </script>
</head>
<body>
<%@include file="nav.jsp" %>
<%@include file="panel.jsp" %>
<section class="main">
    <div class="card main_div" id="card-content">
        <div class="card-body">
            <h4 class="card-title">공지사항</h4>
            <table class="table table-hover" style="text-align: center">
                <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>제목</th>
                    <th>작성 시간</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int page_num = 0;
                    try {
                        page_num = Integer.parseInt(request.getParameter("page_num").toString());
                    } catch (Exception e) {

                    }
                    NoticeManager noticeManager = new NoticeManager(13);
                    ArrayList<Notice> notices = noticeManager.GetNotice(page_num);
                    for (Notice notice : notices) { %>
                <tr class="notice_item" data-notice-id="<%=notice.getNoticeID()%>">
                    <td><%=notice.getNoticeID()%>
                    </td>
                    <td><%=notice.getTitle()%>
                    </td>
                    <td><%=notice.getNoticeTime()%>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <div>
                <nav>
                    <ul class="pagination justify-content-center">
                        <%
                            int previous = page_num - 1;
                            int next = page_num + 1;
                            String disable="";
                            if(page_num==0) disable="disabled";
                            int page_count=notices.size()/14;
                        %>

                        <li class="page-item <%=disable%>">
                            <a class="page-link" href="notice.jsp?page_num=<%=previous%>" tabindex="-1">이전</a>
                        </li>
                        <% for (int i = page_num; i < page_num + 10; i++) {
                            if(i>noticeManager.GetNoticePage()) break;
                            String active = "";
                            if (i == page_num) active = "active"; %>
                        <li class="page-item <%=active%>"><a class="page-link"
                                                             href="notice.jsp?page_num=<%=i%>"><%=i + 1%>
                        </a></li>
                        <% }
                            if(page_num==noticeManager.GetNoticePage()) disable="disabled";
                            else disable="";
                        %>

                        <li class="page-item <%=disable%>">
                            <a class="page-link" href="notice.jsp?page_num=<%=next%>">다음</a>
                        </li>
                    </ul>
                </nav>
                <% //관리자일 경우만 버튼 표시
                    if (classID == 1) { %>
                <button class="btn btn-primary create_btn" id="create_btn" style="">공지사항 작성</button>
                <% } %>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
