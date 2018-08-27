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
    <title>登录</title>
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

            <h3 class="title">登录商城</h3>

            <div class="clear"></div>

            <div class="login-form">
                <form>
                    <div class="user-name">
                        <label for="user"><i class="am-icon-user"></i></label>
                        <input type="text" name="username" id="user" placeholder="用户名">
                    </div>
                    <div class="user-pass">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name="password" id="password" placeholder="请输入密码">
                    </div>
                </form>
            </div>
            <span id="message_span" style="font-size: 14px;color:red"></span>
            <div class="login-links">
                <a href="forgetpwd.html" class="am-fr">忘记密码</a>
                <a href="register.html" class="zcnext am-fr am-btn-default">注册</a>
                <br/>
            </div>
            <div class="am-cf">
                <input type="submit" value="登 录" class="am-btn am-btn-primary am-btn-sm">
            </div>
            <div class="partner">
                <h3>合作账号</h3>
                <div class="am-btn-group">
                    <li><a href="" class="qqclass"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
                    <li><a href="" class="weiboclass"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a>
                    </li>
                    <li><a href="" class="weixinclass"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a>
                    </li>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer ">
    <div class="footer-hd ">
        <p>
            <a href="http://xiamen0213958.11467.com/" target="_blank">硅谷云科技</a>
            <b>|</b>
            <a href="home.html">商城首页</a>
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
<script type="text/javascript">
jQuery(function () {
    jQuery(".am-cf input").click(function () {
        var username = jQuery("#user").val();
        var password = jQuery("#password").val();
        jQuery.ajax({
            type: "post",
            url: "${ctx}/user/login.do",
            data: {
                "date": new Date(),
                "username": username,
                "password": password
            },
            dataType: "json",
            success: function (result) {
                if (username == "") {
                    jQuery("#message_span").text("用户名不能为空");
                    return false;
                }
                if (password == "") {
                    jQuery("#message_span").text("密码不能为空");
                    return false;
                }
                if (result.msg != "登录成功") {
                    jQuery("#message_span").text(result.msg);
                    return false;
                } else if (result.msg == "登录成功") {
                    jQuery("#message_span").text("");
                    window.location.href = "home.html";
                }
            }
        })
    })
        jQuery("#user").change(function () {
            jQuery("#message_span").text("");
        })
        jQuery("#password").change(function () {
            jQuery("#message_span").text("");
        })
        jQuery(".qqclass").click(function () {
            alert("抱歉，QQ登录功能暂未开放")
        })
        jQuery(".weiboclass").click(function () {
            alert("抱歉，微博登录功能暂未开放")
        })
        jQuery(".weixinclass").click(function () {
            alert("抱歉，微信登录功能暂未开放")
        })
    })
</script>

</html>