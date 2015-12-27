package com.ripienosingers.service;


import com.ripienosingers.model.NewsArticle;
import retrofit.Call;
import retrofit.http.GET;
import retrofit.http.Path;

import java.util.List;

public interface NewsService {

    @GET("news")
    Call<List<NewsArticle>> listArticles();

    @GET("news/{id}")
    Call<NewsArticle> getArticle(@Path("id") String id);
}
