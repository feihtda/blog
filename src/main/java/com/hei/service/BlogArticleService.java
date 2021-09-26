package com.hei.service;

import com.hei.pojo.BlogArticle;
import com.hei.pojo.BlogArticleWithBLOBs;
import com.hei.pojo.PageBean;

import java.util.List;

public interface BlogArticleService {

    PageBean<BlogArticleWithBLOBs> findByPage(int currPage);

    int totalCountArticles();

    List<String> selectLabel();

    int insertArticle(BlogArticleWithBLOBs blogArticleWithBLOBs);

    BlogArticle selectAticleById(int id);

    void del(int id);
}
