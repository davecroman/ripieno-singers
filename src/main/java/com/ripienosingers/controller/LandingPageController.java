package com.ripienosingers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class LandingPageController {

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String goToLandingPage(Map<String, Object> map) {
        return "landingPage";
    }
}
