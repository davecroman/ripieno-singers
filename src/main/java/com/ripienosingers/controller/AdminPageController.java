package com.ripienosingers.controller;

import com.ripienosingers.service.HomepageContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class AdminPageController {

    @Autowired
    private HomepageContentService homepageContentService;

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String goToAdminPage(Map<String, Object> map) {
        return "adminLoginPage";
    }

    @RequestMapping(value="/admin/homepage", method = RequestMethod.GET)
    public String goToHomepageAdminPage(Map<String, Object> map) {
//        map.put("sections", homepageContentService.listSections());
//        homepageContentService.listSections();
        return "adminHomePage";
    }

    @RequestMapping(value="/unauthorized", method = RequestMethod.GET)
    public String goToUnauthorizedMessagePage() {
        return "adminUnauthorized";
    }
}
