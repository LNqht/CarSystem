package com.qiuhongtao.pojo;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;

@Alias("product")
public class Product {
    private int productId;
    private String productName;
    private String productDescription;
    private String picture;
    private double price;
    private int categoryId;

    private int stock;

    private int sell;

    private MultipartFile file;

    public Product(){}

    public Product(int productId, String productName, String productDescription, String picture, double price, int categoryId, int stock, int sell) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.picture = picture;
        this.price = price;
        this.categoryId = categoryId;
        this.stock = stock;
        this.sell = sell;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getStock(){return stock;}

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getSell() {
        return sell;
    }

    public void setSell(int sell) {
        this.sell = sell;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", picture=" + picture +
                ", price=" + price +
                ", categoryId=" + categoryId +
                ", stock=" + stock +
                ", sell=" + sell +
                '}';
    }
}
