package com.qiuhongtao.service;

import com.qiuhongtao.dao.PaymentMapper;
import com.qiuhongtao.pojo.Payment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{
    @Resource
    PaymentMapper paymentMapper;
    @Override
    public List<Payment> findAllPayment() {
        return paymentMapper.findAllPayment();
    }

    @Override
    public Payment findByPaymentId(int paymentId) {
        return paymentMapper.findByPaymentId(paymentId);
    }
}
