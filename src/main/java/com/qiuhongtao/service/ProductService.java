package com.qiuhongtao.service;

import com.qiuhongtao.pojo.Item;
import com.qiuhongtao.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {
    int addProduct(Product product);
    int delete(Integer productId);
    int update(Product product);
    int updateStockandSell(Product product);
    Product findById(Integer productId);
    List<Product> findByCategoryId(int categoryId);
    List<Product> findAll();
    List<Product> findByProductName(String productName);
    List<Product> getPicture(Integer productId);
    List<Product> findItemByOrderId(int id);
}
