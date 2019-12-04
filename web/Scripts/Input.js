function same_password() {
    if ($('#pw_confirm_input').val() != $('#pw_input').val()) {
        $('#pw_same').show(300);
        return false;
    } else {
        $('#pw_same').hide(300);
        return true;
    }
}

//비밀번호 규칙 확인
function CheckPassword() {
    var pw = $('#pw_input').val();
    var upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var lower = "abcdefghijklmnopqrstuvwxyz";
    var special = "`~!@#$%^&*()_+-=[]{}<>,./?";
    var upperB = false, lowerB = false, specialB = false, lengthB = false;
    //대문자
    for (var i = 0; i < upper.length; i++) {
        if (pw.indexOf(upper.charAt(i)) != -1) {
            upperB = true;
            break;
        }
    }
    //소문자
    for (var i = 0; i < lower.length; i++) {
        if (pw.indexOf(lower.charAt(i)) != -1) {
            lowerB = true;
            break;
        }
    }
    //특수문자
    for (var i = 0; i < special.length; i++) {
        if (pw.indexOf(special.charAt(i)) != -1) {
            specialB = true;
            break;
        }
    }
    //길이
    if (pw.length < 8) lengthB = false;
    else lengthB = true;

    if (upperB && lowerB && specialB && lengthB) {
        $('#pw_valid').hide(300);
        return true;
    } else {
        $('#pw_valid').show(300);
        return false;
    }
}