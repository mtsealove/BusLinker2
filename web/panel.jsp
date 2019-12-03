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

    //처음 접속하였을 때 가정
    try {
        uri = uri.split("/")[2];
    } catch (Exception e) {
        uri = "index.jsp";
    }
%>

<script>
    $(function () {
        center_logo();
        $('.extend_div').hide();
        $('.panel_move').click(function () {
            move(this);
        });
        $('.extend_div_content').click(function () {
            move(this);
        });
        $('.panel_extend').click(function () {
            extend(this);
        });
        getCurrent();
        //사이즈 변경 이벤트
        $(window).resize(function () {
            center_logo();
            if (window.outerWidth > 600) {
                $('#panel').show(500);
            } else {
                $('#panel').hide();
            }
        });
    });

    //로고 가운데 정렬
    function center_logo() {
        var obj = $('#logo_main');
        var width = obj.outerWidth(true);
        obj.css('margin-left', (-1) * width / 2);
    }

    function move(obj) {
        var page_addr = $(obj).attr('data-page');
        location.href = page_addr;
    }

    function extend(obj) {
        var div_id = $(obj).attr('data-extend-div');
        $('#' + div_id).toggle(400);
    }

    //현재 페이지 인디케이트 설정
    function getCurrent() {
        var page = "<%=uri%>";
        var objs = $('.panel_item').attr('class', 'panel_item');
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

    function login() {
        location.href = 'login.jsp';
    }

    function logout() {
        if (confirm('로그아웃 하시겠습니까?')) {
            location.href = 'Get/logout.jsp';
        }
    }
</script>

<div class="panel" id="panel">
    <div class="logo_div">
        <div class="logo_main" id="logo_main">
            <img src="images/logo.png" width="30" height="30" style="display: inline">
            <p class="logo_p">BusLinker</p>
        </div>
    </div>

    <div class="panel_content">
        <div class="panel_item panel_move" data-page="index.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="images/home.png">
            <label class="panel_text">홈</label>
        </div>

        <div class="panel_item panel_move" data-page="intro.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="images/setting.png">
            <label class="panel_text">회사 소개</label>
        </div>

        <div class="panel_item panel_move" data-page="notice.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="images/info.png">
            <label class="panel_text">공지사항</label>
        </div>

        <div class="panel_item" id="login_m">
            <div class="indicator"></div>
            <img class="panel_img" src="images/member.png">
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

        <div class="panel_item panel_move" data-page="ManagerHome.jsp">
            <div class="indicator"></div>
            <img class="panel_img" src="images/home.png">
            <label class="panel_text">관리자 홈</label>
        </div>

        <div class="panel_item panel_extend" data-extend-div="register_div" data-page="Register">
            <div class="indicator"></div>
            <img class="panel_img" src="images/member.png">
            <label class="panel_text">등록</label>
        </div>

        <div id="register_div" class="extend_div">
            <div class="extend_div_content" data-page="ManagerRegisterOwner.jsp"><label class="panel_text">화주사
                등록</label></div>
            <div class="extend_div_content" data-page="ManagerRegisterCompany.jsp"><label class="panel_text">운수사업자 등록</label></div>
            <div class="extend_div_content"><label class="panel_text">물류센터 등록</label></div>
            <div class="extend_div_content"><label class="panel_text">물류관리 직원 등록</label></div>
        </div>
        <% } %>

    </div>
</div>