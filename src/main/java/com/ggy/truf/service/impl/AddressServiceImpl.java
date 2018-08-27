package com.ggy.truf.service.impl;

import java.util.List;
import java.util.Map;

import com.ggy.truf.dao.AddressMapper;
import com.ggy.truf.pojo.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.service.AddressService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;

/**
 * @author zhang wenxin
 * @createTime 2017年8月16日上午12:43:17
 * 
 */

@Service("addressService")
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressMapper addressMapper;
	
	public ServerResponse add(Integer userId,Address address){
		address.setUserId(userId);
		int rowCount = addressMapper.insert(address);
		if(rowCount > 0){
			Map result = Maps.newHashMap();
			result.put("address", address.getId());
			return ServerResponse.createBySuccess("新建地址成功",result);
		}
		return ServerResponse.createByErrorMessage("新建地址失败");
	}
	
	public ServerResponse<String> delete(Integer userId,Integer addressId){
		int resultCount = addressMapper.deleteByAddressIdUserId(userId,addressId);
		if(resultCount > 0){
			return ServerResponse.createBySuccess("删除地址成功");
		}
		return ServerResponse.createByErrorMessage("删除地址失败");
	}
	
	public ServerResponse update(Integer userId,Address address){
		address.setUserId(userId);
		int rowCount = addressMapper.updateByAddress(address);
		if(rowCount > 0){
			return ServerResponse.createBySuccess("更新地址成功");
		}
		return ServerResponse.createByErrorMessage("更新地址失败");
	}
	
	public ServerResponse<Address> select(Integer userId,Integer addressId){
		Address address = addressMapper.selectByAddressIdUserId(userId, addressId);
		if(address == null){
			return ServerResponse.createByErrorMessage("无法查询到该地址");
		}
		return ServerResponse.createBySuccess("更新地址成功", address);
	}
	
	
	public ServerResponse<PageInfo> list(Integer userId,int pageNum,int pageSize){
		PageHelper.startPage(pageNum,pageSize);
		List<Address> addressList = addressMapper.selectByUserId(userId);
		PageInfo pageInfo = new PageInfo(addressList);
		return ServerResponse.createBySuccess(pageInfo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
