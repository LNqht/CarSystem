package com.qiuhongtao.dao;

import com.qiuhongtao.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface UserMapper {
    int addUser(User user);
    int deleteById(Integer id);
    int updateUser(User user);
    User findById(Integer id);
    User findByUsernamePassword(@Param("username") String username,
                                @Param("password") String password);
    List<User> findByUsername(String username);
    List<User> findByPassword(String password);
    List<User> findByEmail(String email);
    List<User> findByGender(String gender);
    List<User> findByBirthdate(Date birthDate);
    List<User> findAllUser();
}
