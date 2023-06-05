package com.qiuhongtao.controller;

import com.qiuhongtao.service.EmailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Random;

@Controller
public class EmailController {

    @Resource
    private EmailService emailService;

    @ResponseBody
    @RequestMapping(value = "/getEmailCode", method = RequestMethod.GET)
    //通过httpsession来存入验证码值
    public String getEmail(@RequestParam("toEmail") String toEmail, HttpSession httpSession){
        Random random = new Random();
        //生成随机验证码
        int code=1000+random.nextInt(8999);
        //把验证码存储到session中
        httpSession.setAttribute("code", code);
        //执行发送验证码
        if(emailService.sendEmail(toEmail, "用户注册验证码","欢迎注册,您的验证码为:"+code)) {
            return "获取成功";
        }
        return "获取失败";
    }

    @RequestMapping(value = "/checkEmailCode", method = RequestMethod.GET)
    @ResponseBody
    public String checkEmailCode(@RequestParam("code") String code,HttpSession httpSession) {
        String emailCode = httpSession.getAttribute("code").toString();
        if(emailCode!=null) {
            if(emailCode.equals(code)) {
                return "校验成功";
            }
        }
        return "校验失败";
    }
}
