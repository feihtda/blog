package com.hei.service;

import com.hei.dao.BlogArticleMapper;
import com.hei.pojo.BlogArticle;
import com.hei.pojo.BlogArticleWithBLOBs;
import com.hei.pojo.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class BlogArticleServiceImpl implements BlogArticleService {

    @Autowired
    private BlogArticleMapper blogArticleMapper;

    @Override
    public PageBean<BlogArticleWithBLOBs> findByPage(int currPage) {
        Map<String,Object> map=new HashMap<>();
        PageBean<BlogArticleWithBLOBs> pageBean=new PageBean();

        //查哪一页
        pageBean.setCurrPage(currPage);

        //一页多少个
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //查询一页多少文章
        int i=totalCountArticles();
        //设置总共多少篇文章
        pageBean.setTotalCount(i);
        //设置总共多少页
        pageBean.setTotalPage(i%pageSize==0?(i/pageSize):(i/pageSize+1));

        //map统一管理
        map.put("start",(currPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());

        List<BlogArticleWithBLOBs> articlebyPage = blogArticleMapper.findByPage(map);
        /**
         * 一共多少页
         * 一共多少篇
         * 当前页面的文章
         */
        pageBean.setLists(articlebyPage);
        return pageBean;
    }

    @Override
    public int totalCountArticles() {
        return blogArticleMapper.totalCountArticles();
    }

    @Override
    public List<String> selectLabel() {
        return blogArticleMapper.selectLabel();
    }

    @Override
    public int insertArticle(BlogArticleWithBLOBs blogArticleWithBLOBs) {
        return blogArticleMapper.insert(blogArticleWithBLOBs);
    }

    @Override
    public BlogArticle selectAticleById(int id) {
        return blogArticleMapper.selectByPrimaryKey(id);
    }

    @Override
    public void del(int id) {
        blogArticleMapper.deleteByPrimaryKey(id);
    }
}
