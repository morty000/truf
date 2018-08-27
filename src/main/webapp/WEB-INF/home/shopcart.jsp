<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购物车页面</title>
    <link href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
          type="text/css"/>
    <link href="${ctx }/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/css/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/css/optstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/cart/page/index.css" rel="stylesheet" type="text/css"/>
    <%--<script type="text/javascript" src="${ctx }/cart/page/index.js"></script>--%>
    <script type="text/javascript" src="${ctx }/js/jquery.js"></script>
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
                <a href="#" target="_top">
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
                <a href="person.html" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
            </div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd">
                <a id="mc-menu-hd" href="shopcart.html" target="_top"><i
                        class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车(1)</span><strong
                        id="J_MiniCartNum" class="h"></strong></a>
            </div>
        </div>
    </ul>
    <div class="topMessage favorite">
    </div>

    <!--悬浮搜索框-->
    <br/>
        <br/>
    <div class="nav white">
        <%--<div class="logo">
            <img src="${ctx }/images/logo.png"/>
        </div>--%>
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

    <!--购物车 -->
        <div class="page-wrap w">
            <div class="cart-header">
                <table class="cart-table">
                    <tr>
                        <th class="cart-cell cell-check">
                            <label class="cart-label">

                                <input type="checkbox" class="cart-select-all"/>
                                <span>全选</span>
                            </label>
                        </th>
                        <th class="cart-cell cell-info">商品信息</th>
                        <th class="cart-cell cell-price">单价</th>
                        <th class="cart-cell cell-count">数量</th>
                        <th class="cart-cell cell-total">合计</th>
                        <th class="cart-cell cell-opera">操作</th>
                    </tr>
                </table>
            </div>
            <div class="cart-list">
                <table class="cart-table" id="cart_list">
                    <tbody></tbody>
                    <%--<tr>
                        <td class="cart-cell cell-check">
                            <label class="cart-label">
                                <input type="checkbox" class="cart-select"/>
                            </label>
                        </td>
                        <td class="cart-cell cell-img">
                            <img class="p-img" src="${ctx}/images/kouhong.jpg_80x80.jpg" >

                        </td>
                        <td class="cart-cell cell-info">
                            <a class="link" href="./detail.html?productId= ">
                                商品信息</a>
                        </td>
                        <td class="cart-cell cell-price" id="td_price"></td>
                        <td class="cart-cell cell-count">
                            <span class="count-btn" minus>-</span>
                            <input class="count-input" value="100">
                            <span class="count-btn" plus>+</span>
                        </td>
                        <td class="cart-cell cell-total">￥200</td>
                        <td class="cart-cell cell-opera">删除
                            <span class="link cart-delete"></span>
                        </td>
                    </tr>--%>
                </table>
            </div>
            <div class="cart-footer">
                <div class="select-con">
                    <label>
                        <input type="checkbox" class="cart-select-all" />
                        <span>全选</span>
                    </label>
                </div>
                <div class="delete-con">
                        <span class="link delete-selected">
                            <i class="fa fa-trash-o"></i>
                            <span>删除选中</span>
                        </span>
                </div>
                <div class="submit-con">
                    <span>总价：</span>
                    <span class="submit-total">￥200</span>
                    <div class="btn-area">
                        <span class="btn btn-submit">去结算</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-hd">
                <p>
                    <a href="#">硅谷云科技</a> <b>|</b> <a href="home.html">商城首页</a> <b>|</b> <a
                        href="#">支付宝</a> <b>|</b>
                </p>
            </div>
            <div class="footer-bd">
                <p>
                    <a href="#">关于硅谷云</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a>
                    <a href="#">网站地图</a> <em>© 2017-2025 guiguyun.com 版权所有. </em>
                </p>
            </div>
        </div>
</body>
<script type="text/javascript">
    function search_keywords() {
        var search_text = $("#searchInput").val();
        search_text = encodeURI(search_text);
        window.location.href="${ctx}/product/keywords.do?keywords="+search_text;
    }

    $(function(){
        $.ajax({
            type : "post",
            url: "${ctx}/cart/list.do",
            data: {
                "date": new Date()
            },
            dataType:"json",
            success:function(result){
                $.each(result.data.cartProductVoList, function(index, item){
                    var checkedId = $("<td class='cart-cell cell-check'>" +
                                            "<input type='checkbox' class='cart-cell cell-check'>" +
                                       "</td>");
                    var productMainImage = $('<td class="cart-cell cell-img">' +
                                                '<img class="p-img" src="" >' +
                                             '</td>');
                    var productName = $('<td class="cart-cell cell-info"><a class="link" href=""> ' + item.productName + ' </a></td>');
                    var productPrice = $("<td class='cart-cell cell-price'></td>").append(item.productPrice);
                    var quantity = $("<td class='cart-cell cell-count'></td>").append(item.quantity);
                    var productTotalPrice = $("<td class='cart-cell cell-total'></td>").append(item.productTotalPrice);
                    var edit = $("<td class='cart-cell cell-opera'><a style='text-decoration: none'>删除</a></td>");
                    $("<tr ></tr>").append(checkedId).append(productMainImage).append(productName).append(productPrice).append(
                            quantity).append(productTotalPrice).append(edit).appendTo("#cart_list tbody");
                })
            }

        })
    })
</script>
</html>