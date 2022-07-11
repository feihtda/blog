package com.hei.controller;

import com.alibaba.fastjson.JSONObject;
import com.hei.utils.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/file")
public class fileController {

    @ResponseBody
    @RequestMapping("/uploadImage")
    public String uploadImage(HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam(value = "editormd-image-file") MultipartFile file)  {
        JSONObject res = new JSONObject();
        String IMAGE_PATH=request.getSession().getServletContext().getRealPath("/")+"static/image/";
        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            File filePath = new File(IMAGE_PATH);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            File realFile = new File(IMAGE_PATH + File.separator + file.getOriginalFilename());
            if(!realFile.exists()){
            file.transferTo(realFile);
            }
            System.out.println("上传成功");
            System.out.println("=========================================================");
            res.put("success", 1);
            res.put("message", "上传成功");
            res.put("url",request.getContextPath()+"/static/image/"+file.getOriginalFilename());

        }catch (Exception e){
            System.out.println(e);
        }
        return res.toString();
    }
}

