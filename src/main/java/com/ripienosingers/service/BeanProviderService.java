package com.ripienosingers.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ripienosingers.model.NotificationPool;
import com.ripienosingers.utils.RequestExecutor;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.logging.HttpLoggingInterceptor;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import retrofit.GsonConverterFactory;
import retrofit.Retrofit;

import java.util.concurrent.TimeUnit;

@Configuration
public class BeanProviderService {

    private static final String FIELDBOOK_API_AUTH_KEY = "FIELDBOOK_API_AUTH_KEY";

    @Bean
    public RequestExecutor requestExecutor() {
        return new RequestExecutor();
    }

    @Bean
    public Retrofit retrofit() {
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-M-dd")
                .create();

        HttpLoggingInterceptor logging = new HttpLoggingInterceptor();
        logging.setLevel(HttpLoggingInterceptor.Level.BODY);
        OkHttpClient httpClient = new OkHttpClient();
        httpClient.interceptors().add(logging);
        httpClient.setConnectTimeout(60, TimeUnit.SECONDS);

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://api.fieldbook.com/v1/567e1d9ef1a77803000e152d/")
                .addConverterFactory(GsonConverterFactory.create(gson))
                .client(httpClient)
                .build();

        return retrofit;
    }

    @Bean
    @Autowired
    public NewsService newsService(Retrofit retrofit) {
        return retrofit.create(NewsService.class);
    }

    @Bean
    @Autowired
    public ContactsService contactsService(Retrofit retrofit) {
        return retrofit.create(ContactsService.class);
    }

    @Bean
    @Autowired
    public HomepageService homepageService(Retrofit retrofit) {
        return retrofit.create(HomepageService.class);
    }

    @Bean
    @Autowired
    public MembersService membersService(Retrofit retrofit) {
        return retrofit.create(MembersService.class);
    }

    @Bean
    @Autowired
    public GalleryService galleryService(Retrofit retrofit) {
        return retrofit.create(GalleryService.class);
    }

    @Bean(name = "authorizationKey")
    public String authorizationKey() {
        String apiKey = System.getenv(FIELDBOOK_API_AUTH_KEY);

        String basicAuth = "Basic " + Base64.encodeBase64String(apiKey.getBytes());

        return basicAuth;
    }

    @Bean
    @Scope(value = "session")
    public NotificationPool notificationPool() {
        return new NotificationPool();
    }
}
