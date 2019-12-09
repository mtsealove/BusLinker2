<%@ page import="BusLinker.Table.TableManager" %>
<%@ page import="java.awt.geom.Area" %>
<%@ page import="BusLinker.Table.Company" %>
<%@ page import="BusLinker.Table.Center" %><%--
  Created by IntelliJ IDEA.
  User: isanhae
  Date: 2019/12/06
  Time: 12:04 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>운행경로</title>
    <%@include file="../config.jsp" %>
    <%@include file="../check_manager.jsp" %>
    <script>
        $(function () {
            $('#center_div').hide();
            $('#timeline_div').hide();
            SelectBus();
            SelectCenter();
        });

        //버스사 선택
        function SelectBus() {
            $('.choose_bus').click(function () {
                var id = $(this).attr('data-id');
                var name = $(this).attr('data-name');

                if (confirm(name + "를 선택하시겠습니까?")) {
                    $("#company_id_input").val(id);
                    $('#bus_btn').text(name);
                    $('#bus_div').hide(400);
                    $('#center_div').show(400);
                }
            });
        }

        function SelectCenter() {
            $('.choose_center').click(function () {
                var id = $(this).attr('data-id');
                var name = $(this).attr('data-name');
                if (confirm(name + '를 선택하시겠습니까?')) {
                    $('#center_id_input').val(id);
                    $('#center_btn').text(name);
                    $('#center_div').hide(400);
                    $('#timeline_div').show(400);
                }
            })
        }
    </script>
</head>
<body>
<%@include file="../nav.jsp" %>
<%@include file="../panel.jsp" %>
<section class="main">
    <div class="card main_div">
        <div class="card-body">
            <h4 class="card-title">운행경로</h4>
            <form>
                <input name="company_id" id="company_id_input" hidden>
                <input name="center_id" id="center_id_input" hidden>
                <!--버스사 선택-->
                <div id="bus_div" class="register_div">
                    <h5 class="card-title">운송사업자 선택</h5>
                    <form>
                        <div class="form-group row">
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="bus_input" placeholder="버스사 검색">
                            </div>
                            <button class="btn btn-primary btn-block col-sm-3" style="margin-left: -15px">검색</button>
                        </div>
                    </form>
                    <div style="overflow: scroll; height: 600px">
                        <table class="table table-hover" style="text-align: center">
                            <thead class="thead-dark">
                            <tr>
                                <th>업체명</th>
                                <th>연락처</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                TableManager manager = new TableManager();
                                ArrayList<Company> companies = manager.getCompanies(0, 1000);
                                for (Company company : companies) { %>
                            <tr class="choose_bus" data-id="<%=company.getEmail()%>"
                                data-name="<%=company.getBusinessName()%>">
                                <td><%=company.getBusinessName()%>
                                </td>
                                <td><%=company.getMobile()%>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!--물류센터 선택-->
                <div id="center_div" class="register_div">
                    <h5 class="card-title">물류센터 선택</h5>
                    <form>
                        <div class="form-group row">
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="center_input" placeholder="물류센터 검색">
                            </div>
                            <button class="btn btn-primary btn-block col-sm-3" style="margin-left: -15px">검색</button>
                        </div>
                    </form>
                    <div style="overflow: scroll; height: 600px">
                        <table class="table table-hover" style="text-align: center">
                            <thead class="thead-dark">
                            <tr>
                                <th>업체명</th>
                                <th>연락처</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                ArrayList<Center> centerList = manager.getCenters(0, 1000);
                                for (Center center : centerList) { %>
                            <tr class="choose_center" data-id="<%=center.getID()%>"
                                data-name="<%=center.getBusinessName()%>">
                                <td><%=center.getBusinessName()%>
                                </td>
                                <td><%=center.getContact()%>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!--타임라인-->
                <div id="timeline_div" style="height: 700px; overflow: scroll">
                    <div class="register_div">
                        <button type="button" class="btn btn-outline-secondary timeline_btn" id="bus_btn"></button>
                        <button type="button" class="btn btn-outline-secondary timeline_btn" id="center_btn"></button>
                    </div>

                    <br>
                    <table class="table table-bordered table-striped">
                        <%
                            for (int i = 1; i <= 24; i++) { %>
                        <tr data-time="<%=i%>" class="timeline_tr">
                            <td style="text-align: center">
                                <%=i%>
                            </td>
                            <td style="width: 95%;">내용</td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>
