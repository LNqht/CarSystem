package com.qiuhongtao.service;

import com.qiuhongtao.pojo.Payment;

import java.util.List;

public interface PaymentService {
    List<Payment> findAllPayment();
    Payment findByPaymentId(int paymentId);
}
