<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退换货</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/refstyle.css" rel="stylesheet" type="text/css">
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
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">退换货申请</strong> / <small>Apply&nbsp;for&nbsp;returns</small>
					</div>
				</div>
				<hr />
				<div class="comment-list">
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
								<i class="u-stage-icon-inner">1<em class="bg"></em></i>
								<p class="stage-name">买家申请退款</p>
							</span> <span class="step-2 step"> <em
								class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">2<em
									class="bg"></em></i>
								<p class="stage-name">商家处理退款申请</p>
							</span> <span class="step-3 step"> <em
								class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">3<em
									class="bg"></em></i>
								<p class="stage-name">款项成功退回</p>
							</span> <span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>


					<div class="refund-aside">
						<div class="item-pic">
							<a href="#" class="J_MakePoint"> <img
								src="${ctx }/images/comment.jpg_400x400.jpg" class="itempic">
							</a>
						</div>

						<div class="item-title">

							<div class="item-name">
								<a href="#">
									<p class="item-basic-info">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
								</a>
							</div>
							<div class="info-little">
								<span>颜色：洛阳牡丹</span> <span>包装：裸装</span>
							</div>
						</div>
						<div class="item-info">
							<div class="item-ordernumber">
								<span class="info-title">订单编号：</span><a>1474784641639947</a>
							</div>
							<div class="item-price">
								<span class="info-title">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</span><span
									class="price">19.88元</span> <span class="number">×1</span><span
									class="item-title">(数量)</span>
							</div>
							<div class="item-amount">
								<span class="info-title">小&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：</span><span
									class="amount">19.88元</span>
							</div>
							<div class="item-pay-logis">
								<span class="info-title">运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：</span><span
									class="price">10.00元</span>
							</div>
							<div class="item-amountall">
								<span class="info-title">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：</span><span
									class="amountall">29.88元</span>
							</div>
							<div class="item-time">
								<span class="info-title">成交时间：</span><span class="time">2015-12-12&nbsp;17:07</span>
							</div>

						</div>
						<div class="clear"></div>
					</div>

					<div class="refund-main">
						<div class="item-comment">
							<div class="am-form-group">
								<label for="refund-type" class="am-form-label">退款类型</label>
								<div class="am-form-content">
									<select data-am-selected="">
										<option value="a" selected>仅退款</option>
										<option value="b">退款/退货</option>
									</select>
								</div>
							</div>

							<div class="am-form-group">
								<label for="refund-reason" class="am-form-label">退款原因</label>
								<div class="am-form-content">
									<select data-am-selected="">
										<option value="a" selected>请选择退款原因</option>
										<option value="b">不想要了</option>
										<option value="c">买错了</option>
										<option value="d">没收到货</option>
										<option value="e">与说明不符</option>
									</select>
								</div>
							</div>

							<div class="am-form-group">
								<label for="refund-money" class="am-form-label">退款金额<span>（不可修改）</span></label>
								<div class="am-form-content">
									<input type="text" id="refund-money" readonly="readonly"
										placeholder="19.88">
								</div>
							</div>
							<div class="am-form-group">
								<label for="refund-info" class="am-form-label">退款说明<span>（可不填）</span></label>
								<div class="am-form-content">
									<textarea placeholder="请输入退款说明"></textarea>
								</div>
							</div>

						</div>
						<div class="refund-tip">
							<div class="filePic">
								<input type="file" class="inputPic" value="选择凭证图片" name="file"
									max="5" maxsize="5120" allowexts="gif,jpeg,jpg,png,bmp"
									accept="image/*"> <img src="${ctx }/images/image.jpg" alt="">
							</div>
							<span class="desc">上传凭证&nbsp;最多三张</span>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger">提交申请</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
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