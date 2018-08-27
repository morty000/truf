package com.ggy.truf.dao;

import com.ggy.truf.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> selectByTimeOrKeywordsAndStatus(@Param("status") Integer status, @Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("keywords") String keywords);

    List<Product> selectByTimeOrKeywords(@Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("keywords") String keywords);

    List<Product> selectList();

    List<Product> selectByStock(Integer stock);

    List<Product> selectByStatus(Integer status);

    List<Product> selectByTimeOrKeywordsAndStock(@Param("stick") Integer stock, @Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("keywords") String keywords);

    List<Product> selectByCategory(Integer categoryId);

    List<Product> selectByKeywords(String keywords);
}