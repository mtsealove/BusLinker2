<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/02
  Time: 9:22 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>화주사 등록</title>
    <%@include file="config.jsp" %>
    <script>
        $(function () {
            $('#pw_valid').hide();
            $('#pw_same').hide();
            //동일주소 체크 시 값 변경때마다 동일한 값 입력
            $('#business_addr_input').change(function () {
                if ($('#same_addr').is(":checked")) {
                    var addr = $('#business_addr_input').val();
                    $('#center_addr_input').val(addr);
                }
            });
            //동일 주소 체크 시 바로 값 변경
            $('#same_addr').change(function () {
                if ($('#same_addr').is(":checked")) {
                    var addr = $('#business_addr_input').val();
                    $('#center_addr_input').val(addr);
                }
            });

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
        });

        function same_password() {
            if ($('#pw_confirm_input').val() != $('#pw_input').val()) {
                $('#pw_same').show(300);
                return false;
            } else {
                $('#pw_same').hide(300);
                return true;
            }
        }

        function CheckInput() {
            if ($('#name_input').val() == '') {
                alert('업체명을 입력하세요');
                return;
            } else if ($('#num_input').val() == '') {
                alert('사업자 등록번호를 입력하세요');
                return;
            } else if ($('#business_addr_input').val() == '') {
                alert('사업장 주소지를 입력하세요');
                return;
            } else if ($('#center_addr_input').val() == '') {
                alert('창고 주소지를 입력하세요');
                return;
            } else if ($('#cat_input').val() == '') {
                alert('주요 상품 종류를 입력하세요');
                return;
            } else if ($('#contact_input').val() == '') {
                alert('전화번호를 입력하세요');
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
            } else if(!CheckPassword()) {
                alert('비밀번호는 영문 대/소문자 및 특수문자 포함 8 자 이상이여야 합니다');
                return;
            } else {
                if(confirm("화주를 등록하시겠습니까?"))
                    $('#register_form').submit();
            }
        }

        //비밀번호 규칙 확인
        function CheckPassword() {
            var pw = $('#pw_input').val();
            var upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            var lower="abcdefghijklmnopqrstuvwxyz";
            var special="`~!@#$%^&*()_+-=[]{}<>,./?";
            var upperB=false, lowerB=false, specialB=false, lengthB=false;
            //대문자
            for(var i=0; i<upper.length; i++) {
                if(pw.indexOf(upper.charAt(i))!=-1) {
                    upperB=true;
                    break;
                }
            }
            //소문자
            for(var i=0; i<lower.length; i++) {
                if(pw.indexOf(lower.charAt(i))!=-1) {
                    lowerB=true;
                    break;
                }
            }
            //특수문자
            for(var i=0; i<special.length; i++) {
                if(pw.indexOf(special.charAt(i))!=-1) {
                    specialB=true;
                    break;
                }
            }
            //길이
            if(pw.length<8) lengthB=false;
            else lengthB=true;

            if(upperB&&lowerB&&specialB&&lengthB) {
                $('#pw_valid').hide(300);
                return true;
            } else {
                $('#pw_valid').show(300);
                return false;
            }
        }
    </script>
</head>
<body>
<%@include file="nav.jsp" %>
<%@include file="panel.jsp" %>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">화주사 등록</h4>
            <div class="register_div">
                <form action="Manager/Post/CreateOwner.jsp" method="post" id="register_form">
                    <input class="form-control" name="Name" type="text" placeholder="업체명" id="name_input"><br>
                    <input class="form-control" name="BusinessNum" type="text" placeholder="사업자등록 번호"
                           id="num_input"><br>
                    <input class="form-control" name="BusinessAddr" type="text" placeholder="업체 주소"
                           id="business_addr_input"><br>
                    <input class="form-control" name="CenterAddr" type="text" placeholder="창고 주소"
                           id="center_addr_input">
                    <input type="checkbox" id="same_addr"><label for="same_addr">&nbsp;업체 주소와 동일</label><br>
                    <input class="form-control" name="Category" type="text" placeholder="주요 상품 종류" id="cat_input"><br>
                    <input class="form-control" name="Contact" type="tel" placeholder="연락처" id="contact_input"><br>
                    <input class="form-control" name="Mail" type="email" placeholder="메일 주소" id="mail_input"><br>
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
<%@include file="footer.jsp" %>
</body>
</html>
