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
            //동일주소 체크 시 값 변경때마다 동일한 값 입력
            $('#business_addr_input').change(function () {
                if($('#same_addr').is(":checked")) {
                    var addr=$('#business_addr_input').val();
                    $('#center_addr_input').val(addr);
                }
            });
            $('#same_addr').change(function(){
                if($('#same_addr').is(":checked")) {
                    var addr=$('#business_addr_input').val();
                    $('#center_addr_input').val(addr);
                }
            });
        });
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
                <form action="Manager/Post/CreateOwner.jsp" method="post" id="form">
                    <input class="form-control" name="Name" type="text" placeholder="업체명" id="name_input"><br>
                    <input class="form-control" name="BusinessNum" type="text" placeholder="사업자등록 번호" id="num_input"><br>
                    <input class="form-control" name="BusinessAddress" type="text" placeholder="업체 주소" id="business_addr_input"><br>
                    <input class="form-control" name="CenterAddress" type="text" placeholder="창고 주소" id="center_addr_input">
                    <input type="checkbox" id="same_addr"><label for="same_addr">&nbsp;업체 주소와 동일</label><br>
                    <input class="form-control" name="Category" type="text" placeholder="주요 상품 종류" id="cat_input"><br>
                    <input class="form-control" name="Contact" type="text" placeholder="연락처" id="contact_input"><br>
                    <input class="form-control" name="Mail" type="text" placeholder="메일 주소" id="mail_input"><br>
                    <input class="form-control" name="Password" type="text" placeholder="비밀번호" id="pw_input"><br>
                    <input class="form-control" name="PasswordConfirm" type="text" placeholder="비밀번호 확인" id="pw_confirm_input">
                </form>
                <button class="btn btn-primary" id="register_btn">등록</button>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
