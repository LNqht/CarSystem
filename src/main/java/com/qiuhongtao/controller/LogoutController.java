package com.qiuhongtao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LogoutController {
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            session.invalidate();
            modelAndView.addObject("message","你已成功退出!!!");
            modelAndView.setViewName("login");
        }else {
            modelAndView.addObject("message","你还未登录!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
}
