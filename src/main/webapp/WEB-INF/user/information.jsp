<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/infstyle.css" rel="stylesheet" type="text/css">
<script src="${ctx }/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="${ctx }/AmazeUI-2.4.2/assets/js/amazeui.js"
	type="text/javascript"></script>

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
							<a href="login.html" target="_top" class="h">亲，请登录</a> <a
								href="register.html" target="_top">免费注册</a>
						</div>
					</div>
				</ul>
			</c:if>
			<c:if test="${sessionScope.currentUser != null}">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							欢迎 <a href="person.html" target="_top"> <span
								style="color: darkorange;">
									${sessionScope.currentUser.getName()} </span>
							</a> 来到TRUF商城
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
						<a href="person.html" target="_top"><i
							class="am-icon-user am-icon-fw"></i><span style="color: red;">个人中心</span></a>
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

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />

					<!--头像 -->
					<div class="user-infoPic">

						<div class="filePic">
							<input type="file" class="inputPic"
								allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"> <img
								class="am-circle am-img-thumbnail"
								src="${ctx }/images/getAvatar.do.jpg" alt="" />
						</div>

						<p class="am-form-help">头像</p>

						<div class="info-m">
							<div>
								<b>姓名：<i>${sessionScope.currentUser.getName()}</i></b>
							</div>
						</div>
					</div>

					<!--个人信息 -->
					<div class="info-main" id="user_save">
						<form class="am-form am-form-horizontal">

							<div class="am-form-group">
								<label for="user-name" class="am-form-label">姓名</label>
								<div class="am-form-content">
									<input type="text" id="user-name2" 
										placeholder="${sessionScope.currentUser.getName()}">

								</div>
							</div>

							<div class="am-form-group">
								<label class="am-form-label">性别</label>
								<div class="am-form-content sex">
									<label class="am-radio-inline"> <input type="radio"
										name="radio10" value="male" data-am-ucheck checked="checked">
										男
									</label> <label class="am-radio-inline"> <input type="radio"
										name="radio10" value="female" data-am-ucheck> 女
									</label> <label class="am-radio-inline"> <input type="radio"
										name="radio10" value="secret" data-am-ucheck> 保密
									</label>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-form-label">电话</label>
								<div class="am-form-content">
									<input id="user-phone"
										placeholder="${sessionScope.currentUser.getPhone()}"
										type="tel">

								</div>
							</div>
							<div class="am-form-group">
								<label for="user-email" class="am-form-label">电子邮件</label>
								<div class="am-form-content">
									<input id="user-email"
										placeholder="${sessionScope.currentUser.getEmail()}"
										type="email">

								</div>
							</div>

							<div class="info-btn">
								<button type="submit" class="am-btn am-btn-danger" id="save_btn">保存修改</button>
								<button type="button" class="am-btn am-btn-danger"
									data-dismiss="modal">取消</button>
							</div>
						</form>
					</div>

				</div>

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

		<aside class="menu">
		<ul>
			<li class="person"><a href="person.html">个人中心</a></li>
			<li class="person"><a href="#">个人资料</a>
				<ul>
					<li class="active"><a href="information.html">个人信息</a></li>
					<li><a href="safety.html">安全设置</a></li>
					<li><a href="address.html">收货地址</a></li>
				</ul></li>
			<li class="person"><a href="#">我的交易</a>
				<ul>
					<li><a href="order.html">订单管理</a></li>
					<li><a href="change.html">退款售后</a></li>
				</ul></li>
		</ul>

		</aside>
	</div>

	<script>
		$(function() {
			$("#save_btn").click(function() {
				//数据校验
				var name = $("#name").val();
				var phone = $("#phone").val;
				var regPhone = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
				if (!regPhone.test(phone)) {
					show_validate_form("#phone", "error","手机号有误")
					return false;
				} else {
					show_validate_form("#phone", "success", "")
				}
				var email = $("#email").val();
				var regEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				if (!regEmail.test(email)) {
					show_validate_form("#email", "error","邮箱格式不正确")
					return false;
				} else {
					show_validate_form("#email", "success", "")
				}
				//保存
				$.ajax({
					type : "POST",
					url : "${ctx}/user/update_information.do",
					data : {
						"name" : name,
						"phone" : phone,
						"email" : email
					},
					datatype : "json",
					success : function(result) {
						alert("更新成功");
					}
				})
			})
		})
	</script>
</body>
</html>