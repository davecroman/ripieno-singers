package com.ripienosingers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class AdminPageController {

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String goToAdminPage(Map<String, Object> map) {
        return "adminLoginPage";
    }

    @RequestMapping(value="/admin/homepage", method = RequestMethod.GET)
    public String goToHomepageAdminPage() {
        return "adminHomePage";
    }

    @RequestMapping(value="/unauthorized", method = RequestMethod.GET)
    public String goToUnauthorizedMessagePage() {
        return "adminUnauthorized";
    }
}
