//package com.qiuhongtao.util;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.io.support.PropertiesLoaderUtils;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//
//import java.io.IOException;
//import java.util.Properties;
//
//@Configuration
//public class MailUtil {
//    @Bean
//    public JavaMailSender javaMailSender() {
//        try {
//            Properties prop = PropertiesLoaderUtils.loadAllProperties("jdbc.properties");
//            JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//            mailSender.setHost(prop.getProperty("spring.mail.host"));
//            mailSender.setPort(465); // or the appropriate port
//            mailSender.setUsername(prop.getProperty("spring.mail.username"));
//            mailSender.setPassword(prop.getProperty("spring.mail.password"));
//            return mailSender;
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//    }
//}
