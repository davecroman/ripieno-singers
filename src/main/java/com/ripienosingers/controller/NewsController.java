package com.ripienosingers.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.ripienosingers.model.NewsArticle;
import com.ripienosingers.service.NewsService;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.logging.HttpLoggingInterceptor;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import retrofit.*;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class NewsController {

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String goToNewsPage(Map<String, Object> map) {
        List<NewsArticle> articles = getArticles();

        Collections.reverse(articles);
        map.put("articles", articles);

        return "news";
    }

    @RequestMapping(value = "/news/{articleId}", method = RequestMethod.GET)
    public String goToNewsArticle(@PathVariable String articleId, Map<String, Object> map) {

        NewsService newsService = createNewsService();
        Call<NewsArticle> articleCall = newsService.getArticle(articleId);

        NewsArticle newsArticle = null;

        try {
            newsArticle = articleCall.execute().body();
        } catch (IOException e) {
            e.printStackTrace();
        }

        map.put("article", newsArticle);
        map.put("type", "normal");

        return "newsArticle";
    }

    @RequestMapping(value = "/news/{articleId}/confirmDelete", method = RequestMethod.GET)
    public String confirmDeleteArticle(@PathVariable String articleId, Map<String, Object> map) {
        NewsService newsService = createNewsService();
        Call<NewsArticle> articleCall = newsService.getArticle(articleId);

        NewsArticle newsArticle = null;

        try {
            newsArticle = articleCall.execute().body();
        } catch (IOException e) {
            e.printStackTrace();
        }

        map.put("article", newsArticle);
        map.put("type", "confirmDeletion");

        return "newsArticle";
    }

    @RequestMapping(value = "/news/{articleId}/delete", method = RequestMethod.GET)
    public String deleteArticle(@PathVariable String articleId) {
        String basicAuth = "Basic " + Base64.encodeBase64String("key-3:RKXOb-Lt9AHHwg3bPrl0".getBytes());
        NewsService newsService = createNewsService();

        try {
            newsService.deleteArticle(basicAuth, articleId).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/news";
    }

    @RequestMapping(value = "/news/add", method = RequestMethod.GET)
    public String addNewArticle(Map<String, Object> map) {
        return "newsAdd";
    }

    @RequestMapping(value = "/news/publish", method = RequestMethod.POST)
    public String publishArticle(@RequestParam String title, @RequestParam String content, Map<String, Object> map) {

        String basicAuth = "Basic " + Base64.encodeBase64String("key-3:RKXOb-Lt9AHHwg3bPrl0".getBytes());
        NewsService newsService = createNewsService();

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


    private List<NewsArticle> getArticles() {
        NewsService newsService = createNewsService();
        Call<List<NewsArticle>> listCall = newsService.listArticles();

        List<NewsArticle> articles = null;

        try {
            articles = listCall.execute().body();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return articles;
    }

    private NewsService createNewsService() {
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-M-dd")
                .create();

        HttpLoggingInterceptor logging = new HttpLoggingInterceptor();
        logging.setLevel(HttpLoggingInterceptor.Level.BODY);
        OkHttpClient httpClient = new OkHttpClient();
        httpClient.interceptors().add(logging);

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://api.fieldbook.com/v1/567e1d9ef1a77803000e152d/")
                .addConverterFactory(GsonConverterFactory.create(gson))
                .client(httpClient)
                .build();

        return retrofit.create(NewsService.class);
    }


}
