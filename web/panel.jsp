<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/11/30
  Time: 6:08 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    //사용자 종류에 따라 다른 레이아웃 출력
    int classID = -1;
    try {
        classID = Integer.parseInt(session.getAttribute("userClass").toString());
    } catch (Exception e) {

    }
    String uri = request.getRequestURI();
    String[] sp=uri.split("/");
    uri=sp[sp.length-1];
    System.out.println(uri);

    //처음 접속하였을 때 가정
    try {
        uri = uri.split("/")[2];
    } catch (Exception e) {
        uri = "index.jsp";
    }
    String dir = request.getContextPath();
    String images = dir + "/images/";
%>

<script src="<%=dir%>/Scripts/Panel.js"></script>
<script>
    $(function () {
        getCurrent();
        $('.panel_m').click(function () {
            move(this);
        })
    });

    //현재 페이지 인디케이트 설정
    function getCurrent() {
        var page = "<%=uri%>";
        var objs = $('.panel_item');
        for (var i = 0; i < objs.length; i++) {
            if (page.indexOf($(objs[i]).attr('data-page')) != -1) {
                $(objs[i]).attr('class', 'panel_item panel_current');
                $(objs[i]).children('.indicator').css('visibility', 'visible');
                //확장 가능하면 확장
                if ($(objs[i]).attr('data-extend-div')) {
                    var div_id = $(objs[i]).attr('data-extend-div');
                    $('#' + div_id).show();
                }
            }
        }
    }

    function move(obj) {
        var addr = $(obj).attr('data-page');
        location.href = '<%=dir%>/' + addr;
    }
</script>

<div class="panel" id="panel">
    <div class="logo_div">
        <div class="logo_main" id="logo_main">
            <img src="<%=images%>logo.png" width="30" height="30" style="display: inline">
            <p class="logo_p">BusLinker</p>
        </div>
    </div>

    <div class="panel_content">
        <div class="panel_item panel_m" data-page="index.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="<%=images%>home.png">
            <label class="panel_text">홈</label>
        </div>

        <div class="panel_item panel_m" data-page="intro.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="<%=images%>setting.png">
            <label class="panel_text">회사 소개</label>
        </div>

        <div class="panel_item panel_m" data-page="notice.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="<%=images%>info.png">
            <label class="panel_text">공지사항</label>
        </div>


        <!--모바일 전용-->
        <div class="panel_item" id="login_m">
            <div class="indicator"></div>
            <img class="panel_img" src="<%=images%>member.png">
            <%
                String userName = null;
                try {
                    userName = session.getAttribute("userName").toString();
                } catch (Exception e) {

                }
                if (userName != null) { %>
            <label class="panel_text" onclick="logout()"><%=userName%>
            </label>
            <% } else { %>
            <label class="panel_text" onclick="login()">로그인</label>
            <% }%>

        </div>

        <!--관리자 컨텐트-->
        <% if (classID == 1) { %>
        <div class="divider">
            <label>관리자 메뉴</label>
        </div>

        <div class="panel_item panel_m" data-page="Manager/Home.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="<%=images%>home.png">
            <label class="panel_text">관리자 홈</label>
        </div>

        <div class="panel_item panel_extend" data-extend-div="register_div" data-page="Register">
            <div class="indicator"></div>
            <img class="panel_img" src="<%=images%>member.png">
            <label class="panel_text">등록</label>
        </div>

        <div id="register_div" class="extend_div">
            <div class="extend_div_content" data-page="Manager/Register/Owner.jsp"><label class="panel_text">화주사
                등록</label></div>
            <div class="extend_div_content" data-page="Manager/Register/Company.jsp"><label class="panel_text">운송사업자
                등록</label></div>
            <div class="extend_div_content"><label class="panel_text">물류센터 등록</label></div>
            <div class="extend_div_content" data-page="Manager/Register/Staff.jsp"><label class="panel_text">물류관리 직원
                등록</label></div>
        </div>

        <div class="panel_item panel_extend" data-extend-div="inquire_div" data-page="Inquire">
            <div class="indicator"></div>
            <img class="panel_img" src="<%=images%>member.png">
            <label class="panel_text">조회</label>
        </div>

        <div id="inquire_div" class="extend_div">
            <div class="extend_div_content" data-page="ManagerInquireOwner.jsp"><label class="panel_text">화주사
                조회</label></div>
            <div class="extend_div_content" data-page="ManagerInquireCompany.jsp"><label class="panel_text">운송사업자
                조회</label></div>
            <div class="extend_div_content"><label class="panel_text">조회 등록</label></div>
            <div class="extend_div_content" data-page="ManagerInquireStaff.jsp"><label class="panel_text">물류관리 직원
                조회</label></div>
        </div>
        <% } %>

    </div>
</div>