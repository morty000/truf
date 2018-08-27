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
<title>分类管理</title>
</head>
<body>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 资讯管理 <span class="c-gray en">&gt;</span>
	资讯列表 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
			<span class="select-box inline"> <select name=""
				class="select">
					<option value="0">全部分类</option>
					<option value="1">分类一</option>
					<option value="2">分类二</option>
			</select>
			</span> 日期范围： <input type="text"
				onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
				id="logmin" class="input-text Wdate" style="width: 120px;">
			- <input type="text"
				onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
				id="logmax" class="input-text Wdate" style="width: 120px;">
			<input type="text" name="" id="" placeholder=" 资讯名称"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> 搜资讯
			</button>
		</div>

		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l">
				<button type="button" class="btn btn-primary" id="emp_add_modal_btn" >
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					添加分类
				</button>
				
				<button class="btn btn-danger" id="emp_delete_btn">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					删除
				</button>
				</span> 		
		</div>
		
		<!-- 模态框（Modal） -->
<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" 
aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加分类
				</h4>
			</div>
			<div class="modal-body">
			
			<!-- <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
			<span class="c-red">
			*</span>上级分类</label>
			<select name="" class="select col-xs-4 col-sm-3">
			<option value="0">添加分类名称</option>
			</select>
			</div> -->
			
			<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">
		<span class="c-red">*</span>父ID</label>
			<input type="text" class="input-text" style="width:150px;height:23px"  id="prentId" name="prentId">
	</div>
		
			<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">
		<span class="c-red">*</span>分类名称</label>
			<input type="text" class="input-text" style="width:150px;height:23px"  id="name" name="name">
	</div>
			     
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div>
	</div>
</div>
		
		
		
		
		
		<div class="mt-20">
			<table
				class="table table-hover">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="80">ID</th>
						<th width="90">标题</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody class="apleth">
					<tr class="text-c">
						<td></td>
						<!-- <td class="f-14 td-manage"> <a
							style="text-decoration: none" class="ml-5"
							onClick="article_edit('资讯编辑','article-add.html','10001')"
							href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a style="text-decoration: none" class="ml-5"
							onClick="article_del(this,'10001')" href="javascript:;"
							title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td> -->
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${ctx }/backend/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctx }/backend/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${ctx }/backend/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${ctx }/backend/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="../../backend/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="../../backend/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="../../backend/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	
	
	//添加
	$("#emp_add_modal_btn").click(function() {
		
		var categoryId = $("#prientId").val();
		var categoryName = $("#name").val();
		$.ajax({
			type:"post",
			url:"${ctx}/category/add_category.do",
			data:{
				"date" : new date,
				"categoryName" :categoryName,
				"categoryId" : categoryId,
			},
			dataType:"json",
			success:function(result) {
				
			}
		})
		//模态框的显示
		$('#emp_add_modal').modal({
			backdrop : "static"
		});
	})
	//更新
	function update_category(){
		$.ajax({
			type:"",
			url:"",
			data:{
				
			}
		})
	}
	
	$(function () {
		$(".apleth td").click(function(){
			var prientId = $("#priendId").val();
			$.ajax({
				type:"post",
				url:"${ctx}/get_category.do",
				data:{
					"categoryId":categoryId,
				}
			})
		})
	})
		
	//删除
	function delete_category(){
		$.ajax({
			type:"post",
			url:"${ctx}",
			data:{
				
			}
		})
	}
		
		
		
	</script>
</body>


</html>