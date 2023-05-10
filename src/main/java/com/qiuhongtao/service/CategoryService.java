package com.qiuhongtao.service;

import com.qiuhongtao.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findAllCategory();
    Category findByCategoryId(int categoryId);
}
