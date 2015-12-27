package com.ripienosingers.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsArticle {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MMMM d, Y");

    private String id;

    private String content;

    private String title;

    private Date datepublished;

    public String getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public String getTitle() {
        return title;
    }

    public Date getDatePublished() {
        return datepublished;
    }

    public String getFormattedDate() {
        return DATE_FORMAT.format(datepublished);
    }
}