var reg = /^([a-zA-Z\d][\w-]{2,})@(\w{2,})\.([a-z]{2,})(\.[a-z]{2,})?$/

$("#email").blur(function (){

    var email = $("#email").val();  //获取接收验证码的邮箱
    var flag = reg.test(email);

    if(!flag) {
        $("#e-btn").attr("disabled","disabled");
        $("#reg-btn").attr("disabled","disabled");
        $("#email").next().text("邮箱格式不正确");
        $("#email").next().css("color","red");
    }else {
        $("#e-btn").removeAttr("disabled");
        $("#reg-btn").removeAttr("disabled");
        $("#email").next().text("");
    }
})

$("#e-btn").click(function (){
    $("#e-btn").attr("disabled","disabled");
    var email = $("#email").val();  //获取接收验证码的邮箱
    var url = "getEmailCode?toEmail=" + email;  //地址与邮箱拼接
    var time = 60;  //设置点击后60秒才能再发送验证码
    var time_dis = setInterval(function (){
        if (time == 0) {
            $("#e-btn").val("重新获取");
            $("#e-btn").removeAttr("disabled");
            clearInterval(time_dis);
        }else {
            $("#e-btn").val("重新获取 (" + time + ")");
            time--;
        }
    },1000);
    $.get(url,function (result) {
        console.log("result",result);
    });
    // var time_dis = setInterval(function (){
    //     if (time == 0) {
    //         $("#e-btn").text("重新获取");
    //         $("#e-btn").removeAttr("disabled");
    //         clearInterval(time_dis);
    //     }else {
    //         $("#e-btn").text("重新获取 (" + time + ")");
    //         time--;
    //     }
    // },1000);
})

$("#code").blur(function (){
    var code = $("#code").val();    //获取用户输入的验证码
    var url = "checkEmailCode?code=" + code;
    $.get(url,function (result) {
        console.log(result);
        if (result.indexOf("校验失败") == 1) {
            $("#reg-btn").click(function (event) {
                event.preventDefault();
                alert("验证码错误!");
                document.location.href = window.location.pathname;
            })
        }
    });
})

// $("#reg-btn").click(function (event){
//     var code = $("#code").val();    //获取用户输入的验证码
//     var url = "checkEmailCode?code=" + code;
//     $.get(url,function (result) {
//        console.log(result);
//        if (result == "校验失败") {
//            event.preventDefault();
//        }
//     });
// });