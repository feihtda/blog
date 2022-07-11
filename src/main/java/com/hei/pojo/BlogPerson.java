package com.hei.pojo;

public class BlogPerson {
    private Integer id;

    private String introduct;

    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIntroduct() {
        return introduct;
    }

    public void setIntroduct(String introduct) {
        this.introduct = introduct == null ? null : introduct.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}