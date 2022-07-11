package com.hei.pojo;

public class BlogArticleWithBLOBs extends BlogArticle {
    private String content;

    private String preface;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getPreface() {
        return preface;
    }

    public void setPreface(String preface) {
        this.preface = preface == null ? null : preface.trim();
    }
}