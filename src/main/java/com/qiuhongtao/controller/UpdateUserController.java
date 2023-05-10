package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.User;
import com.qiuhongtao.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes(value = "user")
public class UpdateUserController {
    @Resource
    UserService userService;

    @RequestMapping("/updateUser")
    public String updateUser() {
        return "updateUserView";
    }
    @RequestMapping("/toupdateUser")
    public ModelAndView toupdateUser(User user) {
        int i = userService.update(user);
        ModelAndView modelAndView = new ModelAndView();
        if (i > 0) {
            modelAndView.setViewName("accountDetails");
        }else {
            modelAndView.addObject("message","修改失败!!!");
            modelAndView.setViewName("updateUserView");
        }
        return modelAndView;
    }
}
