package com.qiuhongtao.dao;

import com.qiuhongtao.pojo.Product;
import java.util.List;

public interface ProductMapper {
    int addProduct(Product product);
    int delete(Integer productId);
    int update(Product product);
    int updateStockandSell(Product product);
    Product findById(Integer productId);
    List<Product> findByCategoryId(int categoryId);
    List<Product> findAll();
    List<Product> findByProductName(String productName);
    List<Product> getPicture(Integer productId);
    List<Product> findItemByOrderId(int orderId);
}
