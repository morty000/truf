package com.ggy.truf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggy.truf.common.Const;
import com.ggy.truf.common.ResponseCode;
import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.pojo.User;
import com.ggy.truf.service.CategoryService;
import com.ggy.truf.service.UserService;

@Controller
@RequestMapping("/category/")
public class CategoryController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="add_category.do" , method=RequestMethod.POST)
	@ResponseBody
	public ServerResponse addCategory(HttpSession session,String categoryName,@RequestParam(value="parentId",defaultValue="0")int parentId){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录");
		}
		if(userService.checkAdminRole(user).isSuccess()){
			return categoryService.addCategory(categoryName, parentId);
		}else{
			return ServerResponse.createByErrorMessage("没有权限");
		}
		
	}
	@RequestMapping(value="set_category_name.do", method=RequestMethod.POST)
	@ResponseBody
	public ServerResponse setCategoryName(HttpSession session,String categoryName,Integer categoryId){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录");
		}
		if(userService.checkAdminRole(user).isSuccess()){
			return categoryService.updateCategoryName(categoryId, categoryName);
		}else{
			return ServerResponse.createByErrorMessage("没有权限");
		}
		
	}
	
	@RequestMapping(value="get_category.do", method=RequestMethod.POST)
	@ResponseBody
	public ServerResponse getChildrenParallelCategory(HttpSession session,@RequestParam(value="categoryId",defaultValue="0")Integer categoryId){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录");
		}
		if(userService.checkAdminRole(user).isSuccess()){
			return categoryService.getChildrenParallelCategory(categoryId);
		}else{
			return ServerResponse.createByErrorMessage("没有权限");
		}
	}
	
	
	@RequestMapping(value="get_deep_category.do", method=RequestMethod.POST)
	@ResponseBody
	public ServerResponse getCategoryAndChildrenCategory(HttpSession session,@RequestParam(value="categoryId",defaultValue="0")Integer categoryId){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录");
		}
		if(userService.checkAdminRole(user).isSuccess()){
			return categoryService.selectCategoryAndChildrenById(categoryId);
		}else{
			return ServerResponse.createByErrorMessage("没有权限");
		}
	}
}
