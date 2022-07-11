package com.hei.controller;


import com.hei.pojo.BlogArticle;
import com.hei.pojo.BlogArticleWithBLOBs;
import com.hei.pojo.BlogComment;
import com.hei.service.BlogArticleService;
import com.hei.service.BlogCommentService;
import com.hei.service.BlogUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

@Controller
@RequestMapping("/article")
public class atricleContrloller {
    @Autowired
    private BlogUserService blogUserService;

    @Autowired
    private BlogArticleService blogArticleService;
    @Autowired
    private BlogCommentService blogCommentService;


    @PostMapping("/edit")
    public String edit(BlogArticleWithBLOBs blogArticleWithBLOBs, @RequestParam(value = "file") MultipartFile file, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        String content = request.getParameter("content-editormd-markdown-doc");
        blogArticleWithBLOBs.setContent(content);
        TimeZone time = TimeZone.getTimeZone("Asia/Shanghai");
        TimeZone.setDefault(time);
        blogArticleWithBLOBs.setCreateTime(new Date());
        blogArticleWithBLOBs.setUserId(blogUserService.selectIdByUsername((String) session.getAttribute("user")));
        //wenjian
        if (!file.isEmpty()) {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            String IMAGE_PATH = request.getSession().getServletContext().getRealPath("/") + "static/image/";

            File filePath = new File(IMAGE_PATH);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            File realFile = new File(IMAGE_PATH + File.separator + file.getOriginalFilename());
            if (!realFile.exists()) {
                file.transferTo(realFile);
            }
            //
            blogArticleWithBLOBs.setPicture(file.getOriginalFilename());
        } else {
            blogArticleWithBLOBs.setPicture("picture.jpg");
        }
        blogArticleService.insertArticle(blogArticleWithBLOBs);
        return "redirect:/index";
    }


    @GetMapping("/article/{id}")
    public String article(@PathVariable("id") int id, Model model) {
        //通过id查博客
        BlogArticle article = blogArticleService.selectAticleById(id);
        //通过id查评论
        List<BlogComment> blogComments = blogCommentService.selectAllCommentByDESC(id);
        model.addAttribute("articleid", article);
        model.addAttribute("comments", blogComments);

        return "article";
    }

    @GetMapping("/delArticle/{id}")
    public String delArticle(@PathVariable("id") int id) {
        blogArticleService.del(id);
        return "redirect:/index";
    }


    @PostMapping("comment/{uid}")
    public String addComment(@PathVariable("uid") int uid, BlogComment blogComment) {
        blogComment.setArticleId(uid);
        TimeZone time = TimeZone.getTimeZone("Asia/Shanghai");
        TimeZone.setDefault(time);
        blogComment.setComTime(new Date());
        blogCommentService.addComment(blogComment);
        return "redirect:/article/article/" + uid;
    }
}
