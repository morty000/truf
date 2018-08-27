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
                <input type="text" value="${sessionScope.product.name}" class="input-text" placeholder=" 请输入商品标题"
                       id="1"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="categoryId" class="select" id="2">
					<option value="7">请选择类别</option>
					<option value="7">一级分类</option>
                    <option value="7">├二级分类1</option>
					<option value="7">├二级分类2</option>
					<option value="7">├二级分类3</option>
				</select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产地：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${sessionScope.StringArray[0]}" id="3" placeholder=" 请输入商品生产地"
                       class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">材质：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${sessionScope.StringArray[1]}" id="4" placeholder=" 请输入商品材质"
                       class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">所属供应商：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${sessionScope.StringArray[2]}" id="5" placeholder=" 请输入供应商"
                       class="input-text">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商品尺码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${sessionScope.StringArray[3]}" id="6" placeholder=" 请输入商品尺码"
                       class="input-text" style="width:90%">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品展示价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${sessionScope.product.price}" id="7" placeholder=" 请输入商品价格"
                       class="input-text"
                       style="width:90%">
                元
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">库存：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${sessionScope.product.stock}" id="8" placeholder=" 请输入商品库存"
                       class="input-text"
                       style="width:90%">
                件
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">产品摘要：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="9" class="textarea" placeholder="说点什么...最少输入10个字符"
                          datatype="*10-100"
                          dragonfly="true" nullmsg="备注不能为空！">${sessionScope.StringArray[4]}</textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button class="btn btn-primary radius" type="submit" id="btn">
                    <i class="Hui-iconfont">&#xe632;</i> 保存并提交
                </button>
                <button onClick="layer_close();" class="btn btn-default radius" type="button">
                    &nbsp;&nbsp;取消&nbsp;&nbsp;
                </button>
            </div>
        </div>
    </form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/basic/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#btn").click(function () {
            if (confirm("是否修改商品内容")) {
                var id = $("#0").val();
                var name = $("#1").val();
                var categoryId = $("#2").val();
                var detail = $("#3").val() + ":::" + $("#4").val() + ":::" + $("#5").val() + ":::" + $("#6").val() + ":::" + $("#9").val();
                var price = $("#7").val();
                var stock = $("#8").val();
                $.ajax({
                    type: "post",
                    url: "${ctx}/product/save.do",
                    data: {
                        "date": new Date(),
                        "id": id,
                        "name": name,
                        "categoryId": categoryId,
                        "detail": detail,
                        "price": price,
                        "stock": stock
                    },
                    dataType: "json",
                    success: function (result) {
                        alert(result.msg);
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    }
                })
            }
        })
    })
</script>

</body>
</html>
