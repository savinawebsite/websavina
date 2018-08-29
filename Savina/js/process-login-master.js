function registerwithemail() {
    $('.content-tab-login').css('display', 'none')
    $('.content-tab-register-social').css('display', 'none')
    $('.content-tab-register').css('display', 'block')
    $('.content-tab-forgotten-password').css('display', 'none')
}

function openModalLoginForm() {
    $('#login-modal').modal();
    $('.content-tab-login').css('display', 'block')
    $('.content-tab-register-social').css('display', 'none')
    $('.content-tab-register').css('display', 'none')
    $('.content-tab-forgotten-password').css('display', 'none')
    //$('.form-errors').html("Mật khẩu không đúng, vui lòng nhập lại")
}

function openModalRegister() {
    $('#login-modal').modal();
    $('.content-tab-login').css('display', 'none')
    $('.content-tab-register-social').css('display', 'block')
    $('.content-tab-register').css('display', 'none')
    $('.content-tab-forgotten-password').css('display', 'none')
}

function viewCart() {
    window.open('../checkout.aspx');
}

function callRegisterBtn() {
    $('.content-tab-login').css('display', 'none')
    $('.content-tab-register-social').css('display', 'block')
    $('.content-tab-register').css('display', 'none')
    $('.content-tab-forgotten-password').css('display', 'none')

}

function callLoginBtn() {
    $('.content-tab-login').css('display', 'block')
    $('.content-tab-register-social').css('display', 'none')
    $('.content-tab-register').css('display', 'none')
    $('.content-tab-forgotten-password').css('display', 'none')
}