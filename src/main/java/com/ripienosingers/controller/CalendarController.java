package com.ripienosingers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class CalendarController {

    @RequestMapping(value="/calendar", method = RequestMethod.GET)
    public String goToAdminPage(Map<String, Object> map) {
        return "calendar";
    }
}
