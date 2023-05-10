package com.qiuhongtao.service;

import com.qiuhongtao.pojo.User;

import java.util.Date;
import java.util.List;

public interface UserService {
    //登录方法
    User login(String username, String password);
    int register(User user);
    int delete(int id);
    int update(User user);
    User findById(Integer id);
    public List<User> findByUsername(String username);
    public List<User> findByPassword(String password);
    public List<User> findByEmail(String email);
    public List<User> findByGender(String gender);
    public List<User> findByBirthdate(Date birthDate);
    public List<User> findAllUser();
}
