package com.hei.service;

public interface BlogUserService {

    boolean login(String username,String password);

    int selectIdByUsername(String username);

    void save(String username, String password);
}
