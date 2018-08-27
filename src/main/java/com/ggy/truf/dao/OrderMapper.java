package com.ggy.truf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ggy.truf.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> selectByStatus(Integer status);

	Order selectByUserAndOrderNo(@Param("userId")Integer userId, @Param("orderNo")Long orderNo);

	List<Order> selectByUserId(Integer userId);

	List<Order> selectAllOrder();

	Order selectByOrderNo(Long orderNo);
}