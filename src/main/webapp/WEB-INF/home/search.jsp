<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/22
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>搜索页面</title>
    <link href="${ctx}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/seastyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/script.js"></script>
</head>
<body>
<!--顶部导航条 -->
<div class="am-container header">
    <c:if test="${sessionScope.currentUser == null}">
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <a href="login.html" target="_top" class="h">亲，请登录</a>
                    <a href="register.html" target="_top">免费注册</a>
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
            <div class="menu-hd"><a href="home.html" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="${ctx}/person.html" target="_top"><i
                    class="am-icon-user am-icon-fw"></i>个人中心</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="${ctx}/shopcart.html" target="_top"><i
                    class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum"
                                                                                          class="h">0</strong></a>
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
<div class="clear"></div>
<b class="line"></b>
<div class="search">
    <div class="search-list">
        <div class="nav-table">
            <a href="/home.html">
                <div class="long-title"><span class="all-goods"> 商城首页 </span></div>
            </a>
        </div>
        <div class="am-g am-g-fixed">
            <div class="am-u-sm-12 am-u-md-12">
                <div class="search-content">
                    <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                        <c:forEach items="${sessionScope.searchProductByCategory}" var="product">
                            <li>
                                <a href="${ctx}/introduction.html?productId=${product.id}" target="_blank">
                                    <div class="i-pic limit">
                                        <img src="http://image.imooc.com/${product.mainImage}"/>
                                        <p class="title fl">${product.name}</p>
                                        <p class="price fl">
                                            <b>¥</b>
                                            <strong>${product.price}</strong>
                                        </p>
                                        <p class="number fl">
                                            库存<span>${product.stock}</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="search-side">
                    <div style="position: fixed;width: 200px;float: right">
                        <div class="side-title">
                            站长推荐
                        </div>
                        <li>
                            <a href="${ctx}/introduction.html?productId=1" target="_blank">
                                <div class="i-pic check">
                                    <img src="http://image.imooc.com/e3a4737c-f169-401b-8150-214518698036.jpg"/>
                                    <p class="check-title" style="font-size: 10px">西班牙PONS鱼嘴凉鞋女真皮手工平底鞋夏季牛皮沙滩鞋品牌</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="${ctx}/introduction.html?productId=2" target="_blank">
                                <div class="i-pic check">
                                    <img src="http://image.imooc.com/a2a98c92-79ca-4fa7-aae4-1623d0916f52.jpg"/>
                                    <p class="check-title" style="font-size: 10px">现货无补【王小毒】纵野 罗马鱼嘴粗跟绑带高跟凉鞋</p>
                                </div>
                            </a>
                        </li>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <br><br><br/><br><br><br/><br><br><br/><br>
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
                <center><em>© 2017-2027 版权所有.</em></center>
                </p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/basic/js/quick_links.js"></script>
<div class="theme-popover-mask"></div>
</body>
<script type="text/javascript">
    function search_keywords() {
        var search_text = $("#searchInput").val();
        search_text = encodeURI(search_text);
        window.location.href="${ctx}/product/keywords.do?keywords="+search_text;
    }
</script>
</html>
