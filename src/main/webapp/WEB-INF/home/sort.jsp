<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全部分类</title>
<link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx }/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/sortstyle.css" rel="stylesheet" type="text/css" />
<script src="${ctx }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
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
				<a href="home.html" target="_top" class="h"><span style="color: red;">商城首页</span></a>
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
					class="am-icon-shopping-cart  am-icon-fw"></i>购物车<strong
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
			<form>
				<input id="searchInput" name="keywords" type="text" placeholder=" 搜索">
				<input id="ai-topsearch" onclick="search_keywords()" class="submit am-btn" value="搜索" index="1" type="button">
			</form>
		</div>
	</div>

	<div class="clear"></div>
	</div>



	<!--主体-->

	<div id="nav" class="navfull">
		<div class="area clearfix">
			<div class="category-content" id="guide_2">
				<div class="long-title">
					<span class="all-goods">全部分类</span><span id="meauBack"><a
						href="home.html">返回</a></span>
				</div>
				<div class="category">
					<ul class="category-list" id="js_climit_li">
						<li class="appliance js_toggle relative first selected">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/cake.png"></i><a class="ml-22"
										title="点心">点心/蛋糕</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">

											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>

											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">蛋糕</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">点心</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>

											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/cookies.png"></i><a class="ml-22"
										title="饼干、膨化">饼干/膨化</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="饼干">饼干</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="薯片">薯片</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">虾条</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/meat.png"></i><a class="ml-22"
										title="熟食、肉类">熟食/肉类</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="猪肉脯">猪肉脯</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="牛肉丝">牛肉丝</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="小香肠">小香肠</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/bamboo.png"></i><a class="ml-22"
										title="素食、卤味">素食/卤味</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="豆干">豆干</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="干笋">干笋</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="鸭脖">鸭脖</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/nut.png"></i><a class="ml-22"
										title="坚果、炒货">坚果/炒货</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">坚果</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">锅巴</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/candy.png"></i><a class="ml-22"
										title="糖果、蜜饯">糖果/蜜饯</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="糖果">糖果</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="蜜饯">蜜饯</span>
													</dt>
													<dd>
														<a title="猕猴桃干" href="#"><span>猕猴桃干</span></a>
													</dd>
													<dd>
														<a title="糖樱桃" href="#"><span>糖樱桃</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/chocolate.png"></i><a
										class="ml-22" title="巧克力">巧克力</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">巧克力</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">果冻</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/fish.png"></i><a class="ml-22"
										title="海味、河鲜">海味/河鲜</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="海带丝">海带丝</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="小鱼干">小鱼干</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="鱿鱼丝">鱿鱼丝</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/tea.png"></i><a class="ml-22"
										title="花茶、果茶">花茶/果茶</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">蛋糕</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">点心</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative last">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="${ctx }/images/package.png"></i><a class="ml-22"
										title="品牌、礼包">品牌/礼包</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="${ctx }/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="大包装">大包装</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="两件套">两件套</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div>

						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("li").click(
							function() {
								$(this).addClass("selected").siblings()
										.removeClass("selected");
							})
				})
	</script>
	<div class="clear"></div>
	
</body>
<script type="text/javascript">
    function search_keywords() {
        var search_text = $("#searchInput").val();
        search_text = encodeURI(search_text);
        window.location.href="${ctx}/product/keywords.do?keywords="+search_text;
    }
</script>
</html>