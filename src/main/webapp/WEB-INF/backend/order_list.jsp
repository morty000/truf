<%@page import="com.ggy.truf.common.Const"%>
<%@page import="com.ggy.truf.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/backend/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/backend/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/backend/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/backend/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/backend/static/h-ui.admin/css/style.css" />

<title>订单管理</title>

</head>
<body>
<%
    User user = new User();
    user.setUsername("admin");
    user.setPassword("admin");
    user.setName("听风写雨");
    user.setRole(1);
    user.setPhone("18750282073");
    user.setEmail("595248862@qq.com");
    session.setAttribute(Const.CURRENT_USER, user);
%>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span>
	订单列表 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			日期范围： <input type="text"
				onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })"
				id="datemin" class="input-text Wdate" style="width: 120px;">
			- <input type="text"
				onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })"
				id="datemax" class="input-text Wdate" style="width: 120px;">
			<input type="text" class="input-text" style="width: 250px"
				placeholder="输入订单号" id="" name="">
			<button type="submit" class="btn btn-success radius" id="" name="">
				<i class="Hui-iconfont">&#xe665;</i> 搜订单
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;"
				onclick=" "
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					未付款</a> <a href="javascript:;"
				onclick=" "
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					已付款</a>
					<a href="javascript:;"
				onclick=" "
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					未发货</a>
					<a href="javascript:;"
				onclick=" "
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					已发货</a>
					 <a href="javascript:;"
				onclick="  "
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					交易成功</a></span> <span class="r">共有数据：<strong>88</strong> 条
			</span>
		</div>
		<div class="mt-20">
			<table id="order_list"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="check_all" id="check_all"></th>
						<th width="40">ID</th>
						<th width="120">订单号</th>
						<th width="100">订单金额</th>
						<th width="50">支付类型</th>
						<th width="50">运费</th>
						<th width="50">状态</th>
						<th width="130">支付时间</th>
						<th width="130">发货时间</th>
						<th width="130">交易完成时间</th>
						<th width="130">交易关闭时间</th>
						<th width="130">创建时间</th>
						<th width="130">更新时间</th>
						<th width="40">操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 分页 -->
		<div class="row ">
			<div class="col-md-4 " id="page_info"></div>
			<div class="col-md-8 " id="page_nav"></div>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="${ctx }/backend/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/backend/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${ctx }/backend/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="${ctx }/backend/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="${ctx }/backend/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript" src="${ctx }/backend/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx }/backend/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${ctx }/backend/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	$(function () {
        var pageNum = $().val();
        var pageSize = $().val();
        $.ajax({
            type: "GET",
            url: "${ctx}/order/mlist.do",
            data: {
                "date": new Date(),
                "pageNum": pageNum,
                "pageSize": pageSize
            },
            dataType: "json",
            success: function (result) {
                //填充表格数据
                build_table_data(result);
                //分页信息
                //build_page_info(result);
                //分页导航条
                //build_page_nav(result);
            }
        })

	function build_table_data(result) {
		$("#order_list tbody").empty();
		var orders = result.data.list;
		var data_count = result.data.total;
		$("#data_count").append(data_count);
			$.each(orders,function(index, item) {
							var checkboxTd = $("<td><input type='checkbox' class='check_item'/></td>");
							//构建td节点
							var idTd = $("<td></td>").append(item.id);
							var orderNoTd = $("<td></td>").append(
									item.orderNo);
							var paymentTd = $("<td></td>").append(
									item.payment);
							var paymentTypeTd = $("<td></td>").append(
									item.paymentType);
							var postageTd = $("<td></td>").append(
									item.postage);
							var statusTd = $("<td></td>").append(
									item.status);
							var paymentTimeTd = $("<td></td>").append(
									item.paymentTime);
							var sendTimeTd = $("<td></td>").append(
									item.sendTime);
							var endTimeTd = $("<td></td>").append(
									item.endTime);
							var closeTimeTd = $("<td></td>").append(
									item.closeTime);
							var createTimeTd = $("<td></td>").append(
									item.createTime);
							var btntd = $("<button></button>")
									.addClass("btn btn-primary btn-sm")
									.append("<span></span>")
									.addClass(
											"glyphicon glyphicon-pencil update-btn")
									.append("订单详情");
						
						});
        }
	})
        
	</script>
</body>
</html>