package com.hei.dao;

import com.hei.pojo.BlogArticle;
import com.hei.pojo.BlogArticleExample;
import com.hei.pojo.BlogArticleWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BlogArticleMapper {
    long countByExample(BlogArticleExample example);

    int deleteByExample(BlogArticleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BlogArticleWithBLOBs record);

    int insertSelective(BlogArticleWithBLOBs record);

    List<BlogArticleWithBLOBs> selectByExampleWithBLOBs(BlogArticleExample example);

    List<BlogArticle> selectByExample(BlogArticleExample example);

    BlogArticleWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BlogArticleWithBLOBs record, @Param("example") BlogArticleExample example);

    int updateByExampleWithBLOBs(@Param("record") BlogArticleWithBLOBs record, @Param("example") BlogArticleExample example);

    int updateByExample(@Param("record") BlogArticle record, @Param("example") BlogArticleExample example);

    int updateByPrimaryKeySelective(BlogArticleWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BlogArticleWithBLOBs record);

    int updateByPrimaryKey(BlogArticle record);

    List<BlogArticleWithBLOBs> findByPage(Map<String,Object> map);

    int totalCountArticles();

    List<String> selectLabel();
}