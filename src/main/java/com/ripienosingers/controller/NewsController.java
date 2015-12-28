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
import retrofit.*;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class NewsController {

    @Autowired
    NewsService newsService;

    @Autowired
    @Qualifier("authorizationKey")
    String basicAuth;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String goToNewsPage(Map<String, Object> map) {
        List<NewsArticle> articles = getArticles();

        Collections.reverse(articles);
        map.put("articles", articles);

        return "news";
    }

    @RequestMapping(value = "/news/{articleId}", method = RequestMethod.GET)
    public String goToNewsArticle(@PathVariable String articleId, Map<String, Object> map) {

        NewsArticle newsArticle = getNewsArticle(articleId);

        map.put("article", newsArticle);
        map.put("type", "normal");

        return "newsArticle";
    }

    @RequestMapping(value = "/news/{articleId}/confirmDelete", method = RequestMethod.GET)
    public String confirmDeleteArticle(@PathVariable String articleId, Map<String, Object> map) {
        NewsArticle newsArticle = getNewsArticle(articleId);

        map.put("article", newsArticle);
        map.put("type", "confirmDeletion");

        return "newsArticle";
    }

    @RequestMapping(value = "/news/{articleId}/delete", method = RequestMethod.GET)
    public String deleteArticle(@PathVariable String articleId) {
        String basicAuth = "Basic " + Base64.encodeBase64String("key-3:RKXOb-Lt9AHHwg3bPrl0".getBytes());

        try {
            newsService.deleteArticle(basicAuth, articleId).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/news";
    }

    @RequestMapping(value = "/news/{articleId}/editor", method = RequestMethod.GET)
    public String articleEditor(@PathVariable String articleId, RedirectAttributes redirAttr) {
        NewsArticle newsArticle = getNewsArticle(articleId);

        redirAttr.addFlashAttribute("actionType", "modify");
        redirAttr.addFlashAttribute("articleId", articleId);
        redirAttr.addFlashAttribute("title", newsArticle.getTitle());
        redirAttr.addFlashAttribute("content", newsArticle.getContent());

        return "redirect:/news/editor";
    }

    @RequestMapping(value = "/news/{articleId}/modify", method = RequestMethod.POST)
    public String modifyArticle(@PathVariable String articleId, @RequestParam String title, @RequestParam String content) {
        JsonObject body = new JsonObject();
        body.addProperty("title", title);
        body.addProperty("content", content);

        try {
            newsService.modifyArticle(basicAuth, articleId, body).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/news/" + articleId;
    }

    @RequestMapping(value = "/news/editor", method = RequestMethod.GET)
    public String newsEditor(Map<String, Object> map) {

        if (!map.containsKey("actionType")) {
            map.put("actionType", "add");
        }

        map.put("date", NewsArticle.DATE_FORMAT.format(new Date()));
        return "newsAdd";
    }

    @RequestMapping(value = "/news/publish", method = RequestMethod.POST)
    public String publishArticle(@RequestParam String title, @RequestParam String content, Map<String, Object> map) {
        JsonObject body = new JsonObject();
        body.addProperty("title", title);
        body.addProperty("content", content);
        body.addProperty("datepublished", NewsArticle.DATE_FORMAT.format(new Date()));

        Call<NewsArticle> publishArticleCall = newsService.publishArticle(basicAuth, body);

        try {
            NewsArticle result = publishArticleCall.execute().body();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/news";
    }

    private NewsArticle getNewsArticle(String articleId) {
        Call<NewsArticle> articleCall = newsService.getArticle(articleId);

        NewsArticle newsArticle = null;

        try {
            newsArticle = articleCall.execute().body();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsArticle;
    }


    private List<NewsArticle> getArticles() {
        Call<List<NewsArticle>> listCall = newsService.listArticles();

        List<NewsArticle> articles = null;

        try {
            articles = listCall.execute().body();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return articles;
    }

}
