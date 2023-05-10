package com.qiuhongtao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactUSController {
    @RequestMapping("/contactUS")
    public String contactUS() {
        return "contactUS";
    }
}
