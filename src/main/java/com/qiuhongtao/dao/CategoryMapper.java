package com.qiuhongtao.dao;

import com.qiuhongtao.pojo.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> findAllCategory();
    Category findByCategoryId(int categoryId);
}
