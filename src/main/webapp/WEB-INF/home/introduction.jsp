<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/22
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>商品页面</title>
    <link href="${ctx}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" href="${ctx}/css/optstyle.css" rel="stylesheet"/>
    <link type="text/css" href="${ctx}/css/style.css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${ctx}/basic/js/quick_links.js"></script>
    <script type="text/javascript" src="${ctx}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="${ctx}/js/list.js"></script>
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
<b class="line"></b>
<div class="listMain">
    <!--分类-->
    <div class="nav-table">
        <a href="${ctx}/home.html">
            <div class="long-title"><span class="all-goods"> 商城首页 </span></div>
        </a>
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li><a href="${ctx}/home.html">首页</a></li>
        <li><a href="${ctx}/search.html?categoryId=${sessionScope.product_introduction.categoryId}">分类</a></li>
        <li class="am-active">内容</li>
    </ol>
    <script type="text/javascript">
        $(function () {
        });
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>
    <div class="scoll">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <img src="http://image.imooc.com/${sessionScope.product_introduction.mainImage}" title="pic"/>
                    </li>
                    <c:forEach items="${sessionScope.product_introduction.subImages}" var="image">
                        <c:if test="${sessionScope.product_introduction.mainImage != image}">
                            <li>
                                <img src="http://image.imooc.com/${image}"/>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </section>
    </div>
    <!--放大镜-->
    <div class="item-inform">
        <div class="clearfixLeft" id="clearcontent">
            <div class="box">
                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".jqzoom").imagezoom();
                        $("#thumblist li a").click(function () {
                            $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                            $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                            $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                        });
                    });
                </script>
                <div class="tb-booth tb-pic tb-s310">
                    <a href="http://image.imooc.com/${sessionScope.product_introduction.mainImage}"><img
                            src="http://image.imooc.com/${sessionScope.product_introduction.mainImage}" alt="细节展示放大镜特效"
                            rel="http://image.imooc.com/${sessionScope.product_introduction.mainImage}" class="jqzoom"/></a>
                </div>
                <ul class="tb-thumb" id="thumblist">
                    <li class="tb-selected">
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="http://image.imooc.com/${sessionScope.product_introduction.mainImage}"
                                             mid="http://image.imooc.com/${sessionScope.product_introduction.mainImage}"
                                             big="http://image.imooc.com/${sessionScope.product_introduction.mainImage}"></a>
                        </div>
                    </li>
                    <c:forEach items="${sessionScope.product_introduction.subImages}" var="img" begin="0" end="4">
                        <c:if test="${sessionScope.product_introduction.mainImage != img}">
                            <li>
                                <div class="tb-pic tb-s40">
                                    <a href="#"><img src="http://image.imooc.com/${img}"
                                                     mid="http://image.imooc.com/${img}"
                                                     big="http://image.imooc.com/${img}"></a>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </div>

        <div class="clearfixRight">
            <!--规格属性-->
            <!--名称-->
            <div class="tb-detail-hd">
                <h1>
                    ${sessionScope.product_introduction.name}
                </h1>
            </div>
            <div class="tb-detail-list">
                <!--价格-->
                <div class="tb-detail-price">
                    <li class="price iteminfo_price">
                        <dt>促销价</dt>
                        <dd><em>¥</em><b class="sys_item_price">${sessionScope.product_introduction.price}</b></dd>
                    </li>
                    <li class="price iteminfo_mktprice">
                        <dt>原价</dt>
                        <dd><em>¥</em><b class="sys_item_mktprice">${sessionScope.product_introduction.price}</b></dd>
                    </li>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <br>
                <div class="clear"></div>

                <!--各种规格-->
                <dl class="iteminfo_parameter sys_item_specpara">
                    <dt class="theme-login">
                    <div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div>
                    </dt>
                    <dd>
                        <!--操作页面-->
                        <div class="theme-popover-mask"></div>
                        <div class="theme-popover">
                            <div class="theme-span"></div>
                            <div class="theme-poptit">
                                <a href="javascript:;" title="关闭" class="close">×</a>
                            </div>
                            <div class="theme-popbod dform">
                                <form class="theme-signin" name="loginform" action="" method="post">
                                    <div class="theme-signin-left">
                                        <div class="theme-options">
                                            <div class="cart-title">尺码</div>
                                            <ul>
                                                <li class="sku-line selected">均码<i></i></li>
                                            </ul>
                                        </div>
                                        <div class="theme-options">
                                            <div class="cart-title number">数量</div>
                    <dd>
                        <input id="min" class="am-btn am-btn-default" name="" type="button" value="-"/>
                        <input id="text_box" name="" type="text" value="1" style="width:30px;"/>
                        <input id="add" class="am-btn am-btn-default" name="" type="button" value="+"/>
                        <span id="Stock" class="tb-hidden">库存<span
                                class="stock">${sessionScope.product_introduction.stock}</span>件</span>
                    </dd>
            </div>
            <div class="clear"></div>
        </div>
        </form>
    </div>
