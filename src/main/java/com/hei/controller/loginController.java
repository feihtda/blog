package com.hei.controller;

import com.hei.service.BlogUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class loginController {
    //注入service服务
    @Autowired
    private BlogUserService blogUserService;

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username
                       , @RequestParam("password") String password
                       , HttpSession session, Model model){
        //通过下一层服务，把数据传给下一层
        boolean login = blogUserService.login(username, password);
        if(login){
            session.setAttribute("user",username);
            return "redirect:/index";
        }else{
            model.addAttribute("msg","账号或密码错误");
            return "login";
        }
    }


    @PostMapping("/register")
    public String register(@RequestParam("username") String username
            , @RequestParam("password") String password){
        blogUserService.save(username,password);
        return "login";
    }


    @GetMapping("/exitLogin")
    public String exitLogin(HttpServletRequest request){
        request.getSession().setAttribute("user",null);
        return "redirect:/index";

    }

}
