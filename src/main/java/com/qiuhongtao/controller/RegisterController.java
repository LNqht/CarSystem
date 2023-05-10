package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.User;
import com.qiuhongtao.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class RegisterController {
    @Resource
    UserService userService;

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/toregister")
    public ModelAndView toregister(User user) {
        int i = userService.register(user);
        ModelAndView modelAndView = new ModelAndView();
        if (i > 0) {
            System.out.println("注册成功!!!即将转为登录页面!!!");
            modelAndView.setViewName("login");
        } else {
            System.out.println("注册失败!!!");
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }
}
