package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.*;
import com.qiuhongtao.service.OrderService;
import com.qiuhongtao.service.PaymentService;
import com.qiuhongtao.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class OrderController {
    @Resource
    private ProductService productService;
    @Resource
    private PaymentService paymentService;
    @Resource
    private OrderService orderService;

    @RequestMapping("/order")
    public ModelAndView order(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        List<Payment> paymentTypeList = paymentService.findAllPayment();
        request.setAttribute("paymentTypeList",paymentTypeList);
        modelAndView.setViewName("order");
        return modelAndView;
    }
    @RequestMapping("/toorder")
    public ModelAndView toorder(Order order, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        String message=null;
        if(order.getOrderId()==0||order.getPaymentId()==0||order.getName()==null||order.getName().trim().length()==0||order.getPhone()==null||
                order.getPhone().trim().length()==0||order.getAddress()==null||order.getAddress().trim().length()==0||
                order.getPostalCode()==null||order.getPostalCode().trim().length()==0){
            message="Error!, Enter Required(*) Info.";
            modelAndView.addObject("message",message);
            List<Payment> paymentTypeList = paymentService.findAllPayment();
            request.setAttribute("paymentTypeList",paymentTypeList);
            modelAndView.setViewName("order");
        }
        if (session.getAttribute("cart") != null) {
            ArrayList<Item> cartItems=(ArrayList<Item>) session.getAttribute("cart");
            order.setOrderDetails(new HashSet<Item>(cartItems));
        }
        int n = orderService.addOrder(order);
        int orderId = orderService.search();
        System.out.println(orderId);
        if (n > 0) {
            Set<Item> orderdetails = (HashSet<Item>) order.getOrderDetails();
            for (Item item : orderdetails) {
                Product product = productService.findById(item.getProduct().getProductId());
                int stock = product.getStock();
                int quantity = item.getQuantity();
                product.setStock(stock - quantity);
                product.setSell(quantity);
                productService.updateStockandSell(product);
                orderService.addOrderDetails(orderId,product.getProductId(),product.getPrice(),item.getQuantity(),product.getPrice()*item.getQuantity());
            }
            modelAndView.setViewName("orderSuccess");
        }
        return modelAndView;
    }
    @RequestMapping("/orderDetails")
    public ModelAndView orderDetails(int orderId, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> productList = productService.findItemByOrderId(orderId);
        List<Item> itemList = new ArrayList<>();
        for (Product p : productList) {
            Item item = new Item();
            Item items = orderService.findByOrderIdandProductId(orderId,p.getProductId());
            item.setProduct(p);
            item.setQuantity(items.getQuantity());
            itemList.add(item);
        }
        for (Item item1 : itemList) {
            System.out.println(item1);
        }
        request.setAttribute("itemList",itemList);
        modelAndView.setViewName("orderDetails");
        return modelAndView;
    }
}
