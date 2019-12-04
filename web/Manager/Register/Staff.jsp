<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/02
  Time: 9:22 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    String root = request.getContextPath();
%>
<html>
<head>
    <title>물류관리 직원 등록</title>
    <%@include file="../../config.jsp" %>
    <script src="../../Scripts/Input.js"></script>
    <script>
        $(function () {
            $('#pw_valid').hide();
            $('#pw_same').hide();
            $('#id_valid').hide();

            //확인 버튼
            $('#register_btn').click(function () {
                CheckInput();
            });
            //비밀번호 규칙 여부 체크
            $('#pw_input').change(function () {
                CheckPassword();
            });
            //비밀번호 동일여부 체크
            $('#pw_confirm_input').change(function () {
                same_password();
            })

            //ID 확인
            $('#mail_input').change(function () {
                CheckID();
            });
        });

        function CheckInput() {
            if ($('#name_input').val() == '') {
                alert('이름을 입력하세요');
                return;
            } else if ($('#age_input').val() == '') {
                alert('나이를 입력하세요');
                return;
            } else if ($('#addr_input').val() == '') {
                alert('주소를 입력하세요');
                return;
            } else if ($('#mail_input').val() == '') {
                alert('메일 주소를 입력하세요');
                return;
            } else if ($('#pw_input').val() == '') {
                alert('비밀번호를 입력하세요');
                return;
            } else if ($('#pw_confirm_input').val() == '') {
                alert('비밀번호를 확인하세요');
                return;
            } else if (!same_password()) {
                alert('비밀번호가 일치하지 않습니다');
                return;
            } else if (!CheckPassword) {
                alert('비밀번호는 영문 대/소문자 및 특수문자 포함 8자 이상이여야 합니다');
                return;
            } else if (!$('#id_valid').attr('data-check')) {
                alert('이미 사용중인 ID 입니다');
                return;
            } else {
                $('#register_form').submit();
            }
        }

        function CheckID() {
            $.ajax({
                url: "<%=root%>/Scripts/CheckID.ajax.jsp",
                method: "GET",
                data: {
                    ID: $('#mail_input').val()
                },
                dataType: "json"
            }).done(function (json) {
                if (!json.result) {
                    $('#id_valid').attr('data-check', false);
                    $('#id_valid').show(300);
                } else {
                    $('#id_valid').hide(300);
                    $('#id_valid').attr('data-check', true);
                }
            }).fail(function (xhr, status, err) {
                alert('오류 발생');
                console.log(err);
            })
        }
    </script>
</head>
<body>
<%@include file="../../nav.jsp" %>
<%@include file="../../panel.jsp" %>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">물류관리 직원 등록</h4>
            <div class="register_div">
                <form action="../Post/CreateStaff.jsp" method="post" id="register_form">
                    <input class="form-control" name="Name" type="text" placeholder="이름" id="name_input">
                    <div style="margin-top: 10px">
                        <label>성별</label>&nbsp;&nbsp;
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="Gender" id="male" value="M" checked>
                            <label class="form-check-label" for="male">남성</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="Gender" id="female" value="F">
                            <label class="form-check-label" for="female">여성</label>
                        </div>
                    </div>
                    <input class="form-control" name="Age" type="text" placeholder="나이" id="age_input"><br>
                    <input class="form-control" name="Contact" type="tel" placeholder="연락처" id="contact_input"><br>
                    <input class="form-control" name="Addr" placeholder="주소 입력" id="addr_input">
                    <br>
                    <input class="form-control" name="Mail" type="email" placeholder="메일 주소" id="mail_input">
                    <label id="id_valid"><span style="color: red">사용 불가능한 메일 입니다</span></label><br>
                    <input class="form-control" name="Password" type="password"
                           placeholder="비밀번호(영문 대/소문자 및 특수문자 포함 8자 이상)" id="pw_input">
                    <label id="pw_valid"><span style="color: red">사용 불가능한 비밀번호 입니다</span></label><br>
                    <input class="form-control" name="PasswordConfirm" type="password" placeholder="비밀번호 확인"
                           id="pw_confirm_input">
                    <label id="pw_same"><span style="color: red">비밀번호가 일치하지 않습니다</span></label>
                </form>
                <button class="btn btn-primary" id="register_btn">등록</button>
            </div>
        </div>
    </div>
</section>
<%@include file="../../footer.jsp" %>
</body>
</html>
