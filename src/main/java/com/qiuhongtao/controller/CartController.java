package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.Item;
import com.qiuhongtao.pojo.Product;
import com.qiuhongtao.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {
    @Resource
    private ProductService productService;

    private int isExisting(int id,List<Item> cart){
        for(int i=0;i<cart.size();i++){
            if(cart.get(i).getProduct().getProductId()==id){
                return i;
            }
        }
        return -1;
    }

    @RequestMapping("/cart")
    public String cart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            if (request.getParameter("action") == null) {
                return "cart";
            }else if (request.getParameter("action").equals("add")) {
                int id = request.getParameter("productId")!=null?Integer.parseInt(request.getParameter("productId")):1;
                int quantityParam=request.getParameter("quantity")!=null?Integer.parseInt(request.getParameter("quantity")):1;
                if(session.getAttribute("cart") == null) {
                    List<Item> cart = new ArrayList<Item>();
                    Product p = productService.findById(id);
                    cart.add(new Item(p,quantityParam));
                    session.setAttribute("cart",cart);
                }else {
                    List<Item> cart=(List<Item>) session.getAttribute("cart");
                    int index = isExisting(id,cart);
                    if(index == -1){
                        cart.add(new Item(productService.findById(id),1));
                    }else {
                        int quantity=cart.get(index).getQuantity()+1;
                        cart.get(index).setQuantity(quantity);
                    }
                    session.setAttribute("cart",cart);
                }
                return "cart";
            }else if (request.getParameter("action").equals("remove")) {
                List<Item> cart =(List<Item>) session.getAttribute("cart");
                int id=0;
                if(request.getParameter("productId")!=null){
                    id=Integer.parseInt(request.getParameter("productId"));
                }
                int index = isExisting(id,cart);
                cart.remove(index);
                session.setAttribute("cart",cart);
                return "cart";
            }
        }else {
            return "login";
        }
        return "cart";
    }
}
