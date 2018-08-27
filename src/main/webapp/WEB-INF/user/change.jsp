<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退换货管理</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/orstyle.css" rel="stylesheet" type="text/css">
<script src="${ctx }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="${ctx }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>
<body>
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<div class="am-container header">
	<c:if test="${sessionScope.currentUser == null}">
	<ul class="message-l">
		<div class="topMessage">
			<div class="menu-hd">
				<a href="login.html" target="_top" class="h">亲，请登录</a> <a href="register.html"
					target="_top">免费注册</a>
			</div>
		</div>
	</ul>
	</c:if>
	<c:if test="${sessionScope.currentUser != null}">
            <ul class="message-l">
                <div class="topMessage">
                    <div class="menu-hd">
                        欢迎
                        <a href="person.html" target="_top">
                            <span style="color: darkorange;"> ${sessionScope.currentUser.getName()} </span>
                        </a>
                         来到TRUF商城
                    </div>
                </div>
            </ul>
        </c:if>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd">
				<a href="home.html" target="_top" class="h">商城首页</a>
			</div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng">
				<a href="person.html" target="_top"><i class="am-icon-user am-icon-fw"></i><span style="color: red;">个人中心</span></a>
			</div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd">
				<a id="mc-menu-hd" href="shopcart.html" target="_top"><i
					class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
					id="J_MiniCartNum" class="h">(1)</strong></a>
			</div>
		</div>
		<div class="topMessage favorite">
	</ul>
</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logoBig">
				<li><img src="${ctx }/images/logo.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	</article> </header>
	
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">退换货管理</strong> / <small>Change</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">退款管理</a></li>
							<li><a href="#tab2">售后管理</a></li>

						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-orderprice th-price">
										<td class="td-inner">交易金额</td>
									</div>
									<div class="th th-changeprice th-price">
										<td class="td-inner">退款金额</td>
									</div>
									<div class="th th-status th-moneystatus">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change th-changebuttom">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-title">
											<div class="dd-num">
												退款编号：<a href="javascript:;">1601430</a>
											</div>
											<span>申请时间：2015-12-20</span>
											<!--    <em>店铺：小桔灯</em>-->
										</div>
										<div class="order-content">
											<div class="order-left">
												<ul class="item-list">
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint"> <img
																src="${ctx }/images/kouhong.jpg_80x80.jpg"
																class="itempic J_ItemImg">
															</a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="#">
																	<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																	<p class="info-little">
																		颜色：12#川南玛瑙 <br />包装：裸装
																	</p>
																</a>
															</div>
														</div>
													</li>

													<ul class="td-changeorder">
														<li class="td td-orderprice">
															<div class="item-orderprice">
																<span>交易金额：</span>72.00
															</div>
														</li>
														<li class="td td-changeprice">
															<div class="item-changeprice">
																<span>退款金额：</span>70.00
															</div>
														</li>
													</ul>
													<div class="clear"></div>
												</ul>

												<div class="change move-right">
													<li class="td td-moneystatus td-status">
														<div class="item-status">
															<p class="Mystatus">退款成功</p>

														</div>
													</li>
												</div>
												<li class="td td-change td-changebutton"><a
													href="record.html">
														<div class="am-btn am-btn-danger anniu">钱款去向</div>
												</a></li>

											</div>
										</div>
									</div>

								</div>

							</div>
							<div class="am-tab-panel am-fade" id="tab2">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-orderprice th-price">
										<td class="td-inner">交易金额</td>
									</div>
									<div class="th th-changeprice th-price">
										<td class="td-inner">退款金额</td>
									</div>
									<div class="th th-status th-moneystatus">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change th-changebuttom">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-title">
											<div class="dd-num">
												退款编号：<a href="javascript:;">1601430</a>
											</div>
											<span>申请时间：2015-12-20</span>
											<!--    <em>店铺：小桔灯</em>-->
										</div>
										<div class="order-content">
											<div class="order-left">
												<ul class="item-list">
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint"> <img
																src="${ctx }/images/kouhong.jpg_80x80.jpg"
																class="itempic J_ItemImg">
															</a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="#">
																	<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																	<p class="info-little">
																		颜色：12#川南玛瑙 <br />包装：裸装
																	</p>
																</a>
															</div>
														</div>
													</li>

													<ul class="td-changeorder">
														<li class="td td-orderprice">
															<div class="item-orderprice">
																<span>交易金额：</span>72.00
															</div>
														</li>
														<li class="td td-changeprice">
															<div class="item-changeprice">
																<span>退款金额：</span>70.00
															</div>
														</li>
													</ul>
													<div class="clear"></div>
												</ul>

												<div class="change move-right">
													<li class="td td-moneystatus td-status">
														<div class="item-status">
															<p class="Mystatus">退款成功</p>

														</div>
													</li>
												</div>
												<li class="td td-change td-changebutton"><a
													href="record.html">
														<div class="am-btn am-btn-danger anniu">钱款去向</div>
												</a></li>

											</div>
										</div>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>

			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">硅谷云科技</a> <b>|</b> <a href="home.html">商城首页</a> <b>|</b> <a href="#">支付宝</a> 
					</p>
				</div>
				<div class="footer-bd">
					<p>
						 <center><em>© 2017-2027 版权所有.</em></center>
					</p>
				</div>
			</div>
		</div>

		<aside class="menu">
		<ul>
			<li class="person"><a href="person.html">个人中心</a></li>
			<li class="person"><a href="#">个人资料</a>
				<ul>
					<li><a href="information.html">个人信息</a></li>
					<li><a href="safety.html">安全设置</a></li>
					<li><a href="address.html">收货地址</a></li>
				</ul>
			</li>
			<li class="person"><a href="#">我的交易</a>
				<ul>
					<li><a href="order.html">订单管理</a></li>
					<li class="active"><a href="change.html">退款售后</a></li>
				</ul></li>
		</ul>

		</aside>
	</div>
</body>
</html>