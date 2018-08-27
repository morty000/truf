<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
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
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="login.html" target="_top" class="h">亲，请登录</a> <a
							href="register.html" target="_top">免费注册</a>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="home.html" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="person.html" target="_top"><i
							class="am-icon-user am-icon-fw"></i>个人中心</a>
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
						<strong class="am-text-danger am-text-lg">忘记密码</strong> / <small>Forgetpwd</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em></i>
							<p class="stage-name">信息验证</p>
						</span> 
						<span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">2<em class="bg"></em></i>
							<p class="stage-name">完成</p>
						</span> 
						<span class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>

				<form class="am-form am-form-horizontal">
					<div class="am-form-group">
						<label for="user-name" class="am-form-label">用户名:</label>
						<div class="am-form-content">
							<input type="text" id="user-name2" placeholder="username">
						</div>
					</div>
					<div class="am-form-group select">
						<label for="user-question1" class="am-form-label">问题：</label>
						<div class="am-form-content">
							<select data-am-selected>
								<option value="a" selected>请选择安全问题</option>
								<option value="b">${sessionScope.currentUser.getQuestion()}</option>
								<option value="c">您的故乡在哪里？</option>
							</select>
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-answer1" class="am-form-label">答案:</label>
						<div class="am-form-content">
							<input type="text" id="user-answer" placeholder="请输入安全问题答案">
						</div>
					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger">找回密码</div>
					</div>
					<div class="info-btn">
                        <a class="link" href="login.html">返回登录>></a>
                    </div>	
				</form>

			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">硅谷云科技</a> <b>|</b> <a href="home.html">商城首页</a> <b>|</b>
						<a href="#">支付宝</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
					<center>
						<em>© 2017 guiguyun.com 版权所有. </em>
					</center>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>