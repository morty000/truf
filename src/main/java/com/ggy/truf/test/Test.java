package com.ggy.truf.test;

import com.ggy.truf.dao.UserMapper;
import com.ggy.truf.pojo.Category;
import com.ggy.truf.pojo.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator on 2017/8/9.
 */
public class Test {

    @org.junit.Test
    public void test1() {
        ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserMapper userMapper = cxt.getBean(UserMapper.class);
        User user = userMapper.selectByPrimaryKey(1);
        System.out.println(user.getName());
    }

    CategoryDaoImpl categoryDao;

    @org.junit.Test
    public void test2() {
        Category category = new Category();
        category.setName("平底");
        category.setParentId(2);
        categoryDao.insert(category);
    }
}
