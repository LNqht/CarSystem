package com.qiuhongtao.service;

import com.qiuhongtao.dao.OrderMapper;
import com.qiuhongtao.pojo.Item;
import com.qiuhongtao.pojo.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
    @Resource
    OrderMapper orderMapper;

    @Override
    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public int search() {
        return orderMapper.search();
    }

    @Override
    public int addOrderDetails(int orderId, int productId, double price, int quantity, double total) {
        return orderMapper.addOrderDetails(orderId,productId,price,quantity,total);
    }

    @Override
    public List<Order> findByUserId(int id) {
        return orderMapper.findByUserId(id);
    }

    @Override
    public List<Order> findAll() {
        return orderMapper.findAll();
    }

    @Override
    public Item findByOrderIdandProductId(int orderId, int productId) {
        return orderMapper.findByOrderIdandProductId(orderId,productId);
    }

}
