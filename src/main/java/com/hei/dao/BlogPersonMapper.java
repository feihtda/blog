package com.hei.dao;

import com.hei.pojo.BlogPerson;
import com.hei.pojo.BlogPersonExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogPersonMapper {
    long countByExample(BlogPersonExample example);

    int deleteByExample(BlogPersonExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BlogPerson record);

    int insertSelective(BlogPerson record);

    List<BlogPerson> selectByExample(BlogPersonExample example);

    BlogPerson selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BlogPerson record, @Param("example") BlogPersonExample example);

    int updateByExample(@Param("record") BlogPerson record, @Param("example") BlogPersonExample example);

    int updateByPrimaryKeySelective(BlogPerson record);

    int updateByPrimaryKey(BlogPerson record);
}