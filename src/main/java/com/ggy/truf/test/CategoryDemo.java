package com.ggy.truf.test;

import com.ggy.truf.dao.CategoryMapper;
import com.ggy.truf.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/21.
 */
public class CategoryDemo {

    @Autowired
    public CategoryMapper categoryMapper;

    public Map<Category, Object> map = new HashMap<>();

    //递归实现无限极分类查询 Object的数据类型存放Map集合
    public Map<Category, Object> selectAllCategory(){
        List<Category> categories = categoryMapper.selectByParentId(0);
        if (categories == null) {
            return null;
        }
        for (Category category : categories) {
            List<Category> categoriesLvNext = categoryMapper.selectByParentId(category.getId());
            if (categoriesLvNext == null) {
                continue;
            } else {
                // TODO
                return null;
            }
        }
        // TODO
        return null;
    }
}
