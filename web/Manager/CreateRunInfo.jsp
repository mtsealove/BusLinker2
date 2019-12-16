<%@ page import="BusLinker.Table.TableManager" %>
<%@ page import="BusLinker.Table.Company" %>
<%@ page import="BusLinker.Table.Center" %>
<%@ page import="BusLinker.Table.Owner" %><%--
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
            ToggleOwner();
            $('.owner').hide();
            $('.timeline_form').hide();
            $('.timeline_div').hide();
            ToggleForm();
            RegisterEach();
            RemoveItem();
            RegisterAll();
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
                    $('#bus_id').val(id);
                }
            });
        }

        //물류센터 선택
        function SelectCenter() {
            $('.choose_center').click(function () {
                var id = $(this).attr('data-id');
                var name = $(this).attr('data-name');
                if (confirm(name + '를 선택하시겠습니까?')) {
                    $('#center_id_input').val(id);
                    $('#center_btn').text(name);
                    $('#center_div').hide(400);
                    $('#timeline_div').show(400);
                    $('#center_id').val(id);
                }
            });
        }

        //카테고리가 변하면
        function ToggleOwner() {
            //화주사면 출력
            $('.cat').change(function () {
                var owner_div = $(this).attr('data-owner');
                if ($(this).val() == '2') {
                    $('#' + owner_div).show(200);
                } else {
                    $('#' + owner_div).hide(200);
                }
            })
        }

        //등록 폼 여닫기
        function ToggleForm() {
            $('.timeline_td').click(function () {
                var form = $(this).attr('data-form');
                $('#' + form).toggle(200);
            })
        }

        function RegisterEach() {
            $('.register_btn').click(function () {
                var root = $(this).parent().parent();
                var result = "";
                var timeline_div = root.children('.timeline_div');
                var timeline_form = root.children('.timeline_form');
                timeline_form.hide(200);
                timeline_div.show(200);
                var second = timeline_form.children('.col');
                var selects = second.children('select').children('option:selected');
                var addr = $(root.children('.timeline_form').children('.col-7').children('.form-control')).val();

                var options = [];
                options.push($(selects[0]).val());
                options.push($(selects[1]).text());
                options.push($(selects[2]).val());
                for (var i = 0; i < options.length; i++) {
                    console.log(options[i]);
                }

                switch (options[0]) {
                    case '1':
                        result += "출발지";
                        break;
                    case '2':
                        result += "화주사 ";
                        result += options[1];
                        break;
                    case '3':
                        result += "물류창고";
                        break;
                    case '4':
                        result += "도착지";
                }

                switch (options[2]) {
                    case '1':
                        result += ' 직원 승차 ';
                        break;
                    case '2':
                        result += ' 직원 하차 ';
                        break;
                    case '3':
                        result += ' 화물 상차 ';
                        break;
                    case '4':
                        result += ' 화물 하차 ';
                        break;
                }

                result += addr;
                $(timeline_form.children('.use_input')).val(true);
                $(timeline_div.children('.timeline_content')).text(result);
            });
        }

        //아이템 삭제
        function RemoveItem() {
            $('.remove_btn').click(function () {
                var root = $(this).parent().parent();
                var timeline_div = root.children('.timeline_div');
                $(timeline_div).hide(200);
                var timeline_form = root.children('.timeline_form');
                $(timeline_form.children('.use_input')).val(false);
            })
        }

        function RegisterAll() {
            $('#register_btn').click(function () {
                if (confirm('운행정보를 등록하시겠습니까?')) {
                    $('#register_form').submit();
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
                            <thead class="thead-light">
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
                            <thead class="thead-light">
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
                    <form method="post" action="Post/CreateRunInfo.jsp" id="register_form">
                        <input hidden id="bus_id" name="bus_id">
                        <input hidden id="center_id" name="center_id">
                        <table class="table table-bordered table-striped">
                            <%
                                for (int i = 1; i <= 24; i++) {
                                    String ap;
                                    if (i >= 12) ap = "PM";
                                    else if (i == 24) ap = "AM";
                                    else ap = "AM";
                                    String time;
                                    if (i <= 12) time = Integer.toString(i);
                                    else if (i == 24) time = "00";
                                    else time = Integer.toString(i - 12);
                                    if (time.length() < 2) time = "0" + time;
                                    time += ":00 " + ap;
                            %>
                            <tr data-time="<%=i%>" class="timeline_tr">
                                <td style="text-align: center" class="timeline_td" data-form="timeline_form<%=i%>">
                                    <%=time%>
                                </td>
                                <td style="width: 90%;">
                                    <div class="timeline_div form-control" id="timeline_div<%=i%>">
                                        <label class="timeline_content"></label>
                                        <img src="<%=dir_nav%>/images/close.png" style="float: right; margin-top: 5px"
                                             width="16" height="16" class="remove_btn">
                                    </div>
                                    <div class="form-row timeline_form" id="timeline_form<%=i%>">
                                        <input hidden id="use<%=i%>" class="use_input" name="use">
                                        <div class="col">
                                            <select class="custom-select cat" name="cat"
                                                    data-owner="owner_div<%=i%>">
                                                <option value="1">출발지</option>
                                                <option value="2">화주사</option>
                                                <option value="3">물류창고</option>
                                                <option value="4">도착지</option>
                                            </select>
                                        </div>
                                        <div class="col owner" id="owner_div<%=i%>">
                                            <select class="custom-select" name="owner">
                                                <%
                                                    ArrayList<Owner> ownerArrayList = manager.getOwners(0, 1000);
                                                    for (Owner owner : ownerArrayList) { %>
                                                <option value="<%=owner.getEmail()%>"><%=owner.getName()%>
                                                </option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select class="custom-select" name="action">
                                                <option value="1">직원 승차</option>
                                                <option value="2">직원하차</option>
                                                <option value="3">화물 상차</option>
                                                <option value="4">화물 하차</option>
                                            </select>
                                        </div>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="addr_input<%=i%>" name="address"
                                                   placeholder="주소 입력">
                                        </div>
                                        <button type="button" class="col btn btn-primary register_btn">등록</button>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </table>

                        <div class="form-row" style="width: 800px">
                            <div class="col-7">
                                <input class="form-control" type="text" placeholder="경로명" name="alias">
                            </div>
                            <div class="col-2">
                                <button class="btn btn-outline-danger" id="register_btn" type="button">등록하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>
