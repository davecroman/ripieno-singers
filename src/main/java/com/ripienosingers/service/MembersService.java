package com.ripienosingers.service;

import com.ripienosingers.model.Member;
import retrofit.Call;
import retrofit.http.GET;

import java.util.List;

public interface MembersService {

    @GET("members")
    Call<List<Member>> getMembers();

}
