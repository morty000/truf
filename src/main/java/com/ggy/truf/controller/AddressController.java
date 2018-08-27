package com.ggy.truf.controller;

import javax.servlet.http.HttpSession;

import com.ggy.truf.pojo.Address;
import com.ggy.truf.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggy.truf.common.Const;
import com.ggy.truf.common.ResponseCode;
import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.service.AddressService;
import com.github.pagehelper.PageInfo;

/**
 * @author zhang wenxin
 * @createTime 2017年8月16日上午12:40:27
 * 
 */

@Controller
@RequestMapping("/address/")
public class AddressController {

	
	@Autowired
	private AddressService addressService;
	
	
	@RequestMapping("add.do")
	@ResponseBody
	public ServerResponse add(HttpSession session,Address address){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user==null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return addressService.add(user.getId(), address);
	}
	
	@RequestMapping("delete.do")
	@ResponseBody
	public ServerResponse delete(HttpSession session,Integer addressId){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user==null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return addressService.delete(user.getId(), addressId);
	}
	
	@RequestMapping("update.do")
	@ResponseBody
	public ServerResponse update(HttpSession session,Address address){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user==null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return addressService.update(user.getId(), address);
	}
	
	
	@RequestMapping("select.do")
	@ResponseBody
	public ServerResponse<Address> select(HttpSession session,Integer addressId){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user==null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return addressService.select(user.getId(), addressId);
	}
	
	
	@RequestMapping("list.do")
	@ResponseBody
	public ServerResponse<PageInfo> list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,
										 @RequestParam(value="pageSize",defaultValue="10")int pageSize,
										 HttpSession session){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user==null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return addressService.list(user.getId(), pageNum, pageSize);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
