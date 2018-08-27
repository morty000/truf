<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/systyle.css" rel="stylesheet" type="text/css">
</head>
<body>
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
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
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
	</article> </header>

	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="wrap-left">
					<div class="wrap-list">
						<div class="m-user">
							<!--个人信息 -->
							<div class="m-bg"></div>
							<div class="m-userinfo">
								<div class="m-baseinfo">
									<a href="information.html"> <img
										src="${ctx }/images/getAvatar.do.jpg">
									</a> <em class="s-name">(小叮当)<span class="vip1"></em>
									<!-- <div class="s-prestige am-btn am-round">
										</span>会员福利
									</div> -->
								</div>
								<div class="m-right">
									<div class="m-address">
										<a href="address.html" class="i-trigger">我的收货地址</a>
									</div>
								</div>
							</div>

						</div>
						<div class="box-container-bottom"></div>

						<!--订单 -->
						<div class="m-order">
							<div class="s-bar">
								<i class="s-icon"></i>我的订单 <a class="i-load-more-item-shadow"
									href="order.html">全部订单</a>
							</div>
							<ul>
								<li><a href="order.html"><i><img
											src="${ctx }/images/pay.png" /></i><span>待付款</span></a></li>
								<li><a href="order.html"><i><img
											src="${ctx }/images/send.png" /></i><span>待发货<em class="m-num">1</em></span></a></li>
								<li><a href="order.html"><i><img
											src="${ctx }/images/receive.png" /></i><span>待收货</span></a></li>
								<li><a href="change.html"><i><img
											src="${ctx }/images/refund.png" /></i><span>退换货</span></a></li>
							</ul>
						</div>
						
					</div>
				</div>
				<div class="wrap-right">

					<!-- 日历-->
					<div class="day-list">
						<div class="s-bar">
							<a class="i-history-trigger s-icon" href="#"></a>我的日历 <a
								class="i-setting-trigger s-icon" href="#"></a>
						</div>
						<div class="s-care s-care-noweather">
							<div class="s-date">
								<em>21</em> <span>星期一</span> <span>2015.12</span>
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
					<li><a href="change.html">退款售后</a></li>
				</ul></li>
		</ul>
		</aside>
	</div>
</body>
</html>