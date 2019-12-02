<%@ page import="BusLinker.Notice" %>
<%@ page import="BusLinker.NoticeManager" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/02
  Time: 2:19 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    request.setCharacterEncoding("euc-kr");
    int noticeID = -1;
    try {
        noticeID = Integer.parseInt(request.getParameter("notice_id").toString());
    } catch (Exception e) {

    }
    NoticeManager noticeManager = new NoticeManager(0);
    Notice notice = noticeManager.getNoticeById(noticeID);
%>
<html>
<head>
    <%@ include file="config.jsp" %>
    <title>공시사항</title>
    <script>
        $(function () {
           $('#edit_btn').click(function () {
               location.href='create_notice.jsp?notice_id=<%=noticeID%>';
           }) ;
            $('#remove_btn').click(function () {
                if(confirm('공지사항을 삭제하시겠습니까?')) {
                    $('#remove_form').submit();
                }
            })
        });
    </script>
</head>
<body>
<%@include file="nav.jsp" %>
<%@include file="panel.jsp" %>
<div class="main">
    <div class="card main_div" id="card-content">
        <div class="card-body">
            <h4 class="card-title"><%=notice.getTitle()%>
            </h4>
            <p class="time"><%="작성시간: " + notice.getNoticeTime()%>
            </p>
            <%
                //이미지 처리
                if (notice.getFilePath() != null && notice.getFilePath().length() != 0) {
                    System.out.println(notice.getFilePath());
                    String[] sp = (notice.getFilePath()).split("\\.");
                    String ext = sp[sp.length - 1];  //확장자 구분
                    String[] imageExt = {"jpg", "jpeg", "png", "bmp", "gif"};
                    boolean isImage = false;
                    //이미지 파일인지 확인
                    for (String image : imageExt) {
                        if (image.equals(ext)) {
                            isImage = true;
                            break;
                        }
                    }
                    if (isImage) { %>
            <img src='<%="uploadFile/"+notice.getFilePath()%>' width="300"><br><br>

            <% }
            } %>
            <% //문자열 처리
                String[] content = notice.getContent().split("\n");
                for (String line : content) { %>
            <p class="notice_line"><%=line%>
            </p>
            <% } %>
            <%
                //작성자라면 수정, 삭제 가능
                if (session.getAttribute("userID") != null
                        && notice.getMemberID().equals(session.getAttribute("userID").toString())) { %>
            <div style="text-align: right">
                <button class="btn btn-outline-info" id="edit_btn">수정</button>
                &nbsp;
                <form action="Post/delete_notice.jsp" hidden id="remove_form" method="post">
                    <input name="notice_id" value="<%=noticeID%>">
                </form>
                <button class="btn btn-outline-danger" id="remove_btn">삭제</button>
            </div>
            <% } %>

        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
