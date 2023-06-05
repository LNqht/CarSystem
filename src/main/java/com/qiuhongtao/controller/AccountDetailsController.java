package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.Order;
import com.qiuhongtao.pojo.User;
import com.qiuhongtao.service.OrderService;
import com.qiuhongtao.service.PaymentService;
import com.qiuhongtao.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AccountDetailsController {
    @Resource
    private PaymentService paymentService;
    @Resource
    private OrderService orderService;

    @RequestMapping("/accountDetails")
    public ModelAndView accountDetails(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            System.out.println(u.getId());
            List<Order> orderList = orderService.findByUserId(u.getId());
            request.setAttribute("orderList",orderList);
            request.setAttribute("paymentService",paymentService);
            modelAndView.setViewName("accountDetails");
        }else {
            modelAndView.addObject("message","你还未登录!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
}
