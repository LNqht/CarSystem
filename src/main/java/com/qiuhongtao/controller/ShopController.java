package com.qiuhongtao.controller;

import com.qiuhongtao.pojo.Category;
import com.qiuhongtao.pojo.Product;
import com.qiuhongtao.service.CategoryService;
import com.qiuhongtao.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
public class ShopController {
    @Resource
    private CategoryService categoryService;
    @Resource
    private ProductService productService;

    @RequestMapping("/shop")
    public ModelAndView shop(HttpServletRequest request) {
        List<Category> categoryList = categoryService.findAllCategory();
        request.setAttribute("categoryList", categoryList);
        ModelAndView modelAndView = new ModelAndView();
        if (request.getParameter("categoryId") == null) {
            List<Product> productList = productService.findAll();
            request.setAttribute("productList", productList);
            request.setAttribute("categoryService",categoryService);
        } else {
            int catId = Integer.parseInt(request.getParameter("categoryId"));
            List<Product> productList = productService.findByCategoryId(catId);
            request.setAttribute("productList", productList);
        }
        modelAndView.setViewName("shop");
        return modelAndView;
    }
    @RequestMapping("/getImg")
    public void getImg(int id, HttpServletResponse response) throws IOException {
        List<Product> productList = productService.getPicture(id);
        response.setContentType("image/jpeg/jpg/png/gif/bmp/tiff/svg");
        for (Product p : productList) {
            String img = URLDecoder.decode(p.getPicture(),"utf-8");
            File file = new File(img);
            FileInputStream in = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[1024];
            while(in.read(b)!= -1) {
                os.write(b);
            }
            in.close();
            os.flush();
            os.close();
        }
    }
}
