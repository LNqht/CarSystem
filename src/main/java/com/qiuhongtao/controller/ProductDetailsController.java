package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.Category;
import com.qiuhongtao.pojo.Product;
import com.qiuhongtao.service.CategoryService;
import com.qiuhongtao.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ProductDetailsController {
    @Resource
    private ProductService productService;
    @Resource
    private CategoryService categoryService;

    @RequestMapping("/productDetails")
    public ModelAndView productDetails(Integer id, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if (id != null) {
            List<Category> categoryList = categoryService.findAllCategory();
            Product product = productService.findById(id);
            request.setAttribute("categoryList",categoryList);
            request.setAttribute("p",product);
            modelAndView.setViewName("productDetails");
        }
        return modelAndView;
    }
}
