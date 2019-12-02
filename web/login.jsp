<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/11/27
  Time: 6:39 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <%@ include file="config.jsp" %>
    <script>
        $(function () {
            set_content_center()
            $('#login_btn').click(function () {
                check_input();
            });

            $('#pw_input').keydown(function (key) {
                if (key.keyCode == 13) {
                    check_input();
                }
            });
        });

        //div 가운데 정렬
        function set_content_center() {
            var content = $('#content');
            var height = content.outerHeight(true);
            content.css('margin-top', (-1) * height / 2);
        }

        //입력 값 검증
        function check_input() {
            if ($('#id_input').val() == '') {
                alert('아이디를 입력하세요');
                return;
            } else if ($('#pw_input').val() == '') {
                alert('비밀번호를 입력하세요');
                return;
            } else {
                Login();
            }
        }

        //로그인 수행
        function Login() {
            $.ajax({
                url: "./Post/login.jsp",
                type: "post",
                data: {
                    id: $('#id_input').val(),
                    pw: $('#pw_input').val()
                },
                dataType: "json",
                success: function (obj) {
                    if (obj.ID) {
                        location.href = "index.jsp";
                    } else {
                        alert("아이디와 비밀번호를 확인하세요");
                    }
                },
                error: function (err) {
                    console.log(err);
                    alert("아이디와 비밀번호를 확인하세요");
                }
            });
        }
    </script>
</head>
<body>
<div class="login_left">

</div>
<div class="login_right">
    <div class="login_content" id="content">
        <img src="images/logo.png" class="logo">
        <h1 class="h1 logo_text">BusLinker</h1>
        <form method="post" id="login_from" action="Post/login.jsp">
            <input class="under_line" name="id" id="id_input" placeholder="아이디를 입력하세요" type="text"><br>
            <input class="under_line" name="pw" id="pw_input" placeholder="비밀번호를 입력하세요" type="password"><br>
        </form>
        <button id="login_btn" class="btn-purple login_btn">로그인</button>
    </div>
</div>
</body>
</html>
