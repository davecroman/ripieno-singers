package com.ripienosingers.service;

import com.ripienosingers.model.BasicSection;
import retrofit.Call;
import retrofit.http.GET;

import java.util.List;

public interface ContactsService {

    @GET("contacts")
    Call<List<BasicSection>> listSections();
}
