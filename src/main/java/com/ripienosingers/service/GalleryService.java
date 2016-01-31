package com.ripienosingers.service;

import com.google.gson.JsonObject;
import com.ripienosingers.model.GalleryImage;
import com.ripienosingers.model.GalleryTab;
import retrofit.Call;
import retrofit.http.*;

import java.util.List;

public interface GalleryService {

    @GET("gallery_tabs")
    Call<List<GalleryTab>> getTabs();

    @GET("gallery")
    Call<List<GalleryImage>> getImagesFrom(@Query("tab") String tabName);

    @POST("gallery")
    Call<GalleryImage> addImage(@Header("Authorization") String authorization, @Body JsonObject body);

    @DELETE("gallery/{id}")
    Call<GalleryImage> removeImage(@Header("Authorization") String authorization, @Path("id") String id);
}
