package com.ripienosingers.controller;

import com.google.gson.JsonObject;
import com.ripienosingers.model.BasicSection;
import com.ripienosingers.service.ContactsService;
import com.ripienosingers.utils.SectionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

    private static int PHONE_ID = 1;
    private static int EMAIL_ID = 2;
    private static int CONNECT_ID = 3;
    private static int VISIT_ID = 30;

    @RequestMapping(value = "/contactUs", method = RequestMethod.GET)
    public String goToContactsPage(Map<String, Object> map) {
        List<String> notifications = new ArrayList<>();
        if (map.containsKey("notifications")) {
            List<String> carryOverNotifications = (List<String>) map.get("notifications");
            notifications.addAll(carryOverNotifications);
        }

        try {
            Call<List<BasicSection>> listCall = contactsService.listSections();
            Map<Integer, BasicSection> sections = SectionMapper.asMap(listCall.execute().body());
            map.put("phone", sections.get(PHONE_ID));
            map.put("email", sections.get(EMAIL_ID));
            map.put("connect", sections.get(CONNECT_ID));
            map.put("visit", sections.get(VISIT_ID));
        } catch (IOException e) {
            e.printStackTrace();
            notifications.add("Oops! There was a problem retrieving the data for this page. Try again later");
        }

        map.put("notifications", notifications);

        return "contactUs";
    }

    @RequestMapping(value = "/contactUs/updateSection", method = RequestMethod.POST)
    public String updateContactSection(@RequestParam String sectionId, @RequestParam String sectionName,
                                       @RequestParam String sectionContent,
                                       RedirectAttributes redirAttr) {

        JsonObject body = new JsonObject();
        body.addProperty("sectionname", sectionName);
        body.addProperty("content", sectionContent);

        List<String> notifications = new ArrayList<>();

        try {
            contactsService.updateSection(basicAuth, sectionId, body).execute();
            notifications.add("\'" + sectionName + "\' section has been successfully updated.");
        } catch (IOException e) {
            e.printStackTrace();
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/contactUs/";
    }
}
