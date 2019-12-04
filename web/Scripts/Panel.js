$(function () {
    center_logo();
    $('.extend_div').hide();

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

function extend(obj) {
    var div_id = $(obj).attr('data-extend-div');
    //나머지 div 숨김
    $('.extend_div').hide(300);
    $('#' + div_id).toggle(300);
}

function login() {
    location.href = 'login.jsp';
}

function logout() {
    if (confirm('로그아웃 하시겠습니까?')) {
        location.href = 'Get/logout.jsp';
    }
}