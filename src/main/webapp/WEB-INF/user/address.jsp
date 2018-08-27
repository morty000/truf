<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地址管理</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="${ctx }/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
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
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logoBig">
				<li><img src="${ctx }/images/logo.png"/></li>
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

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">

						<li class="user-addresslist defaultAddr"><span
							class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
							<p class="new-tit new-p-re">
								<span class="new-txt"></span>${address.receiverPhone} <span class="new-txt-rd2">${address.receiverPhone}</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">${address.receiverProvince}</span>省
									<span class="city">${address.receiverCity }</span>市 <span class="dist">${address.receiverDistrict }</span>区 <span
										class="street">${address.receiverAddress }</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="javascript:void(0);" onclick="edit_Click(this);"><i class="am-icon-edit"></i>编辑</a> <span
									class="new-addr-bar">|</span> 
									<a href="javascript:void(0);"
									onclick="delect_Click(this);"><i class="am-icon-trash"></i>删除</a>
							</div></li>

						<li class="user-addresslist"><span class="new-option-r"><i
								class="am-icon-check-circle"></i>设为默认</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">小叮当</span> <span class="new-txt-rd2">159****1622</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">湖北</span>省
									<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
							</div></li>
						<li class="user-addresslist"><span class="new-option-r"><i
								class="am-icon-check-circle"></i>设为默认</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">小叮当</span> <span class="new-txt-rd2">159****1622</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">湖北</span>省
									<span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="#"><i class="am-icon-edit"></i>编辑</a> <span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
							</div></li>
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal">

									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" placeholder="收货人">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" placeholder="手机号必填" type="email">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
											<select data-am-selected>
												<option value="a">浙江省</option>
												<option value="b" selected>湖北省</option>
											</select> <select data-am-selected>
												<option value="a">温州市</option>
												<option value="b" selected>武汉市</option>
											</select> <select data-am-selected>
												<option value="a">瑞安区</option>
												<option value="b" selected>洪山区</option>
											</select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"
												placeholder="输入详细地址"></textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<a class="am-btn am-btn-danger">保存</a>
											 <a href="javascript: void(0)"
												class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});
								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

					})
					$()
				</script>

				<div class="clear"></div>

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
						<em>© 2017-2027 版权所有.</em>
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
					<li><a href="information.html">个人信息</a></li>
					<li><a href="safety.html">安全设置</a></li>
					<li class="active"><a href="address.html">收货地址</a></li>
				</ul></li>
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