<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/09
  Time: 1:10 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>물류센터 등록</title>
    <%@include file="../../config.jsp" %>
    <script>

        $(function () {
            $('#register_btn').click(function () {
                CheckInput();
            });

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
        });

        function CheckInput() {
            if ($('#name_input').val() == '') {
                alert('업체명을 입력하세요');
            } else if ($('#business_num_input').val() == '') {
                alert('사업자등록번호를 입력하세요');
            } else if ($('#business_addr_input').val() == '') {
                alert('업체 주소를 입력하세요');
            } else if ($('#center_addr_input').val() == '') {
                alert('센터 주소를 입력하세요');
            } else if ($('#contact_input').val() == '') {
                alert('연락처를 입력하세요');
            } else if ($('#id_input').val() == '') {
                alert('아이디를 입력하세요');
            } else {
                $('#register_form').submit();
            }
        }
    </script>
</head>
<body>
<%@include file="../../nav.jsp" %>
<%@include file="../../panel.jsp" %>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">물류센터 등록</h4>
            <div class="register_div">
                <form id="register_form" action="../Post/CreateCenter.jsp" method="post">
                    <input class="form-control" name="name" type="text" placeholder="업체명" id="name_input"><br>
                    <input class="form-control" name="business_num" type="text" placeholder="사업자등록번호"
                           id="business_num_input"><br>
                    <input class="form-control" name="business_addr" type="text" placeholder="업체 주소"
                           id="business_addr_input"><br>
                    <input class="form-control" name="center_addr" type="text" placeholder="센터 주소"
                           id="center_addr_input">
                    <input type="checkbox" id="same_addr"><label for="same_addr">&nbsp;업체 주소와 동일</label><br>
                    <input class="form-control" name="contact" type="tel" placeholder="연락처" id="contact_input"><br>
                    <input class="form-control" name="id" type="text" placeholder="아이디" id="id_input"><br>
                </form>
                <button class="btn btn-primary" id="register_btn">등록</button>
            </div>
        </div>
    </div>
</section>

</body>
</html>
