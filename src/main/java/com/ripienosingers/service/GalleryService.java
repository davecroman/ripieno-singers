package com.ripienosingers.service;

import com.ripienosingers.model.GalleryImage;
import com.ripienosingers.model.GalleryTab;
import retrofit.Call;
import retrofit.http.GET;
import retrofit.http.Path;
import retrofit.http.Query;

import java.util.List;

public interface GalleryService {

    @GET("gallery_tabs")
    Call<List<GalleryTab>> getTabs();

    @GET("gallery")
    Call<List<GalleryImage>> getImagesFrom(@Query("tab") String tabName);
}
