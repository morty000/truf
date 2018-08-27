package com.ggy.truf.dao;

import com.ggy.truf.pojo.Active;
import com.ggy.truf.pojo.Product;

import java.util.List;

/**
 * Created by Administrator on 2017/8/20.
 */
public interface ActiveMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Active record);

    int insertSelective(Active record);

    Active selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Active record);

    int updateByPrimaryKey(Active record);

    List<Active> selectByStatus(int recommend);
}
