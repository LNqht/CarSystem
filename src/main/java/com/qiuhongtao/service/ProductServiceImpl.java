package com.qiuhongtao.service;

import com.qiuhongtao.dao.ProductMapper;
import com.qiuhongtao.pojo.Item;
import com.qiuhongtao.pojo.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService{
    @Resource
    ProductMapper productMapper;

    public ProductServiceImpl() {
    }

    public ProductMapper getProductMapper() {
        return productMapper;
    }

    public void setProductMapper(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public int addProduct(Product product) {
        return productMapper.addProduct(product);
    }

    @Override
    public int delete(Integer productId) {
        return productMapper.delete(productId);
    }

    @Override
    public int update(Product product) {
        return productMapper.update(product);
    }

    @Override
    public int updateStockandSell(Product product) {
        return productMapper.updateStockandSell(product);
    }

    @Override
    public Product findById(Integer productId) {
        return productMapper.findById(productId);
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        return productMapper.findByCategoryId(categoryId);
    }

    @Override
    public List<Product> findAll() {
        return productMapper.findAll();
    }

    @Override
    public List<Product> findByProductName(String productName) {
        return productMapper.findByProductName(productName);
    }

    @Override
    public List<Product> getPicture(Integer productId) {
        return productMapper.getPicture(productId);
    }

    @Override
    public List<Product> findItemByOrderId(int orderId) {
        return productMapper.findItemByOrderId(orderId);
    }
}
