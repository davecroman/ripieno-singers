package com.ripienosingers.controller;

import com.ripienosingers.model.BasicSection;
import com.ripienosingers.service.ContactsService;
import com.ripienosingers.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import retrofit.Call;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ContactUsController {

    @Autowired
    ContactsService contactsService;

    @Autowired
    @Qualifier("authorizationKey")
    String basicAuth;

    @RequestMapping(value="/contactUs", method = RequestMethod.GET)
    public String goToContactsPage(Map<String, Object> map) {

        Call<List<BasicSection>> listCall = contactsService.listSections();

        try {
            Map<String, BasicSection> sections = asMap(listCall.execute().body());
            map.put("phone", sections.get("phone"));
            map.put("email", sections.get("email"));
            map.put("connect", sections.get("connect"));
            map.put("visit", sections.get("visit"));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "contactUs";
    }

    private Map<String, BasicSection> asMap(List<BasicSection> sections) {
        Map<String, BasicSection> map = new HashMap<>();

        for( BasicSection section : sections ) {
            map.put(section.getSectionName().toLowerCase(), section);
        }

        return map;
    }
}
