package com.ggy.truf.service;

import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.pojo.Address;
import com.github.pagehelper.PageInfo;

/**
 * @author zhang wenxin
 * @createTime 2017年8月16日上午12:42:36
 * 
 */
public interface AddressService {
	
	ServerResponse add(Integer userId,Address address);
	
	ServerResponse<String> delete(Integer userId,Integer addressId);
	
	ServerResponse update(Integer userId,Address address);
	
	ServerResponse<Address> select(Integer userId,Integer addressId);
	
	ServerResponse<PageInfo> list(Integer userId,int pageNum,int pageSize);
}
