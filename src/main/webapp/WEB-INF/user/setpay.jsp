<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付密码</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/stepstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx }/js/jquery-1.7.2.min.js"></script>
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

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">支付密码</strong> / <small>Set&nbsp;Pay&nbsp;Password</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em></i>
							<p class="stage-name">设置支付密码</p>
						</span> <span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">2<em class="bg"></em></i>
							<p class="stage-name">完成</p>
						</span> <span class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form class="am-form am-form-horizontal">
					<div class="am-form-group bind">
						<label for="user-phone" class="am-form-label">验证手机</label>
						<div class="am-form-content">
							<span id="user-phone">186XXXX0531</span>
						</div>
					</div>
					<div class="am-form-group code">
						<label for="user-code" class="am-form-label">验证码</label>
						<div class="am-form-content">
							<input type="tel" id="user-code" placeholder="短信验证码">
						</div>
						<a class="btn" href="javascript:void(0);"
							onclick="sendMobileCode();" id="sendMobileCode">
							<div class="am-btn am-btn-danger">验证码</div>
						</a>
					</div>
					<div class="am-form-group">
						<label for="user-password" class="am-form-label">支付密码</label>
						<div class="am-form-content">
							<input type="tel" id="user-password" placeholder="6位数字">
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-confirm-password" class="am-form-label">确认密码</label>
						<div class="am-form-content">
							<input type="tel" id="user-confirm-password"
								placeholder="请再次输入上面的密码">
						</div>
					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger">保存修改</div>
					</div>

				</form>

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
						 <center><em>© 2017 guiguyun.com 版权所有. </em></center>
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
					<li class="active"><a href="safety.html">安全设置</a></li>
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