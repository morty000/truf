<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/18
  Time: 6:14
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

    <title>图片展示</title>
    <link href="${ctx}/backend/lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图片管理 <span
        class="c-gray en">&gt;</span> 图片展示 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="edit()" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe6df;</i>
                设置主图
            </a>
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i>
                批量删除
            </a>
        </span>
    </div>
    <div class="portfolio-content">
        <ul class="cl portfolio-area">
            <input type="hidden" id="picture_show_id_1" value="${sessionScope.product.id}">
            <input type="hidden" id="picture_show_img" value="${sessionScope.product.subImages}">
            <input type="hidden" id="picture_show_main_img" value="${sessionScope.mainImage}">
            <c:forEach items="${sessionScope.imgs}" var="img" varStatus="index">
                <c:if test="${sessionScope.mainImage == img}">
                    <li class="item">
                        <div class="portfoliobox" style="background-color: #00a2d4">
                            <input class="checkbox" name="" type="checkbox" value="">
                            <input type="hidden" value="${img}">
                            <div class="picbox"><a onClick="picture_show()" href="javascript:;" data-lightbox="gallery"
                                                   data-title="图片${index.index + 1}"><img
                                    src="http://image.imooc.com/${img}"></a></div>
                            <div class="textbox">图片${index.index + 1}</div>
                        </div>
                    </li>
                </c:if>
                <c:if test="${sessionScope.mainImage != img}">
                    <li class="item">
                        <div class="portfoliobox">
                            <input class="checkbox" name="" type="checkbox" value="">
                            <input type="hidden" value="${img}">
                            <div class="picbox"><a onClick="picture_show()" href="javascript:;" data-lightbox="gallery"
                                                   data-title="图片${index.index + 1}"><img
                                    src="http://image.imooc.com/${img}"></a></div>
                            <div class="textbox">图片${index.index + 1}</div>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/backend/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/backend/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/backend/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/backend/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/backend/lib/lightbox2/2.8.1/js/lightbox.min.js"></script>
<script type="text/javascript">

    /*显示图片*/
    $(function () {
        $(".portfolio-area li").Huihover();
    });

    /*设置主图*/
    function edit() {
        if ($(".portfoliobox input:checked").length == 1) {
            var id = $("#picture_show_id_1").val();
            var checkedImage = $(".portfoliobox input:checked").parent("div").find("input:eq(1)").val();
            $.ajax({
                type: "post",
                url: "${ctx}/product/save_main_image.do",
                data: {
                    "id": id,
                    "mainImage": checkedImage
                },
                dataType: "json",
                success: function (result) {
                    alert("设置主图成功");
                    window.location.href = "";
                }
            })
        } else {
            alert("只能设置一张主图");
        }
    }

    /*批量删除*/
    function datadel() {
        if ($(".portfoliobox input:checked").length == 0) {
            alert("未选中图片");
        } else {
            if (confirm("确认要删除吗")){
                var id = $("#picture_show_id_1").val();
                var imgs;
                var main_img = $("#picture_show_main_img").val();
                var img;
                $.each($(".portfoliobox input:checked"), function (index, item) {
                    img = $(this).parent("div").find("input:eq(1)").val();
                    if (img == main_img) {
                        alert("不能删除主图，请重新设置主图后再删除该图片");
                        return false;
                    }
                    imgs += img + ",";
                })
                $.ajax({
                    type: "post",
                    url: "${ctx}/product/del_img.do",
                    data: {
                        "id":id,
                        "subImages": imgs
                    },
                    dataType: "json",
                    success: function (result) {
                        alert("删除成功!");
                        window.location.href = "";
                    }
                })
            }
        }
    }
</script>
</body>
</html>
