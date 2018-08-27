<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全设置</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/infstyle.css" rel="stylesheet" type="text/css">
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

				<!--标题 -->
				<div class="user-safety">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small>
						</div>
					</div>
					<hr />

					<!--头像 -->
					<div class="user-infoPic">

						<div class="filePic">
							<img class="am-circle am-img-thumbnail"
								src="${ctx }/images/getAvatar.do.jpg" alt="" />
						</div>

						<p class="am-form-help">头像</p>

						<div class="info-m">
							<div>
								<b>用户名：<i>小叮当</i></b>
							</div>
							<div class="u-level">
								<span class="rank r2"> <s class="vip1"></s><a
									class="classes" href="#">铜牌会员</a>
								</span>
							</div>
							<div class="u-safety">
								<a href="safety.html"> 账户安全 <span class="u-profile"><i
										class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
								</a>
							</div>
						</div>
					</div>

					<div class="check">
						<ul>
							<li><i class="i-safety-lock"></i>
								<div class="m-left">
									<div class="fore1">登录密码</div>
									<div class="fore2">
										<small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="password.html">
										<div class="am-btn am-btn-secondary">修改</div>
									</a>
								</div></li>
							<li><i class="i-safety-wallet"></i>
								<div class="m-left">
									<div class="fore1">支付密码</div>
									<div class="fore2">
										<small>启用支付密码功能，为您资产账户安全加把锁。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="setpay.html">
										<div class="am-btn am-btn-secondary">立即启用</div>
									</a>
								</div></li>
							<li><i class="i-safety-iphone"></i>
								<div class="m-left">
									<div class="fore1">手机验证</div>
									<div class="fore2">
										<small>您验证的手机：186XXXXXXXX 若已丢失或停用，请立即更换</small>
									</div>
								</div>
								<div class="fore3">
									<a href="bindphone.html">
										<div class="am-btn am-btn-secondary">换绑</div>
									</a>
								</div></li>
							<li><i class="i-safety-mail"></i>
								<div class="m-left">
									<div class="fore1">邮箱验证</div>
									<div class="fore2">
										<small>您验证的邮箱：5831XXX@qq.com 可用于快速找回登录密码</small>
									</div>
								</div>
								<div class="fore3">
									<a href="email.html">
										<div class="am-btn am-btn-secondary">换绑</div>
									</a>
								</div></li>
							<li><i class="i-safety-idcard"></i>
								<div class="m-left">
									<div class="fore1">实名认证</div>
									<div class="fore2">
										<small>用于提升账号的安全性和信任级别，认证后不能修改认证信息。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="idcard.html">
										<div class="am-btn am-btn-secondary">认证</div>
									</a>
								</div></li>
							<li><i class="i-safety-security"></i>
								<div class="m-left">
									<div class="fore1">安全问题</div>
									<div class="fore2">
										<small>保护账户安全，验证您身份的工具之一。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="question.html">
										<div class="am-btn am-btn-secondary">认证</div>
									</a>
								</div></li>
						</ul>
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