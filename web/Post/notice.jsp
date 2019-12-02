<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/02
  Time: 12:41 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="BusLinker.NoticeManager" %>
<%
    request.setCharacterEncoding("euc-kr");
    String memberID = session.getAttribute("userID").toString();
    System.out.println(memberID);

    String uploadPath = request.getRealPath("/uploadFile");
    System.out.println("절대경로 : " + uploadPath);

    int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한

    String fileName1 = ""; // 중복처리된 이름
    String originalName1 = ""; // 중복 처리전 실제 원본 이름
    long fileSize = 0; // 파일 사이즈
    String fileType = ""; // 파일 타입

    String title = "", content = "";
    int noticeID=-1;

    MultipartRequest multi = null;

    try {
        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
        multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

        title = multi.getParameter("title");
        content = multi.getParameter("content");
        noticeID = Integer.parseInt(multi.getParameter("notice_id"));
        System.out.println(title);
        System.out.println(content);

        // 전송한 전체 파일이름들을 가져옴
        Enumeration files = multi.getFileNames();

        while (files.hasMoreElements()) {
            String file1 = (String) files.nextElement(); // 파일 input에 지정한 이름을 가져옴
            // 그에 해당하는 실재 파일 이름을 가져옴
            originalName1 = multi.getOriginalFileName(file1);
            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
            fileName1 = multi.getFilesystemName(file1);
            // input file name에 해당하는 실재 파일을 가져옴
            File file = multi.getFile(file1);
            // 그 파일 객체의 크기를 알아냄
            fileSize = file.length();
        }
    } catch (Exception e) {

    } finally { //데이터 삽입은 무조건 수행
        NoticeManager noticeManager = new NoticeManager(0);
        System.out.println("공지번호: "+noticeID);
        if(noticeID==-1) {
            if (noticeManager.CreateNotice(memberID, title, content, fileName1)) {
                out.println("<script>alert('공지사항이 등록되었습니다');location.href='../notice.jsp';</script>");
            } else {
                out.println("<script>alert('오류가 발생하였습니다.');history.go(-1);'</script>");
            }
        } else {
            if (noticeManager.UpdateNotice(noticeID, title, content, fileName1)) {
                out.println("<script>alert('공지사항이 수정되었습니다');location.href='../notice.jsp';</script>");
            } else {
                out.println("<script>alert('오류가 발생하였습니다.');history.go(-1);'</script>");
            }
        }

    }
%>
