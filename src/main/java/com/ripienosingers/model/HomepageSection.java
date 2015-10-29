package com.ripienosingers.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class HomepageSection {

    @Id
    @GeneratedValue
    private Integer id;

    private String title;

    private String content;

    private int columnId;

    private int order;

    public Integer getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public int getColumnId() {
        return columnId;
    }
}
