package com.ripienosingers.controller;

import com.google.gson.JsonObject;
import com.ripienosingers.model.NewsArticle;
import com.ripienosingers.service.NewsService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import retrofit.Call;
import retrofit.Response;

import java.io.IOException;
import java.util.*;

@Controller
public class NewsController {

    @Autowired
    NewsService newsService;

    @Autowired
    @Qualifier("authorizationKey")
    String basicAuth;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String goToNewsPage(Map<String, Object> map) {

        List<String> notifications = new ArrayList<>();
        if (map.containsKey("notifications")) {
            List<String> carryOverNotifications = (List<String>) map.get("notifications");
            notifications.addAll(carryOverNotifications);
        }

        try {
            List<NewsArticle> articles = getArticles();
            Collections.reverse(articles);
            map.put("articles", articles);
        } catch (Exception ex) {
            notifications.add("Oops! We couldn't gather data from the news service. Please try again later");
            System.out.println(ex.getMessage());
        }

        map.put("notifications", notifications);

        return "news";
    }

    @RequestMapping(value = "/news/{articleId}", method = RequestMethod.GET)
    public String goToNewsArticle(@PathVariable String articleId, Map<String, Object> map) {

        NewsArticle newsArticle = null;
        List<String> notifications = new ArrayList<>();
        if (map.containsKey("notifications")) {
            List<String> carryOverNotifications = (List<String>) map.get("notifications");
            notifications.addAll(carryOverNotifications);
        }

        try {
            newsArticle = getNewsArticle(articleId);
        } catch (Exception e) {
            notifications.add("Oops! We couldn't retrieve data for this news article. Please try again later");
            System.err.println(e.getMessage());
        }

        map.put("article", newsArticle);
        map.put("type", "normal");
        map.put("notifications", notifications);

        return "newsArticle";
    }

    @RequestMapping(value = "/news/{articleId}/confirmDelete", method = RequestMethod.GET)
    public String confirmDeleteArticle(@PathVariable String articleId, Map<String, Object> map) {
        NewsArticle newsArticle = null;
        List<String> notifications = new ArrayList<>();

        try {
            newsArticle = getNewsArticle(articleId);
        } catch (Exception e) {
            notifications.add("Oops! We couldn't retrieve data for this news article. Please try again later");
            System.err.println(e.getMessage());
        }

        map.put("article", newsArticle);
        map.put("type", "confirmDeletion");
        map.put("notifications", notifications);

        return "newsArticle";
    }

    @RequestMapping(value = "/news/{articleId}/delete", method = RequestMethod.GET)
    public String deleteArticle(@PathVariable String articleId, RedirectAttributes redirAttr) {
        String basicAuth = "Basic " + Base64.encodeBase64String("key-3:RKXOb-Lt9AHHwg3bPrl0".getBytes());

        List<String> notifications = new ArrayList<>();

        try {
            newsService.deleteArticle(basicAuth, articleId).execute();

            notifications.add("Your article has been successfully deleted");
        } catch (Exception e) {
            notifications.add("Oops! A problem occurred while trying to delete this article. Try again later");
            System.err.println(e.getMessage());
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/news";
    }

    @RequestMapping(value = "/news/{articleId}/editor", method = RequestMethod.GET)
    public String articleEditor(@PathVariable String articleId, RedirectAttributes redirAttr) {
        NewsArticle newsArticle = null;
        List<String> notifications = new ArrayList<>();

        try {
            newsArticle = getNewsArticle(articleId);
            redirAttr.addFlashAttribute("title", newsArticle.getTitle());
            redirAttr.addFlashAttribute("content", newsArticle.getContent());
        } catch (Exception e) {
            notifications.add("Oops! We couldn't retrieve data for this news article. Please try again later");
            System.err.println(e.getMessage());
        }

        redirAttr.addFlashAttribute("actionType", "modify");
        redirAttr.addFlashAttribute("articleId", articleId);
        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/news/editor";
    }

    @RequestMapping(value = "/news/editor", method = RequestMethod.GET)
    public String newsEditor(Map<String, Object> map) {

        if (!map.containsKey("actionType")) {
            map.put("actionType", "add");
        }

        map.put("date", NewsArticle.DATE_FORMAT.format(new Date()));
        return "newsEditor";
    }

    @RequestMapping(value = "/news/{articleId}/modify", method = RequestMethod.POST)
    public String modifyArticle(@PathVariable String articleId, @RequestParam String title,
                                @RequestParam String content, RedirectAttributes redirAttr) {
        JsonObject body = new JsonObject();
        body.addProperty("title", title);
        body.addProperty("content", content);

        List<String> notifications = new ArrayList<>();

        try {
            newsService.modifyArticle(basicAuth, articleId, body).execute();
            notifications.add("Your article has been successfully updated");
        } catch (IOException e) {
            notifications.add("Oops! A problem occurred while updating the article. Try again later");
            redirAttr.addFlashAttribute("notifications", notifications);
            System.out.println(e.getMessage());
            return "redirect:/news/";
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/news/" + articleId;
    }

    @RequestMapping(value = "/news/publish", method = RequestMethod.POST)
    public String publishArticle(@RequestParam String title, @RequestParam String content,
                                 Map<String, Object> map, RedirectAttributes redirAttr) {
        JsonObject body = new JsonObject();
        body.addProperty("title", title);
        body.addProperty("content", content);
        body.addProperty("datepublished", NewsArticle.DATE_FORMAT.format(new Date()));

        Call<NewsArticle> publishArticleCall = newsService.publishArticle(basicAuth, body);
        List<String> notifications = new ArrayList<>();

        try {
            Response<NewsArticle> response = publishArticleCall.execute();
            boolean success = response.isSuccess();
            if (!success) {
                throw new Exception(response.message());
            }
            notifications.add("Your article has been successfully published!");
        } catch (Exception e) {
            System.err.println(e.getMessage());
            notifications.add("Oops! Sorry, a problem occured while publishing your article. Do you have a backup? Please try again.");
        }

        redirAttr.addFlashAttribute("notifications", notifications);
        return "redirect:/news";
    }

    private NewsArticle getNewsArticle(String articleId) throws IOException {
        Call<NewsArticle> articleCall = newsService.getArticle(articleId);
        return articleCall.execute().body();
    }


    private List<NewsArticle> getArticles() throws IOException {
        Call<List<NewsArticle>> listCall = newsService.listArticles();
        return listCall.execute().body();
    }

}
