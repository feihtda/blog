package com.hei.service;

import com.hei.dao.BlogUserMapper;
import com.hei.pojo.BlogUser;
import com.hei.pojo.BlogUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogUserServiceImpl implements BlogUserService {
    @Autowired
    private BlogUserMapper blogUserMapper;

    @Override
    public boolean login(String username, String password) {
        //创建用户对象
        BlogUserExample example=new BlogUserExample();
        //注入账号密码
        example.createCriteria()
                .andUsernameEqualTo(username)
                .andPasswordEqualTo(password);
        //通过下一层查询
        List<BlogUser> blogUsers = blogUserMapper.selectByExample(example);

        if(blogUsers.size()>0){
            return true;
        }else{
        return false;
        }
    }

    @Override
    public int selectIdByUsername(String username) {
        BlogUserExample example=new BlogUserExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<BlogUser> blogUsers = blogUserMapper.selectByExample(example);
        return blogUsers.get(0).getId();
    }

    @Override
    public void save(String username, String password) {
        BlogUser blogUser = new BlogUser();
        blogUser.setUsername(username);
        blogUser.setPassword(password);
        blogUserMapper.insert(blogUser);
    }
}
