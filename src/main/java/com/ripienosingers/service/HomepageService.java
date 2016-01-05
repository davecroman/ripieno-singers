package com.ripienosingers.service;

import com.google.gson.JsonObject;
import com.ripienosingers.model.BasicSection;
import com.ripienosingers.model.Headline;
import com.ripienosingers.model.NewsArticle;
import retrofit.Call;
import retrofit.http.*;

import java.util.List;

public interface HomepageService {


    @GET("home")
    Call<List<BasicSection>> getSections();

    @PATCH("home/{id}")
    Call<NewsArticle> modifyArticle(@Header("Authorization") String authorization, @Path("id") String id, @Body JsonObject body);

    @GET("headline/1")
    Call<Headline> getHeadline();

    @PATCH("headline/1")
    Call<Headline> changeHeadline(@Header("Authorization") String authorization, @Body JsonObject body);
}
