package com.qiuhongtao.service;

import com.qiuhongtao.dao.CategoryMapper;
import com.qiuhongtao.pojo.Category;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
    @Resource
    CategoryMapper categoryMapper;

    public CategoryServiceImpl() {
    }

    public CategoryMapper getCategoryMapper() {
        return categoryMapper;
    }

    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

    @Override
    public List<Category> findAllCategory() {
        return categoryMapper.findAllCategory();
    }

    @Override
    public Category findByCategoryId(int categoryId) {
        return categoryMapper.findByCategoryId(categoryId);
    }
}
