package com.ripienosingers.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ripienosingers.model.NewsArticle;
import com.ripienosingers.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import retrofit.Call;
import retrofit.GsonConverterFactory;
import retrofit.Retrofit;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class NewsController {

    @RequestMapping(value="/news", method = RequestMethod.GET)
    public String goToNewsPage(Map<String, Object> map) {
        List<NewsArticle> articles = getArticles();

        map.put("articles", articles);

        return "news";
    }

    @RequestMapping(value="/news/{articleId}", method = RequestMethod.GET)
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

        System.out.println(newsArticle.getId());
        System.out.println(newsArticle.getTitle());
        System.out.println(newsArticle.getContent());
        return "newsArticle";
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

        System.out.println(articles.size());
        return articles;
    }

    private NewsService createNewsService() {
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-M-dd")
                .create();

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://api.fieldbook.com/v1/567e1d9ef1a77803000e152d/")
                .addConverterFactory(GsonConverterFactory.create(gson))
                .build();

        return retrofit.create(NewsService.class);
    }


}
