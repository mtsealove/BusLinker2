<%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/03
  Time: 6:11 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>운송사업자 등록</title>
    <%@include file="config.jsp"%>
    <%@include file="check_manager.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<%@include file="panel.jsp"%>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">운송사업자 등록</h4>
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
<%@include file="footer.jsp"%>
</body>
</html>
