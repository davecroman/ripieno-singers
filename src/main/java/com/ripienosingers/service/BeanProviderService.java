package com.ripienosingers.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.logging.HttpLoggingInterceptor;
import org.apache.commons.codec.binary.Base64;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import retrofit.GsonConverterFactory;
import retrofit.Retrofit;

@Configuration
public class BeanProviderService {

    @Bean
    public NewsService newsService(){
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-M-dd")
                .create();

        HttpLoggingInterceptor logging = new HttpLoggingInterceptor();
        logging.setLevel(HttpLoggingInterceptor.Level.BODY);
        OkHttpClient httpClient = new OkHttpClient();
        httpClient.interceptors().add(logging);

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://api.fieldbook.com/v1/567e1d9ef1a77803000e152d/")
                .addConverterFactory(GsonConverterFactory.create(gson))
                .client(httpClient)
                .build();

        return retrofit.create(NewsService.class);
    }

    @Bean(name = "authorizationKey")
    public String authorizationKey(){
        String basicAuth = "Basic " + Base64.encodeBase64String("key-3:RKXOb-Lt9AHHwg3bPrl0".getBytes());

        return basicAuth;
    }
}