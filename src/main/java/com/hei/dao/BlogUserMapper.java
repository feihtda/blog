package com.hei.dao;

import com.hei.pojo.BlogUser;
import com.hei.pojo.BlogUserExample;
import com.hei.pojo.BlogUserKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogUserMapper {
    long countByExample(BlogUserExample example);

    int deleteByExample(BlogUserExample example);

    int deleteByPrimaryKey(BlogUserKey key);

    int insert(BlogUser record);

    int insertSelective(BlogUser record);

    List<BlogUser> selectByExample(BlogUserExample example);

    BlogUser selectByPrimaryKey(BlogUserKey key);

    int updateByExampleSelective(@Param("record") BlogUser record, @Param("example") BlogUserExample example);

    int updateByExample(@Param("record") BlogUser record, @Param("example") BlogUserExample example);

    int updateByPrimaryKeySelective(BlogUser record);

    int updateByPrimaryKey(BlogUser record);
}