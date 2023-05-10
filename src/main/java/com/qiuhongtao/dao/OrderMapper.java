package com.qiuhongtao.dao;

import com.qiuhongtao.pojo.Item;
import com.qiuhongtao.pojo.Order;
import com.qiuhongtao.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    int addOrder(Order order);
    int search();
    int addOrderDetails(@Param("orderId") int orderId,
                        @Param("productId") int productId,
                        @Param("price") double price,
                        @Param("quantity") int quantity,
                        @Param("total") double total);
    List<Order> findByUserId(int id);
    List<Order> findAll();
    Item findByOrderIdandProductId(@Param("orderId") int orderId,
                                   @Param("productId") int productId);
}
