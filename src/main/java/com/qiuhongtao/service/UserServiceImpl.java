package com.qiuhongtao.service;

import com.qiuhongtao.dao.UserMapper;
import com.qiuhongtao.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService{
    @Resource
    UserMapper userMapper;

    public UserServiceImpl() {
    }

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User login(String username, String password) {
        return userMapper.findByUsernamePassword(username,password);
    }

    @Override
    public int register(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int delete(int id) {
        return userMapper.deleteById(id);
    }

    @Override
    public int update(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User findById(Integer id) {
        return userMapper.findById(id);
    }

    @Override
    public List<User> findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public List<User> findByPassword(String password) {
        return userMapper.findByPassword(password);
    }

    @Override
    public List<User> findByEmail(String email) {
        return userMapper.findByEmail(email);
    }

    @Override
    public List<User> findByGender(String gender) {
        return userMapper.findByGender(gender);
    }

    @Override
    public List<User> findByBirthdate(Date birthDate) {
        return userMapper.findByBirthdate(birthDate);
    }

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }
}
