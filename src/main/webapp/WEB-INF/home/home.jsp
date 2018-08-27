<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/13
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>首页</title>

    <link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/css/skin.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${ctx }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>
<div class="hmtop">
    <!--顶部导航条 -->
    <div class="am-container header">
        <c:if test="${sessionScope.currentUser == null}">
            <ul class="message-l">
                <div class="topMessage">
                    <div class="menu-hd">
                        <a href="${ctx}/login.html" target="_top" class="h">亲，请登录</a>
                        <a href="${ctx}/register.html" target="_top">免费注册</a>
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
                <div class="menu-hd"><a href="${ctx}/home.html" target="_top" class="h"><span
                        style="color: red;">商城首页</span></a></div>
            </div>
            <div class="topMessage my-shangcheng">
                <div class="menu-hd MyShangcheng"><a href="${ctx}/person.html" target="_top"><i
                        class="am-icon-user am-icon-fw"></i>个人中心</a></div>
            </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd"><a id="mc-menu-hd" href="${ctx}/shopcart.html" target="_top"><i
                        class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum"
                                                                                              class="h"></strong></a>
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
            <form>
                <input id="searchInput" name="keywords" type="text" placeholder=" 搜索">
                <input id="ai-topsearch" onclick="search_keywords()" class="submit am-btn" value="搜索" index="1" type="button">
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="banner">
    <!--轮播 -->
    <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
            <li class="banner1"><a href="${ctx}/introduction.html?productId=1"><img
                    src="http://image.imooc.com/轮播/TB1GTqhSpXXXXakXFXXSutbFXXX.jpg"/></a></li>
            <li class="banner2"><a href="${ctx}/introduction.html?productId=2"><img
                    src="http://image.imooc.com/轮播/TB1jcEGPpXXXXbtaXXXXXXXXXXX.jpg"/></a></li>
            <li class="banner3"><a href="${ctx}/introduction.html?productId=3"><img
                    src="http://image.imooc.com/轮播/0dcf5f9e753ba791d51d4de937d4.jpg"/></a></li>
            <li class="banner3"><a href="${ctx}/introduction.html?productId=4"><img
                    src="http://image.imooc.com/轮播/timg (1).jpg"/></a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="shopNav">
    <div class="slideall">
        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <!--侧边导航 -->
        <div id="nav" class="navfull">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">
                    <div class="category">
                        <ul class="category-list" id="js_climit_li">
                            <c:forEach items="${sessionScope.category}" var="category" varStatus="index">
                                <li class="appliance js_toggle relative first">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name"><i><img src="${ctx }/images/cake.png"></i><a
                                                class="ml-22" title="${category.key}">${category.key}</a></h3>
                                        <em>&gt;</em></div>
                                    <div class="menu-item menu-in top">
                                        <div class="">
                                            <div class="area-bg">
                                                <div class="menu-srot">
                                                    <div class="sort-side">
                                                        <dl class="dl-sort">
                                                            <dt><span title="${category.key}">${category.key}</span>
                                                            </dt>
                                                            <c:forEach items="${category.value}" var="list">
                                                                <dd><a title="${list.name}"
                                                                       href="${ctx}/search.html?categoryId=${list.id}"><span>${list.name}</span></a></dd>
                                                            </c:forEach>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <b class="arrow"></b>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--轮播-->
        <script type="text/javascript">
            (function () {
                $('.am-slider').flexslider();
            });
            $(document).ready(function () {
                $("li").hover(function () {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function () {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>
        <!--走马灯 -->
        <div class="marqueen">
            <span class="marqueen-title">商城头条</span>
            <div class="demo">
                <ul>
                    <li class="title-first"><a target="_blank" href="#">
                        <img src="${ctx }/images/TJ2.jpg"></img>
                        <span>[特惠]</span>喜迎厦门国际金砖会议
                    </a></li>
                    <li class="title-first"><a target="_blank" href="#">
                        <span>[公告]</span>喜迎厦门国际金砖会议
                        <img src="${ctx }/images/TJ.jpg" />
                        <p>XXXXXXXXXXXXXXXXXX</p>
                    </a></li>
                    <div class="mod-vip">
                        <div class="m-baseinfo">
                            <a href="${ctx }/person.html">
                                <img src="${ctx }/images/getAvatar.do.jpg">
                            </a>
                            <c:if test="${sessionScope.currentUser != null}">
                                <em>
                                    Hi,<span class="s-name">${sessionScope.currentUser.getName()}</span>
                                    <a href="#"><p>点击更多优惠活动</p></a>
                                </em>
                            </c:if>
                            <c:if test="${sessionScope.currentUser == null}">
                                <em>
                                    Hi,<span class="s-name"> 请登录 </span>
                                </em>
                            </c:if>
                        </div>
                        <c:if test="${sessionScope.currentUser == null}">
                            <div class="member-logout">
                                <a class="am-btn-warning btn" href="${ctx}/login.html">登录</a>
                                <a class="am-btn-warning btn" href="${ctx}/register.html">注册</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.currentUser != null}">
                            <div class="member-logout">
                                <a class="am-btn-warning btn" href="${ctx}/user/logout.do">登出</a>
                            </div>
                        </c:if>
                    </div>
                    <li><a target="_blank" href="#"><span>[特惠]</span>喜迎厦门国际金砖会议</a></li>
                    <li><a target="_blank" href="#"><span>[公告]</span>喜迎厦门国际金砖会议</a></li>
                    <li><a target="_blank" href="#"><span>[特惠]</span>喜迎厦门国际金砖会议</a></li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function () {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }

            $(function () {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">
        <!--今日推荐 -->
        <div class="am-g am-g-fixed recommendation">
            <div class="clock am-u-sm-3">
                <img src="${ctx }/images/2017.gif"/>
                <p>今日<br>推荐</p>
            </div>
            <c:forEach items="${sessionScope.recommend}" var="product" varStatus="index">
            <div class="am-u-sm-4 am-u-lg-3">
                <div class="info">
                    <h3>路在脚下</h3>
                    <h4>走过的青春印记</h4>
                </div>
                <c:if test="${index.index == 0}">
                <div class="recommendationMain one">
                    </c:if>
                    <c:if test="${index.index == 1}">
                    <div class="recommendationMain two">
                        </c:if>
                        <c:if test="${index.index == 2}">
                        <div class="recommendationMain three">
                            </c:if>
                            <a href="${ctx}/introduction.html?productId=${product.id}"><img src="http://image.imooc.com/${product.mainImage}"/></a>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <div class="clear"></div>
                <div class="clear"></div>
                <!-- 主体下部 -->
                <c:forEach items="${sessionScope.category}" var="category" varStatus="index" begin="0" end="5">
                    <div id="f${index.index + 1}">
                        <div class="am-container">
                            <div class="shopTitle">
                                <h4>${category.key}</h4>
                                <h3>每一双鞋都有一个故事</h3>
                                <div class="today-brands">
                                    <c:forEach items="${category.value}" var="list" begin="0" end="5">
                                        <a href="${ctx}/search.html?categoryId=${list.id}">${list.name}</a>
                                    </c:forEach>
                                </div>
                                <span class="more">
                                    <a href="#">更多样式<i class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
                                </span>
                            </div>
                        </div>
                        <div class="am-g am-g-fixed floodFour">
                            <div class="am-u-sm-5 am-u-md-4 text-one list">
                                <div class="word">
                                    <c:forEach items="${category.value}" var="list" begin="0" end="5">
                                        <a class="outer" href="${ctx}/search.html?categoryId=${list.id}"><span class="inner"><b
                                                class="text">${list.name}</b></span></a>
                                    </c:forEach>
                                </div>
                                <a href="#">
                                    <div class="outer-con">
                                        <div class="title">
                                            开抢啦！
                                        </div>
                                        <div class="sub-title">
                                            &nbsp;
                                        </div>
                                    </div>
                                    <img src="${ctx}/images/act1.png"/>
                                </a>
                                <div class="triangle-topright"></div>
                            </div>
                            <c:forEach items="${sessionScope.productByCategory}" var="productByCategory" begin="0"
                                       end="5">
                                <c:if test="${category.key == productByCategory.key}">
                                    <div class="am-u-sm-7 am-u-md-4 text-two sug">
                                        <div class="outer-con">
                                            <div class="title">
                                                &nbsp;
                                            </div>
                                            <div class="sub-title">
                                                &nbsp;
                                            </div>
                                            <!-- 添加购物车按钮 -->
                                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                        </div>
                                        <a href="${ctx}/introduction.html?productId=${productByCategory.value[0].id}"><img
                                                src="http://image.imooc.com/${productByCategory.value[0].mainImage}"/></a>
                                    </div>
                                    <div class="am-u-sm-7 am-u-md-4 text-two">
                                        <div class="outer-con">
                                            <div class="title">
                                                &nbsp;
                                            </div>
                                            <div class="sub-title">
                                                &nbsp;
                                            </div>
                                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                        </div>
                                        <a href="${ctx}/introduction.html?productId=${productByCategory.value[1].id}"><img
                                                src="http://image.imooc.com/${productByCategory.value[1].mainImage}"/></a>
                                    </div>
                                    <div class="am-u-sm-3 am-u-md-2 text-three big">
                                        <div class="outer-con">
                                            <div class="title">
                                                &nbsp;
                                            </div>
                                            <div class="sub-title">
                                                &nbsp;
                                            </div>
                                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                        </div>
                                        <a href="${ctx}/introduction.html?productId=${productByCategory.value[2].id}"><img
                                                src="http://image.imooc.com/${productByCategory.value[2].mainImage}"/></a>
                                    </div>
                                    <div class="am-u-sm-3 am-u-md-2 text-three sug">
                                        <div class="outer-con">
                                            <div class="title">
                                                &nbsp;
                                            </div>
                                            <div class="sub-title">
                                                &nbsp;
                                            </div>
                                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                        </div>
                                        <a href="${ctx}/introduction.html?productId=${productByCategory.value[3].id}"><img
                                                src="http://image.imooc.com/${productByCategory.value[3].mainImage}"/></a>
                                    </div>
                                    <div class="am-u-sm-3 am-u-md-2 text-three">
                                        <div class="outer-con">
                                            <div class="title">
                                                &nbsp;
                                            </div>
                                            <div class="sub-title">
                                                &nbsp;
                                            </div>
                                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                        </div>
                                        <a href="${ctx}/introduction.html?productId=${productByCategory.value[4].id}"><img
                                                src="http://image.imooc.com/${productByCategory.value[4].mainImage}"/></a>
                                    </div>
                                    <div class="am-u-sm-3 am-u-md-2 text-three last big">
                                        <div class="outer-con">
                                            <div class="title">
                                                &nbsp;
                                            </div>
                                            <div class="sub-title">
                                                &nbsp;
                                            </div>
                                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                                        </div>
                                        <a href="${ctx}/introduction.html?productId=${productByCategory.value[5].id}"><img
                                                src="http://image.imooc.com/${productByCategory.value[5].mainImage}"/></a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="clear"></div>
                    </div>
                </c:forEach>
                <div class="footer">
                    <div class="footer-hd">
                        <p>
                            <a href="http://xiamen0213958.11467.com/" target="_blank">硅谷云科技</a>
                            <b>|</b>
                            <a href="/home.html">商城首页</a>
                            <b>|</b>
                            <a href="https://payservice.alipay.com" target="_blank">支付宝</a>
                            <b>|</b>
                            <a href="http://www.chinawutong.com/" target="_blank">物流</a>
                        </p>
                    </div>
                    <div class="footer-bd">
                        <p>
                        <div style="text-align: center;"><em>© 2017-2027 版权所有.</em></div>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="${ctx}/basic/js/quick_links.js"></script>
    </div>
</div>
</body>
<script type="text/javascript">
    function search_keywords() {
        var search_text = $("#searchInput").val();
        search_text = encodeURI(search_text);
        window.location.href="${ctx}/product/keywords.do?keywords="+search_text;
    }
</script>
</html>