</div>
</dd>
</dl>
<div class="clear"></div>
</div>
<div class="pay">
    <li>
        <div class="clearfix tb-btn tb-btn-buy theme-login">
            <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>
        </div>
    </li>
    <li>
        <div class="clearfix tb-btn tb-btn-basket theme-login">
            <a id="LikBasket" title="加入购物车" href="#"><i></i>加入购物车</a>
        </div>
    </li>
</div>
</div>
<div class="clear"></div>
</div>
<div class="clear"></div>
<!-- introduce-->
<div class="introduce">
    <div class="browse">
        <div class="mc">
            <ul>
                <div class="mt">
                    <h2>历史浏览</h2>
                </div>
                <c:forEach items="${sessionScope.history_products}" var="history_products">
                    <li>
                        <div class="p-img">
                            <a href="${ctx}/introduction.html?productId=${history_products.id}"> <img class="" src="http://image.imooc.com/${history_products.mainImage}"> </a>
                        </div>
                        <div class="p-name"><a href="${ctx}/introduction.html?productId=${history_products.id}">
                            ${history_products.name}
                        </a>
                        </div>
                        <div class="p-price"><strong>￥${history_products.price}</strong></div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="introduceMain">
        <div class="am-tabs" data-am-tabs>
            <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active">
                    <a href="#">
                        <span class="index-needs-dt-txt">宝贝详情</span></a>
                </li>
                <li>
                    <a href="#">
                        <span class="index-needs-dt-txt">猜你喜欢</span></a>
                </li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active">
                    <div class="J_Brand">
                        <div class="attr-list-hd tm-clear">
                            <h4>产品参数：</h4></div>
                        <div class="clear"></div>
                        <ul id="J_AttrUL">
                            <li title="">产品类型:&nbsp;${sessionScope.categoryName}</li>
                            <li title="">原料产地:&nbsp;${sessionScope.StringArray[0]}</li>
                            <li title="">材质:&nbsp;${sessionScope.StringArray[1]}</li>
                            <li title="">所属供应商:&nbsp;${sessionScope.StringArray[2]}</li>
                            <li title="">商品尺码:&nbsp;${sessionScope.StringArray[3]}</li>
                            <li title=""></li>
                            <li title="">商品摘要:&nbsp;${sessionScope.StringArray[4]}</li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                    <div class="details">
                        <div class="attr-list-hd after-market-hd">
                            <h4>商品细节</h4>
                        </div>
                        <div class="twlistNews">
                            <c:forEach items="${sessionScope.product_introduction.subImages}" var="image">
                                <img src="http://image.imooc.com/${image}"/>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="am-tab-panel am-fade">
                    <div class="like">
                        <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                            <c:forEach items="${sessionScope.searchProductByCategory}" var="product">
                                <li>
                                    <a href="${ctx}/introduction.html?productId=${product.id}">
                                        <div class="i-pic limit">
                                            <img src="http://image.imooc.com/${product.mainImage}"/>
                                            <p>${product.name}</p>
                                            <p class="price fl">
                                                <b>¥</b>
                                                <strong>${product.price}</strong>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
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
