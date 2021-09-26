package com.hei.service;

import com.hei.dao.BlogCommentMapper;
import com.hei.pojo.BlogComment;
import com.hei.pojo.BlogCommentExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BlogCommentServiceImpl implements BlogCommentService {

    @Autowired
    private BlogCommentMapper blogCommentMapper;


    @Override
    public int addComment(BlogComment blogComment) {
        int insert = blogCommentMapper.insert(blogComment);
        return insert;
    }

    @Override
    public List<BlogComment> selectAllCommentByDESC(int aid) {
        return blogCommentMapper.selectByAidDESC(aid);
    }
}
