package com.ggy.truf.vo;

import java.util.List;

import com.ggy.truf.pojo.OrderItem;

public class OrderProductVo {
	private List<OrderItemVo> orderItemVoList;
    private Double productTotalPrice;
    private String imageHost;
    
	public List<OrderItemVo> getOrderItemVoList() {
		return orderItemVoList;
	}
	public void setOrderItemVoList(List<OrderItemVo> orderItemVoList) {
		this.orderItemVoList = orderItemVoList;
	}
	public Double getProductTotalPrice() {
		return productTotalPrice;
	}
	public void setProductTotalPrice(Double payment) {
		this.productTotalPrice = payment;
	}
	public String getImageHost() {
		return imageHost;
	}
	public void setImageHost(String imageHost) {
		this.imageHost = imageHost;
	}
	
    
}
