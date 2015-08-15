package com.ripienosingers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class HomepageController {

    @RequestMapping(value="/home", method = RequestMethod.GET)
    public String goToHomePage(Map<String, Object> map) {
        return "homePage";
    }
}
