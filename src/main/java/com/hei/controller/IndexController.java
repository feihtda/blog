package com.hei.controller;

import com.hei.pojo.BlogArticleWithBLOBs;
import com.hei.pojo.PageBean;
import com.hei.service.BlogArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private BlogArticleService blogArticleService;

    @RequestMapping({"/","/index"})
    public String toIndex(@RequestParam(value = "currPage",defaultValue = "1",required = false)int currPage, Model model, HttpSession session){
        //查标签
        List<String> labels = blogArticleService.selectLabel();
        //存标签
        session.setAttribute("labels",labels);
        //打印日志
        System.out.println(blogArticleService);
        PageBean<BlogArticleWithBLOBs> pagemsg = blogArticleService.findByPage(currPage);
        model.addAttribute("pagemsg",pagemsg);
        return "index";
    }

    @RequestMapping("/edit")
    public String toEdit(Model model){
        return "edit";
    }

    @RequestMapping("/login")
    public String tologin(){
        return "login";
    }

}

