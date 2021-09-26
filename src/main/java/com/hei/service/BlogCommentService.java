package com.hei.service;

import com.hei.pojo.BlogComment;

import java.util.List;

public interface BlogCommentService {

    int addComment(BlogComment blogComment);

    List<BlogComment> selectAllCommentByDESC(int aid);


}
