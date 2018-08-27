package com.ggy.truf.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggy.truf.common.Const;
import com.ggy.truf.common.ResponseCode;
import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.pojo.User;
import com.ggy.truf.service.OrderService;
import com.ggy.truf.service.UserService;
import com.ggy.truf.vo.OrderVo;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/order/")
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	@Autowired
	private OrderService orderSercivce;
	@Autowired
    private UserService UserService;
	
	@RequestMapping("create.do")
	@ResponseBody
	public ServerResponse create(HttpSession session, Integer addressId) {
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (user == null) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),
					ResponseCode.NEED_LOGIN.getDesc());
		}
		
		return orderSercivce.createOrder(user.getId(), addressId);
	}
	
	@RequestMapping("cancel.do")
	@ResponseBody
	public ServerResponse cancel(HttpSession session, Long orderNo) {
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (user == null) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),
					ResponseCode.NEED_LOGIN.getDesc());
		}

		return orderSercivce.cancel(user.getId(), orderNo);

	}
	

	@RequestMapping("get_order_cart_product.do")
	@ResponseBody
	public ServerResponse getOrderCartProduct(HttpSession session) {
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (user == null) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),
					ResponseCode.NEED_LOGIN.getDesc());
		}

		return orderSercivce.getOrderCartProduct(user.getId());

	}	
		
		
	@RequestMapping("detail.do")
	@ResponseBody
	public ServerResponse detail(HttpSession session,Long orderNo) {
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (user == null) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),
					ResponseCode.NEED_LOGIN.getDesc());
		}

		return orderSercivce.getOrderDetail(user.getId(),orderNo);

	}
	
	
	@RequestMapping("list.do")
	@ResponseBody
	public ServerResponse List(HttpSession session,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize) {
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (user == null) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),
					ResponseCode.NEED_LOGIN.getDesc());
		}

		return orderSercivce.getOrderList(user.getId(),pageNum,pageSize);

	}		
	
	//后台订单管理
	@RequestMapping("mlist.do")
	@ResponseBody
	public ServerResponse<PageInfo> orderList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null ){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
		}
		if(UserService.checkAdminRole(user).isSuccess()){
			return orderSercivce.manageList(pageNum, pageSize);
		}else{
			return ServerResponse.createByErrorMessage("无权限操作");
		}
	}
	
	@RequestMapping("mdetail.do")
	@ResponseBody
	public ServerResponse<OrderVo> orderDetail(HttpSession session,Long orderNo){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null ){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
		}
		if(UserService.checkAdminRole(user).isSuccess()){
			return orderSercivce.manageDetail(orderNo);
		}else{
			return ServerResponse.createByErrorMessage("无权限操作");
		}
	}
	
	@RequestMapping("msearch.do")
	@ResponseBody
	public ServerResponse<PageInfo> orderSearch(HttpSession session,Long orderNo,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                                                                @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null ){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
		}
		if(UserService.checkAdminRole(user).isSuccess()){
			return orderSercivce.manageSearch(orderNo,pageNum,pageSize);
		}else{
			return ServerResponse.createByErrorMessage("无权限操作");
		}
	}
	
	@RequestMapping("msend_goods.do")
	@ResponseBody
	public ServerResponse<String> orderSendGoods(HttpSession session,Long orderNo){
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if(user == null ){
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录,请登录管理员");
		}
		if(UserService.checkAdminRole(user).isSuccess()){
			return orderSercivce.manageSendGoods(orderNo);
		}else{
			return ServerResponse.createByErrorMessage("无权限操作");
		}
	}
	
}
