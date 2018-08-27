<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/13
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${ctx }/AmazeUI-2.4.2/assets/css/amazeui.min.css"/>
    <link href="${ctx }/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="${ctx }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${ctx }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>
<body>
<div class="login-boxtitle">
    <a href="home.html"><img alt="" src="${ctx }/images/logo.png"/></a>
</div>
<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="${ctx }/images/big.jpg"/></div>
        <div class="login-box">
            <h3 class="title">用户注册</h3>
            <div class="am-tabs" id="doc-my-tabs">
                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-active">
                        <form method="post">
                            <div class="user-name">
                                <label for="user"><i class="am-icon-user"></i></label>
                                <input type="text" name="username" id="user" placeholder="用户名">
                            </div>
                            <div class="user-email">
                                <label for="email"><i class="am-icon-envelope-o"></i></label>
                                <input type="email" name="email" id="email" placeholder="请输入邮箱账号">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="passwordRepeat" id="passwordRepeat" placeholder="确认密码">
                            </div>
                            <span id="message_span" style="font-size: 14px;color:red"></span>
                        </form>
                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                        </div>
                         <div class="partner">
                         	<ul>
								<a href="login.html">&lt;已有账号登录</a>
							</ul>
                         </div>
                       
                    </div>
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
    $(function () {
        $(".am-cf input").click(function () {
            var username = $("#user").val();
            var email = $("#email").val();
            var password = $("#password").val();
            var passwordRe = $("#passwordRepeat").val();
            if (username == "") {
                $("#message_span").text("用户名不能为空");
                return false;
            }
            if (email == "") {
                $("#message_span").text("邮箱不能为空");
                return false;
            }
            if (password == "") {
                $("#message_span").text("密码不能为空");
                return false;
            }
            if (passwordRe == "") {
                $("#message_span").text("确认密码不能为空");
                return false;
            }
            if (password != passwordRe) {
                $("#message_span").text("两次输入的密码不匹配");
                return false;
            }
            if (!$("#reader-me").is(":checked")) {
                $("#message_span").text("请勾选商城《服务协议》");
                return false;
            }
            $.ajax({
                type: "post",
                url: "${ctx}/user/register.do",
                dataType:"json",
                data: {
                    "date": new Date(),
                    "username": username,
                    "email": email,
                    "password": password
                },
                success: function (result) {
                    if (result.msg != "注册成功") {
                        $("#message_span").text(result.msg);
                        return false;
                    } else {
                        if (confirm(result.msg)) {
                            window.location.href = "login.html";
                        } else {
                            return false;
                        }
                    }
                }
            })
        })
        $("#user").change(function () {
            $("#message_span").text("");
        })
        $("#email").change(function () {
            $("#message_span").text("");
        })
        $("#password").change(function () {
            $("#message_span").text("");
        })
        $("#passwordRepeat").change(function () {
            $("#message_span").text("");
        })
        $("#reader-me").click(function () {
            $("#message_span").text("");
        })
    })
</script>
</html>
