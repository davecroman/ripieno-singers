package com.ripienosingers.service;


import com.google.gson.JsonObject;
import com.ripienosingers.model.NewsArticle;
import retrofit.Call;
import retrofit.http.*;

import java.util.List;

public interface NewsService {

    @GET("news")
    Call<List<NewsArticle>> listArticles();

    @GET("news/{id}")
    Call<NewsArticle> getArticle(@Path("id") String id);

    @POST("news")
    Call<NewsArticle> publishArticle(@Header("Authorization") String authorization, @Body JsonObject body);

    @DELETE("news/{id}")
    Call<String> deleteArticle(@Header("Authorization") String authorization, @Path("id") String id);

    @PATCH("news/{id}")
    Call<NewsArticle> modifyArticle(@Header("Authorization") String authorization, @Path("id") String id, @Body JsonObject body);
}
