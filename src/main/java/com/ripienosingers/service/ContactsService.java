package com.ripienosingers.service;

import com.google.gson.JsonObject;
import com.ripienosingers.model.BasicSection;
import retrofit.Call;
import retrofit.http.*;

import java.util.List;

public interface ContactsService {

    @GET("contacts")
    Call<List<BasicSection>> listSections();

    @PATCH("contacts/{sectionId}")
    Call<BasicSection> updateSection(@Header("Authorization") String authorization,
                                     @Path("sectionId") String id, @Body JsonObject body);
}
