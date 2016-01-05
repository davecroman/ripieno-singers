package com.ripienosingers.controller;

import com.google.gson.JsonObject;
import com.ripienosingers.model.BasicSection;
import com.ripienosingers.model.Headline;
import com.ripienosingers.model.NewsArticle;
import com.ripienosingers.service.HomepageService;
import com.ripienosingers.service.NewsService;
import com.ripienosingers.utils.SectionMapper;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import retrofit.Call;
import retrofit.Response;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class HomepageController {

    private static final int INTRO_SECTION = 1;
    private static final int SERVICES_SECTION = 2;

    @Autowired
    HomepageService homepageService;

    @Autowired
    NewsService newsService;

    @Autowired
    @Qualifier("authorizationKey")
    String basicAuth;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String goToHomePage(Map<String, Object> map) {
        List<String> notifications = new ArrayList<>();
        if (map.containsKey("notifications")) {
            List<String> carryOverNotifications = (List<String>) map.get("notifications");
            notifications.addAll(carryOverNotifications);
        }

        try {
            Response<List<BasicSection>> result = homepageService.getSections().execute();
            if (!result.isSuccess()) {
                throw new Exception(result.message());
            }
            Map<Integer, BasicSection> sections = SectionMapper.asMap(result.body());
            map.put("introSection", sections.get(INTRO_SECTION));
            map.put("servicesSection", sections.get(SERVICES_SECTION));

            Headline headline = homepageService.getHeadline().execute().body();
            NewsArticle headlineArticle = newsService.getArticle(headline.getArticleId()).execute().body();

            String articleText = Jsoup.parse(headlineArticle.getContent()).text();
            headlineArticle.setContent(articleText.substring(0, articleText.length() <= 200 ? articleText.length() : 200) + "...");
            map.put("headlineArticle", headlineArticle);
        } catch (Exception e) {
            notifications.add("Oops! A problem occurred while retrieving data for this page. The service may be down. Try again later.");
            e.printStackTrace();
        }

        map.put("notifications", notifications);

        return "homePage";
    }

    @RequestMapping(value = "/home/updateSection", method = RequestMethod.POST)
    public String updateSection(@RequestParam String sectionId, @RequestParam String sectionName,
                                @RequestParam String sectionContent,
                                RedirectAttributes redirAttr) {
        JsonObject body = new JsonObject();
        body.addProperty("sectionname", sectionName);
        body.addProperty("content", sectionContent);

        List<String> notifications = new ArrayList<>();

        try {
            Response<NewsArticle> result = homepageService.modifyArticle(basicAuth, sectionId, body).execute();
            if (!result.isSuccess()) {
                throw new Exception(result.message());
            }
            notifications.add("The \'" + sectionName + "\' section has been successfully updated.");
        } catch (Exception e) {
            notifications.add("Oops! A problem occurred while updating this section. The service may be down. Try again later.");
            e.printStackTrace();
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/home";
    }

    @RequestMapping(value = "/home/changeHeadline", method = RequestMethod.POST)
    public String changeHeadline(@RequestParam String articleId, RedirectAttributes redirAttr) {
        JsonObject body = new JsonObject();
        body.addProperty("articleid", articleId);

        List<String> notifications = new ArrayList<>();

        try {
            boolean articleExists = newsService.getArticle(articleId).execute().isSuccess();
            if (!articleExists) {
                throw new Exception("Article does not exist.");
            }
            Response<Headline> result = homepageService.changeHeadline(basicAuth, body).execute();
            if (!result.isSuccess()) {
                throw new Exception(result.message());
            }
            notifications.add("Headline successfully changed!");
        } catch (Exception e) {
            notifications.add("Oops! Something went wrong while changing the headline. " + e.getMessage());
            e.printStackTrace();
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/home";
    }
}
