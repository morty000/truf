<%@ page import="com.ggy.truf.pojo.User" %>
<%@ page import="com.ggy.truf.common.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/backend/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/backend/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/backend/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/backend/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/backend/static/h-ui.admin/css/style.css"/>
    <title>商品管理</title>
    <link rel="stylesheet" href="${ctx }/backend/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i>
    首页
    <span class="c-gray en">&gt;</span>
    产品管理
    <span class="c-gray en">&gt;</span>
    产品列表
    <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px"
       href="" title="刷新">
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">
    <div class="text-c">
        日期范围：
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin"
               class="input-text Wdate" style="width: 120px;">
        -
        <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
               id="logmax" class="input-text Wdate" style="width: 120px;">
        <input type="text" id="search" placeholder=" 产品名称" style="width: 250px" class="input-text">
        <button id="search_btn" class="btn btn-success" type="submit">
            <i class="Hui-iconfont">&#xe665;</i> 搜产品
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="r">共有数据：<strong id="data_count"></strong> 条</span>
    </div>
    <br>
    <div>
        显示商品条目
        <select id="select_count">
            <option value="5">5</option>
            <option value="10" selected="selected">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="30">30</option>
            <option value="50">50</option>
            <option value="100">100</option>
            <option value="total">All</option>
        </select>
        条
    </div>
    <div class="mt-20">
        <table id="product_list" class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="40">ID</th>
                <th width="60">缩略图</th>
                <th width="100">产品名称</th>
                <%--<th>描述</th>--%>
                <th width="100">单价</th>
                <th width="60">发布状态</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <!-- 分页 -->
    <div class="row ">
        <div class="col-md-4 " id="page_info"></div>
        <br>
        <div class="col-md-8 " id="page_nav" style="text-align: right"></div>
    </div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/basic/js/jquery-1.10.1.min.js"></script>
<%--<script type="text/javascript" src="${ctx }/backend/lib/jquery/1.9.1/jquery.min.js"></script>--%>
<script type="text/javascript" src="${ctx }/backend/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx }/backend/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx }/backend/static/h-ui.admin/js/H-ui.admin.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx }/backend/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${ctx }/backend/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx }/backend/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx }/backend/lib/laypage/1.2/laypage.js"></script>

