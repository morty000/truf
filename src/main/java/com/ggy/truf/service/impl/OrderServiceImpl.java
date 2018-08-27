package com.ggy.truf.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.ggy.truf.common.Const;
import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.dao.AddressMapper;
import com.ggy.truf.dao.CartMapper;
import com.ggy.truf.dao.OrderItemMapper;
import com.ggy.truf.dao.OrderMapper;
import com.ggy.truf.dao.PayInfoMapper;
import com.ggy.truf.dao.ProductMapper;
import com.ggy.truf.pojo.Address;
import com.ggy.truf.pojo.Cart;
import com.ggy.truf.pojo.Order;
import com.ggy.truf.pojo.OrderItem;
import com.ggy.truf.pojo.Product;
import com.ggy.truf.service.OrderService;
import com.ggy.truf.util.DateTimeUtil;
import com.ggy.truf.util.DoubleUtil;
import com.ggy.truf.util.PropertiesUtil;
import com.ggy.truf.vo.AddressVo;
import com.ggy.truf.vo.OrderItemVo;
import com.ggy.truf.vo.OrderProductVo;
import com.ggy.truf.vo.OrderVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	@Autowired
	private PayInfoMapper payInfoMapper;
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public ServerResponse pay(Long orderNo, Integer userId, String path) {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public ServerResponse aliCallback(Map<String, String> params) {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public ServerResponse queryOrderPayStatus(Integer userId, Long orderNo) {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public ServerResponse createOrder(Integer userId, Integer addressId) {

		List<Cart> cartList =cartMapper.selectCheckedCartByUserId(userId);
		ServerResponse serverResponse = this.getCartOrderItem(userId,cartList);
		if(!serverResponse.isSuccess()){
			return serverResponse;
		}
		List<OrderItem> orderItemList = (List<OrderItem>) serverResponse.getData();
		Double payment = this.getOrderTotalprice(orderItemList);
		
		//生成订单
			Order order = this.assembleOrder(userId, addressId, payment);
		if(order == null){
			return serverResponse.createByErrorMessage("生成订单错误");
		}
		if(CollectionUtils.isEmpty(orderItemList)){
			return serverResponse.createByErrorMessage("购物车为空");
		}
		
		for (OrderItem orderItem : orderItemList) {
			orderItem.setOrderNo(order.getOrderNo());
		}
		
		//mybatis批量插入
		orderItemMapper.batchInsert(orderItemList);
		//生成成功，减少库存
		this.reduceproductstock(orderItemList);
		//清空购物车
		this.cleanCart(cartList);
		//返回数据给前端
		OrderVo orderVo = assembleOrderVo(order,orderItemList);
		return ServerResponse.createBySuccess(orderVo);
	}
	
	
	private OrderVo assembleOrderVo(Order order, List<OrderItem> orderItemList) {
		OrderVo orderVo = new OrderVo();
		orderVo.setOrderNo(order.getOrderNo());
		orderVo.setPayment(order.getPayment());
		orderVo.setPaymenttype(order.getPaymentType());
		orderVo.setPaymentTypeDesc(Const.PaymentTypeEnum.codeOf(order.getPaymentType()).getValue());
		orderVo.setPostage(order.getPostage());
		orderVo.setStatus(order.getStatus());
		orderVo.setStatusDesc(Const.OrderStatusEnum.codeOf(order.getStatus()).getValue());
		orderVo.setAddressId(order.getAddressId());
		Address address = addressMapper.selectByPrimaryKey(order.getAddressId());
		if(address != null){
			orderVo.setReceiverName(address.getReceiverName());
			orderVo.setAddressVo(assembleAddressVo(address));
		}
		orderVo.setPaymentTime(DateTimeUtil.dateToStr(order.getPaymentTime()));
		orderVo.setSendTime(DateTimeUtil.dateToStr(order.getSendTime()));
		orderVo.setEndTime(DateTimeUtil.dateToStr(order.getEndTime()));
		orderVo.setCreateTime(DateTimeUtil.dateToStr(order.getCreateTime()));
		orderVo.setCloseTime(DateTimeUtil.dateToStr(order.getCloseTime()));
		orderVo.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));
		
		List<OrderItemVo> orderItemVoList = Lists.newArrayList();
		
		for (OrderItem orderItem : orderItemList) {
			OrderItemVo orderItemVo = assembleOrderItemVo(orderItem);
			orderItemVoList.add(orderItemVo);
		}
		orderVo.setOrderItemVolist(orderItemVoList);
		return orderVo;
	}

	private OrderItemVo assembleOrderItemVo(OrderItem orderItem) {
		OrderItemVo orderItemVo = new OrderItemVo();
		orderItemVo.setOrderNo(orderItem.getOrderNo());
		orderItemVo.setProductId(orderItem.getProductId());
		orderItemVo.setProductName(orderItem.getProductName());
		orderItemVo.setProductImage(orderItem.getProductImage());
		orderItemVo.setCurrentUnitPrice(orderItem.getCurrentUnitPrice());
		orderItemVo.setQuantity(orderItem.getQuantity());
		orderItemVo.setTotalPrice(orderItem.getTotalPrice());
		
		orderItemVo.setCreateTime(DateTimeUtil.dateToStr(orderItem.getCreateTime()));
		return orderItemVo;
	}

	private AddressVo assembleAddressVo(Address address){
		AddressVo addressVo = new AddressVo();
		addressVo.setReceiverName(address.getReceiverName());
		addressVo.setReceiverAddress(address.getReceiverAddress());
		addressVo.setReceiverProvince(address.getReceiverProvince());
		addressVo.setReceiverCity(address.getReceiverCity());
		addressVo.setReceiverDistrict(address.getReceiverDistrict());
		addressVo.setReceiverMobile(address.getReceiverMobile());
		addressVo.setReceiverZip(address.getReceiverZip());
		addressVo.setReceiverPhone(address.getReceiverPhone());
		return addressVo;
	}
	
	private void cleanCart(List<Cart> cartList) {
		for (Cart cart : cartList) {
			cartMapper.deleteByPrimaryKey(cart.getId());
		}
		
	}

	private void reduceproductstock(List<OrderItem> orderItemList){
		for (OrderItem orderItem : orderItemList) {
			Product product = productMapper.selectByPrimaryKey(orderItem.getProductId());
			product.setStock(product.getStock()-orderItem.getQuantity());
			productMapper.updateByPrimaryKeySelective(product);
			
			
		}
		
		
	}
	
	public Order assembleOrder(Integer userId,Integer addressId,Double payment){
		Order order = new Order();
		long orderNo = this.generateOrderNo();
		order.setOrderNo(orderNo);
		order.setStatus(Const.OrderStatusEnum.NO_PAY.getCode());
		order.setPostage(0);
		order.setPaymentType(Const.PaymentTypeEnum.ONLINE_PAY.getCode());
		order.setPayment(payment);
		
		order.setUserId(userId);
		order.setAddressId(addressId);
		
		int rowCount = orderMapper.insert(order);
		if(rowCount > 0){
			return order;
			
		}
		return null;
	}
	
	public long generateOrderNo(){
		long currentTime = System.currentTimeMillis();
		return currentTime+new Random().nextInt(100);
	}

	private Double getOrderTotalprice(List<OrderItem> orderItemList) {
		Double payment = new Double("0");
		for (OrderItem orderItem : orderItemList) {
			DoubleUtil.add(payment.doubleValue(),orderItem.getTotalPrice().doubleValue());
		}
		return payment;
	}

	private ServerResponse getCartOrderItem(Integer userId, List<Cart> cartList) {
		List<OrderItem> orderItemList = Lists.newArrayList();
		if(CollectionUtils.isEmpty(cartList)){
			return ServerResponse.createByErrorMessage("购物车为空");
		}
		
		for (Cart cartItem : cartList) {
			OrderItem orderItem = new OrderItem();
			Product product = productMapper.selectByPrimaryKey(cartItem.getProductId());
			if(Const.ProductStatusEnum.ON_SALE.getCode() != product.getStatus()){
				return ServerResponse.createByErrorMessage("产品"+product.getName()+"不是在线售卖状态！");
			}
			
			if(cartItem.getQuantity() > product.getStock()){
				return ServerResponse.createByErrorMessage("产品"+product.getName()+"库存不足");
			}
			orderItem.setUserId(userId);
			orderItem.setProductId(product.getId());
			orderItem.setProductName(product.getName());
			orderItem.setProductImage(product.getMainImage());
			orderItem.setCurrentUnitPrice(product.getPrice());
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setTotalPrice(DoubleUtil.mul(product.getPrice().doubleValue(),cartItem.getQuantity()));
			orderItemList.add(orderItem);
		}
		
		return ServerResponse.createBySuccess(orderItemList);
	}

	@Override
	public ServerResponse<String> cancel(Integer userId, Long orderNo) {
		Order order = orderMapper.selectByUserAndOrderNo(userId, orderNo);
		if(order == null){
			return ServerResponse.createByErrorMessage("该用户此订单不存在");
		}
		if(order.getStatus() != Const.OrderStatusEnum.NO_PAY.getCode()){
			return ServerResponse.createByErrorMessage("已付款，无法取消订单");
		}
		Order updateOrder = new Order();
		updateOrder.setId(order.getId());
		updateOrder.setStatus(Const.OrderStatusEnum.CANCELED.getCode());
		
		int row = orderMapper .updateByPrimaryKeySelective(updateOrder);
		if(row > 0){
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}

	@Override
	public ServerResponse getOrderCartProduct(Integer userId) {
		OrderProductVo orderProductVo = new OrderProductVo();
		
		//从购物车中获取数据
		List<Cart> cartList = cartMapper.selectCheckedCartByUserId(userId);
		ServerResponse serverResponse = this.getCartOrderItem(userId, cartList);
		if(!serverResponse.isSuccess()){
			return serverResponse;
		}
		List<OrderItem> orderItemList = (List<OrderItem>) serverResponse.getData();
		
		List<OrderItemVo> orderItemVoList = Lists.newArrayList();
		Double payment = new Double("0");
		for (OrderItem orderItem : orderItemList) {
			payment = DoubleUtil.add(payment.doubleValue(),orderItem.getTotalPrice().doubleValue());
			orderItemVoList.add(assembleOrderItemVo(orderItem));
		}
		orderProductVo.setProductTotalPrice(payment);
		orderProductVo.setOrderItemVoList(orderItemVoList);
		orderProductVo.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));
		
		return serverResponse.createBySuccess(orderProductVo);
	}

	@Override
	public ServerResponse<OrderVo> getOrderDetail(Integer userId, Long orderNo) {
		Order order = orderMapper.selectByUserAndOrderNo(userId, orderNo);
		if(order != null){
			List<OrderItem> orderItemList = orderItemMapper.getByOrderNoUserId(orderNo,userId);
			OrderVo orderVo = assembleOrderVo(order, orderItemList);
			return ServerResponse.createBySuccess(orderVo);
		}
		
		return ServerResponse.createByErrorMessage("没有找到该订单");
	}

	@Override
	public ServerResponse<PageInfo> getOrderList(Integer userId, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<Order> orderList = orderMapper.selectByUserId(userId);
		List<OrderVo> orderVoList = assembleOrderVoList(orderList, userId);
		PageInfo pageResult = new PageInfo(orderList);
		pageResult.setList(orderVoList);
		return ServerResponse.createBySuccess(pageResult);
		
	}

	private List<OrderVo> assembleOrderVoList(List<Order> orderList, Integer userId) {
		List<OrderVo> orderVoList = Lists.newArrayList();
		for (Order order : orderList) {
			List<OrderItem> orderItemList = Lists.newArrayList();
			if(userId == null){
				orderItemList = orderItemMapper.getByOrderNo(order.getOrderNo());
			}else{
				
				orderItemList = orderItemMapper.getByOrderNoUserId(order.getOrderNo(), userId);
			}
			OrderVo orderVo = assembleOrderVo(order,orderItemList);
			orderVoList.add(orderVo);
		}
		
		return orderVoList;
	}


	@Override
	public ServerResponse<PageInfo> manageList(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Order> orderList = orderMapper.selectAllOrder();
		List<OrderVo> orderVolist = this.assembleOrderVoList(orderList, null);
		PageInfo pageResult = new PageInfo(orderList);
		pageResult.setList(orderVolist);
		
		return ServerResponse.createBySuccess(pageResult);
	}

	@Override
	public ServerResponse<OrderVo> manageDetail(Long orderNo) {
		Order order = orderMapper.selectByOrderNo(orderNo);
		if(order !=null ){
			List<OrderItem> orderItemList = orderItemMapper.getByOrderNo(orderNo);
			OrderVo orderVo = assembleOrderVo(order,orderItemList);
			return ServerResponse.createBySuccess(orderVo);
		}
		
		return ServerResponse.createByErrorMessage("订单不存在");
	}

	@Override
	public ServerResponse<PageInfo> manageSearch(Long orderNo, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Order order = orderMapper.selectByOrderNo(orderNo);
		if(order != null ){
			List<OrderItem> orderItemList = orderItemMapper.getByOrderNo(orderNo);
			OrderVo orderVo = assembleOrderVo(order, orderItemList);
			
			PageInfo pageResult = new PageInfo(Lists.newArrayList(order));
			pageResult.setList(Lists.newArrayList(orderVo));
			return ServerResponse.createBySuccess(pageResult);
		}
		return ServerResponse.createByErrorMessage("订单不存在");
	}

	@Override
	public ServerResponse<String> manageSendGoods(Long orderNo) {
		Order order= orderMapper.selectByOrderNo(orderNo);
        if(order != null){
            if(order.getStatus() == Const.OrderStatusEnum.PAID.getCode()){
                order.setStatus(Const.OrderStatusEnum.SHIPPED.getCode());
                order.setSendTime(new Date());
                orderMapper.updateByPrimaryKeySelective(order);
                return ServerResponse.createBySuccess("发货成功");
            }
        }
        return ServerResponse.createByErrorMessage("订单不存在");
	}

}
