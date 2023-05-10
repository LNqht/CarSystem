package com.qiuhongtao.service;

import com.qiuhongtao.pojo.Item;
import com.qiuhongtao.pojo.Order;

import java.util.List;

public interface OrderService {
    int addOrder(Order order);
    int search();
    int addOrderDetails(int orderId, int productId, double price, int quantity, double total);
    List<Order> findByUserId(int id);
    List<Order> findAll();
    Item findByOrderIdandProductId(int orderId, int productId);
}
