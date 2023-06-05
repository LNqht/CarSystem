package com.qiuhongtao.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;



@Service("emailService")
public class EmailServiceImpl implements EmailService{

    @Autowired
    private JavaMailSender javaMailSender;


    @Override
    public boolean sendEmail(String toEmail, String text, String message) {

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //设置发件邮箱
        simpleMailMessage.setFrom("q1532283026@qq.com");
        //收件人邮箱
        simpleMailMessage.setTo(toEmail);
        //主题标题
        simpleMailMessage.setSubject(text);
        //信息内容
        simpleMailMessage.setText(message);
        //执行发送
        try {   //发送可能失败
            javaMailSender.send(simpleMailMessage);
            //没有异常返回true，表示发送成功
            return true;
        }catch (Exception e) {
            //发送失败，返回false
            e.printStackTrace();
            return false;
        }
    }
}
