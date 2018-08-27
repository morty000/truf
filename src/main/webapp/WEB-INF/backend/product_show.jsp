<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/15
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="Bookmark" href="/favicon.ico">
    <link rel="Shortcut Icon" href="/favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx}/backend/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx}/backend/lib/respond.min.js"></script>

    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${ctx}/backend/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/backend/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/backend/lib/Hui-iconfont/1.0.8/iconfont.css"/>

    <link rel="stylesheet" type="text/css" href="${ctx}/backend/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/backend/static/h-ui.admin/css/style.css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="${ctx}/backend/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <link href="${ctx}/backend/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page-container">
    <form class="form form-horizontal" id="form-article-add">
        <input type="hidden" value="${sessionScope.product.id}" id="0">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.product.name}</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.product.categoryId}</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产地：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.StringArray[0]}</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">材质：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.StringArray[1]}</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">所属供应商：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.StringArray[2]}</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商品尺码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.StringArray[3]}</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品展示价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.product.price}</span>
                元
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">库存：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.product.stock}</span>
                件
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品摘要：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span>${sessionScope.StringArray[4]}</span>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="layer_close();" class="btn btn-default radius" type="button">
                    &nbsp;&nbsp;返回&nbsp;&nbsp;
                </button>
            </div>
        </div>
    </form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/basic/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
    /*取消按钮*/
    function layer_close() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>

</body>
</html>
