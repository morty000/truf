<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/13
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>激活状态</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <script type="text/javascript" src="${ctx }/js/jquery-1.10.1.min.js"></script>

    <link rel="stylesheet" href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="${ctx }/css/dlstyle.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="login-boxtitle">
    <a href="home.html"><img alt="logo" src="${ctx }/images/logo.png"/></a>
</div>

<div class="login-banner">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="${ctx }/images/big.jpg"/></div>
        <div class="login-box">

            <h3 class="title">激活状态</h3>

            <div class="clear"></div>

            <h4 id="h4">
                <span>${sessionScope.message}</span>
            </h4>
        </div>
    </div>
</div>

<div class="footer ">
    <div class="footer-hd ">
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
    <div class="footer-bd ">
        <p>
        <center><em>© 2017-2027 版权所有.</em></center>
        </p>
    </div>
</div>
</body>
</html>