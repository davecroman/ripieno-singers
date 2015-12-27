package com.ripienosingers.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ripienosingers.model.NewsArticle;
import com.ripienosingers.service.NewsService;
import org.springframework.stereotype.Controller;
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
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-M-dd")
                .create();

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://api.fieldbook.com/v1/567e1d9ef1a77803000e152d/")
                .addConverterFactory(GsonConverterFactory.create(gson))
                .build();

        List<NewsArticle> articles = getArticles(retrofit);
        map.put("articles", articles);

        return "news";
    }

    private List<NewsArticle> getArticles(Retrofit retrofit) {
        NewsService newsService = retrofit.create(NewsService.class);
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
