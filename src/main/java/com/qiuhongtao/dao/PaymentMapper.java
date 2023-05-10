package com.qiuhongtao.dao;

import com.qiuhongtao.pojo.Payment;

import java.util.List;

public interface PaymentMapper {
    List<Payment> findAllPayment();
    Payment findByPaymentId(int paymentId);
}
