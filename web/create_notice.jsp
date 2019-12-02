<%@ page import="BusLinker.NoticeManager" %>
<%@ page import="BusLinker.Notice" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/01
  Time: 7:56 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    //작성 및 수정 파악
    int notice_id = -1;
    request.setCharacterEncoding("euc-kr");
    Notice notice = null;
    String title = "", content = "";
    try {   //수정이라면 해당 게시글 불러오기
        notice_id = Integer.parseInt(request.getParameter("notice_id").toString());
        NoticeManager noticeManager = new NoticeManager(0);
        notice = noticeManager.getNoticeById(notice_id);

        if(!notice.getMemberID().equals(session.getAttribute("userID").toString())) {
            out.println("<script>alert('올바른 접근이 아닙니다');history.go(-1);</script>");
        }
        title = notice.getTitle();
        content = notice.getContent();
    } catch (Exception e) {

    }

    String h4 = "공지사항 작성";
    if (notice_id != -1) {
        h4 = "공지사항 수정";
    }
%>
<html>
<head>
    <title><%=h4%></title>
    <%@include file="config.jsp" %>
    <%@include file="check_manager.jsp" %>
    <script>
        $(function () {
            $('#confirm_btn').click(function () {
                check_input();
            })
        });

        function check_input() {
            if($('#title_input').val()=='') {
                alert('제목을 입력하세요');
                return;
            } else if($('#content_ta').val()=='') {
                alert('내용을 입력하세요');
                return;
            } else {
                if(confirm('공지를 등록하시겠습니까?')) {
                    $('#notice_form').submit();
                }
            }
        }
    </script>
</head>
<body>
<%@include file="nav.jsp" %>
<%@include file="panel.jsp" %>
<div class="main" id="card-content">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title"><%=h4%></h4>
            <form id="notice_form" method="post" enctype="multipart/form-data" action="Post/notice.jsp">
                <input name="notice_id" value="<%=notice_id%>" hidden>
                <input class="form-control" name="title" type="text" id="title_input" placeholder="제목"
                       value="<%=title%>"><br>
                <textarea class="form-control" id="content_ta" name="content" rows="20"
                          placeholder="내용을 입력하세요"><%=content%></textarea>
                <br>
                <div class="form-group">
                    <label for="file_input">첨부파일 선택</label>
                    <input type="file" class="form-control-file" name="upload_file" id="file_input">
                </div>
                <button type="button" class="btn btn-primary create_btn" id="confirm_btn">작성하기</button>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
