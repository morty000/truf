<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款成功页面</title>
<link rel="stylesheet" type="text/css"
	href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="${ctx }/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/basic/js/jquery-1.7.min.js"></script>
</head>
<body>
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
				<a href="person.html" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
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
					id="ai-topsearch" class="submit" value="搜索" index="1" type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>



	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>¥9.90</em></li>
					<div class="user-info">
						<p>收货人：艾迪</p>
						<p>联系电话：15871145629</p>
						<p>收货地址：湖北省 武汉市 武昌区 东湖路75号众环大厦</p>
					</div>
					请认真核对您的收货信息，如有错误请联系客服

				</ul>
				<div class="option">
					<span class="info">您可以</span> <a href="${ctx }/person/order.html"
						class="J_MakePoint">查看<span>已买到的宝贝</span></a> <a
						href="${ctx }/person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
				</div>
			</div>
		</div>
	</div>


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
</body>
</html>