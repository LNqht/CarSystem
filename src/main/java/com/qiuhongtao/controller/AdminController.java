package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.*;
import com.qiuhongtao.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {
    @Resource
    UserService userService;
    @Resource
    ProductService productService;
    @Resource
    CategoryService categoryService;
    @Resource
    PaymentService paymentService;
    @Resource
    OrderService orderService;

    @RequestMapping("/admin/home")
    public ModelAndView adminhome(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                modelAndView.setViewName("admin/index");
            } else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录admin账号!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }

    @RequestMapping("/admin/productList")
    public ModelAndView productList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                List<Product> productList = productService.findAll();
                request.setAttribute("productList",productList);
                request.setAttribute("categoryService",categoryService);
                modelAndView.setViewName("admin/productList");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录admin账号!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/addProduct")
    public ModelAndView addProduct(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                modelAndView.setViewName("admin/addProduct");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录admin账号!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/toaddProduct")
    public ModelAndView toaddProduct(Product product) {
        String filename = product.getFile().getOriginalFilename();
        String path = "C:\\Users\\涛\\Desktop\\system\\src\\main\\webapp\\WEB-INF\\images\\home\\"+filename;
        product.setPicture(path);
        int i = productService.addProduct(product);
        ModelAndView modelAndView = new ModelAndView();
        if (i > 0) {
            return new ModelAndView("redirect:/shop");
        }else {
            System.out.println("添加产品失败!!!");
            modelAndView.setViewName("admin/productList");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/productEdit")
    public ModelAndView productEdit(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                request.setAttribute("productService",productService);
                modelAndView.setViewName("admin/productEdit");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录admin账号!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/toproductEdit")
    public ModelAndView toproductEdit(Product product, HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                Product p = productService.findById(product.getProductId());
                p.setPrice(product.getPrice());
                p.setStock(product.getStock());
                p.setProductDescription(product.getProductDescription());
                productService.update(p);
                modelAndView.setViewName("redirect:/admin/productList");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/productDelete")
    public ModelAndView productDelete(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                request.setAttribute("productService",productService);
                modelAndView.setViewName("admin/productDelete");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/toproductDelete")
    public ModelAndView toproductDelete(int productId) {
        productService.delete(productId);
        return new ModelAndView("redirect:/admin/productList");
    }
    @RequestMapping("/admin/orderList")
    public ModelAndView orderList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                List<Payment> paymentTypeList = paymentService.findAllPayment();
                request.setAttribute("paymentTypeList",paymentTypeList);
                List<Order> orderList = orderService.findAll();
                request.setAttribute("orderList",orderList);
                request.setAttribute("userService",userService);
                request.setAttribute("paymentService",paymentService);
                modelAndView.setViewName("admin/orderList");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/userList")
    public ModelAndView userList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                modelAndView.setViewName("admin/userList");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    @RequestMapping("/admin/incomeList")
    public ModelAndView incomeList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView modelAndView = new ModelAndView();
        if (session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            if (u.getUsername().equals("admin")) {
                List<Product> productList = productService.findAll();
                request.setAttribute("productList",productList);
                request.setAttribute("categoryService",categoryService);
                modelAndView.setViewName("admin/incomeList");
            }else {
                modelAndView.addObject("message","非管理员操作!!!");
                modelAndView.setViewName("login");
            }
        }else {
            modelAndView.addObject("message","请先登录!!!");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
}
