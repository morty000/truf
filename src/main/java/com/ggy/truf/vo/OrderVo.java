package com.ggy.truf.vo;

import java.util.List;

public class OrderVo {

	private Long orderNo;
	private Double payment;
	private Integer paymenttype;
	private String paymentTypeDesc;
	private Integer postage;
	private Integer status;
	private String statusDesc;
	private String paymentTime;
	private String sendTime;
	private String endTime;
	private String closeTime;
	private String createTime;
	
	private List<OrderItemVo> orderItemVolist;
	
	private String ImageHost;
	private Integer AddressId;
	private String receiverName;
	
	private AddressVo addressVo;

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public Double getPayment() {
		return payment;
	}

	public void setPayment(Double payment) {
		this.payment = payment;
	}

	public Integer getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(Integer paymenttype) {
		this.paymenttype = paymenttype;
	}

	public String getPaymentTypeDesc() {
		return paymentTypeDesc;
	}

	public void setPaymentTypeDesc(String paymentTypeDesc) {
		this.paymentTypeDesc = paymentTypeDesc;
	}

	public Integer getPostage() {
		return postage;
	}

	public void setPostage(Integer postage) {
		this.postage = postage;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getStatusDesc() {
		return statusDesc;
	}

	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}

	public String getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(String paymentTime) {
		this.paymentTime = paymentTime;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public List<OrderItemVo> getOrderItemVolist() {
		return orderItemVolist;
	}

	public void setOrderItemVolist(List<OrderItemVo> orderItemVolist) {
		this.orderItemVolist = orderItemVolist;
	}

	public String getImageHost() {
		return ImageHost;
	}

	public void setImageHost(String imageHost) {
		ImageHost = imageHost;
	}

	public Integer getAddressId() {
		return AddressId;
	}

	public void setAddressId(Integer addressId) {
		AddressId = addressId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public AddressVo getAddressVo() {
		return addressVo;
	}

	public void setAddressVo(AddressVo addressVo) {
		this.addressVo = addressVo;
	}

	

	
	
	
}
