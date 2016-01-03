package com.ripienosingers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorPageController {

    @RequestMapping(value="/pagenotfound", method = RequestMethod.GET)
    public String goToPageNotFoundPage() {
        return "errors/404";
    }
}
