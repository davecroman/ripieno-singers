package com.ripienosingers.service;

import com.google.gson.JsonObject;
import com.ripienosingers.model.Member;
import retrofit.Call;
import retrofit.http.*;

import java.util.List;

public interface MembersService {

    @GET("members")
    Call<List<Member>> getMembers();

    @GET("members?include=name,profilepic,title,order")
    Call<List<Member>> getMemberNamesAndPic();

    @POST("members")
    Call<Member> addMember(@Header("Authorization") String authorization, @Body JsonObject body);

    @DELETE("members/{id}")
    Call<Member> deleteMember(@Header("Authorization") String authorization, @Path("id") String id);

    @PATCH("members/{id}")
    Call<Member> updateMember(@Header("Authorization") String authorization, @Path("id") String id, @Body JsonObject body);
}
