package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.User;
import com.qiuhongtao.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@SessionAttributes(value = "user")  //将model中的数据同步到session中
public class LoginController {
    @Resource
    UserService userService;

    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/tologin")
    public ModelAndView tologin(User user) {
        User u = userService.login(user.getUsername(),user.getPassword());
        ModelAndView modelAndView = new ModelAndView();
        if (u != null) {
            modelAndView.addObject("user",u);
            modelAndView.setViewName("redirect:/accountDetails");
        }else {
            modelAndView.addObject("message","用户名或密码错误!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
}

