package com.ripienosingers.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class ComingSoonPageController {

    @RequestMapping(value="/comingsoon", method = RequestMethod.GET)
    public String goToComingSoonPage(Map<String, Object> map) {
        return "comingsoon";
    }
}