<script type="text/javascript">
    $(function () {
        var total = 10;
        var currentPage = 1;
        $(function () {
            to_page(1, 10);
        })
        
        function to_page(pageNum, pageSize) {
            $.ajax({
                type: "post",
                url: "${ctx}/product/stock_status.do",
                data: {
                    "date": new Date(),
                    "pageNum": pageNum,
                    "pageSize": pageSize,
                    "status": 3
                },
                dataType: "json",
                success: function (result) {
                    total = result.data.total;
                    //填充表格数据
                    build_table_data(result);
                    //分页信息
                    build_page_info(result);
                    //分页导航条
                    build_page_nav(result);
                }
            })
        }

        //填充表格数据
        function build_table_data(result) {
            $("#product_list tbody").empty();
            var products = result.data.list;
            var data_count = result.data.total;
            $("#data_count").text("").append(data_count);
            $.each(products, function (index, item) {
                var id = $("<td></td>").append(item.id);
                var mainImage = $('<td>' +
                    '<a onClick="picture_show(\'' + item.name + '\',\'picture_show.html\',\'' + item.id + '\')" href="javascript:;">' +
                    '<img width="60" class="product-thumb" src="http://image.imooc.com/' + item.mainImage + '">' +
                    '</a>' +
                    '</td>');
                var name = $('<td class="text-l">' +
                    '<a style="text-decoration:none" onClick="product_show(\'' + item.name + '\',\'product_show.html\',\'' + item.id + '\')" href="javascript:;">' + item.name + '</a>' +
                    '</td>');
                var price = $("<td></td>").append(item.price);
                var status = $("<td class='td-status'><span class='label label-defaunt radius'>已删除商品</span></td>");
                $("<tr class='text-c va-m'></tr>").append(id).append(
                    mainImage).append(name).append(price).append(
                    status).appendTo("#product_list tbody");
            })
        }

        //分页信息
        function build_page_info(result) {
            $("#page_info").empty();
            $("#page_info").append(
                "当前" + result.data.pageNum + "页,总"
                + result.data.pages + "页");
            currentPage = result.data.pageNum;
            total = result.data.total;

        }

        //分页导航条
        function build_page_nav(result) {
            $("#page_nav").empty();
            var nav = $('<nav aria-label="Page navigation"></nav>');
            var ul = $('<ul class="pagination"></ul>');
            var firstPageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">首页</a></li>');
            var prePageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#"><span>&laquo;</span></a></li>');
            if (result.data.pageNum != 1) {
                firstPageLi.click(function () {
                    currentPage = 1;
                    to_page(1, result.data.pageSize);
                })
                prePageLi.click(function () {
                    currentPage = result.data.pageNum - 1;
                    to_page(result.data.pageNum - 1, result.data.pageSize)
                })
            }
            ul.append(firstPageLi).append(prePageLi);
            $.each(result.data.navigatepageNums,
                function (index, item) {
                    if (result.data.pageNum == item) {
                        var numLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px" class="active"><a href="#">' + item + '</a></li>');
                    } else {
                        var numLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">' + item + '</a></li>');
                    }
                    numLi.click(function () {
                        currentPage = item;
                        to_page(item, result.data.pageSize);
                    });
                    ul.append(numLi);
                }
            )
            ;
            var lastPageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">末页</a></li>');
            var nextPageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">&raquo;</a></li>');
            if (result.data.pageNum != result.data.pages) {
                nextPageLi.click(function () {
                    currentPage = result.data.pageNum + 1;
                    to_page(currentPage, result.data.pageSize)
                })
                lastPageLi.click(function () {
                    currentPage = result.data.pages;
                    to_page(result.data.pages, result.data.pageSize)
                })
            }
            ul.append(nextPageLi).append(lastPageLi);
            nav.append(ul);
            $("#page_nav").append(nav);
        }

        /*选择显示条目*/
        $("#select_count").change(function () {
            var pageNum = currentPage;
            if ($("#select_count").val() != "total") {
                var pageSize = $("#select_count").val();
            } else {
                var pageSize = total;
            }
            to_page(pageNum, pageSize);
        })

        /*产品-搜索*/
        $("#search_btn").click(function () {
            var startTime = $("#logmin").val();
            var endTime = $("#logmax").val();
            var keywords = $("#search").val();
            if (startTime == "" && endTime == "" && keywords == "") {
                alert("未输入查询条件");
                return false;
            }
            if (startTime == "") {
                startTime = "1970-1-1";
            }
            if (endTime == "") {
                endTime = "2100-12-12";
            }
            $(function () {
                search_btn(1, 10);
            })
            function search_btn(pageNum, pageSize) {
                $.ajax({
                    type: "post",
                    url: "${ctx}/product/time_keywords_status.do",
                    data: {
                        "pageNum": pageNum,
                        "pageSize": pageSize,
                        "startTime": startTime,
                        "endTime": endTime,
                        "keywords": keywords,
                        "status": 3
                    },
                    dataType: "json",
                    success: function (result) {
                        total = result.data.total;
                        //填充表格数据
                        build_table_data(result);
                        //分页信息
                        build_page_info(result);
                        //分页导航条
                        build_page_nav2(result);
                    }
                })
            }

            //分页导航条
            function build_page_nav2(result) {
                $("#page_nav").empty();
                var nav = $('<nav aria-label="Page navigation"></nav>');
                var ul = $('<ul class="pagination"></ul>');
                var firstPageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">首页</a></li>');
                var prePageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#"><span>&laquo;</span></a></li>');
                if (result.data.pageNum != 1) {
                    firstPageLi.click(function () {
                        currentPage = 1;
                        search_btn(1, result.data.pageSize);
                    })
                    prePageLi.click(function () {
                        currentPage = result.data.pageNum - 1;
                        search_btn(result.data.pageNum - 1, result.data.pageSize)
                    })
                }
                ul.append(firstPageLi).append(prePageLi);
                $.each(result.data.navigatepageNums,
                    function (index, item) {
                        if (result.data.pageNum == item) {
                            var numLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px" class="active"><a href="#">' + item + '</a></li>');
                        } else {
                            var numLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">' + item + '</a></li>');
                        }
                        numLi.click(function () {
                            currentPage = item;
                            search_btn(item, result.data.pageSize);
                        });
                        ul.append(numLi);
                    }
                );

                var lastPageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">末页</a></li>');
                var nextPageLi = $('<li style="display: inline; margin-left: 20px; margin-right: 20px; font-size: 20px"><a href="#">&raquo;</a></li>');
                if (result.data.pageNum != result.data.pages) {
                    nextPageLi.click(function () {
                        currentPage = result.data.pageNum + 1;
                        search_btn(currentPage, result.data.pageSize)
                    })
                    lastPageLi.click(function () {
                        currentPage = result.data.pages;
                        search_btn(result.data.pages, result.data.pageSize)
                    })
                }
                ul.append(nextPageLi).append(lastPageLi);
                nav.append(ul);
                $("#page_nav").append(nav);
            }
        })
    })

    /*产品-查看*/
    function product_show(title, url, id) {
        var url = url + "?id=" + id;
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-查看*/
    function picture_show(title, url, id) {
        var url = url + "?id=" + id;
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

</script>
</body>
</html>