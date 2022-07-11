package com.hei.dao;

import com.hei.pojo.BlogComment;
import com.hei.pojo.BlogCommentExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogCommentMapper {
    long countByExample(BlogCommentExample example);

    int deleteByExample(BlogCommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BlogComment record);

    int insertSelective(BlogComment record);

    List<BlogComment> selectByExample(BlogCommentExample example);

    BlogComment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BlogComment record, @Param("example") BlogCommentExample example);

    int updateByExample(@Param("record") BlogComment record, @Param("example") BlogCommentExample example);

    int updateByPrimaryKeySelective(BlogComment record);

    int updateByPrimaryKey(BlogComment record);

    List<BlogComment> selectByAidDESC(int uid);
}