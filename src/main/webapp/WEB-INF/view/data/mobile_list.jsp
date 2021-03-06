<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/common/common.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="${keywords}">
<meta http-equiv="description" content="">
<%@include file="/WEB-INF/view/common/head_css.jsp"%>
<%@include file="/WEB-INF/view/common/head_css_startbootstrap.jsp"%>
<%@include file="/WEB-INF/view/common/head_css_morris.jsp"%>
<%@include file="/WEB-INF/view/common/head_css_treeview.jsp"%>
<%@include file="/WEB-INF/view/common/head_css_datatables.jsp"%>
<%@include file="/WEB-INF/view/common/head_css_fav.jsp"%>
<title>资料下载</title>
</head>
<body>
	<div id="wrapper">
		<%--<jsp:include page="/menu.html"></jsp:include>--%>
		<div id="page-wrapper">
			<nav class="navbar navbar-default" role="navigation">
				<div class="container-fluid">
					<%--<div class="collapse navbar-collapse" id="top-navbar-collapse">--%>
						<form class="navbar-form navbar-left" id="searchForm"
							role="search" action="<c:url value='/fileData/list.html'/>"
							method="GET">
							<div class="form-group">
								<label class="">资料名字</label> <input type="text"
									value="${parameter.entity.name}" name="entity.name" id="name"
									autofocus class="typeahead form-control" placeholder="资料名字">

								<button type="submit" class="btn btn-primary" id="search" >
									<span class="glyphicon glyphicon-search searchBtn"></span>&nbsp;查询
								</button>
							</div>
						</form>
						<%--<c:if test="${user.admin}">--%>
							<%--<ul class="nav navbar-nav navbar-right">--%>
								<%--<li><button type="button" class="btn btn-primary navbar-btn addBtn">--%>
								<%--<li class="fa fa-plus-square fa-fw"></li>新增资料--%>
								<%--</button></li>--%>
							<%--</ul>--%>
						<%--</c:if>--%>

					<%--</div>--%>
				</div>
			</nav>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="table-responsive">
						<table
							class="table table-striped table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<%--<th>选择</th>--%>
									<th>资料</th>
									<th>资料链接</th>
									<th>密码</th>
								</tr>
							</thead>
							<tbody id="dataList">
								<c:forEach items="${datas}" var="l">
									<tr data-row="${l.id}">
										<td>${l.name}</td>
										<td><a target="_blank" href="">${l.url}</a></td>
										<td>${l.paw}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<jsp:include page="/WEB-INF/view/common/pager.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".addBtn").click(
					function(e) {
						e.preventDefault();
						e.stopPropagation();
						$("#myModal").load(
								"<c:url value='/fileData/edit.html'/>",
								function(e) {
									$('#myModal').modal({
										backdrop : "static"
									});
								});
					});
			$(".editBtn").click(function(e){
				e.preventDefault();
				e.stopPropagation();
				$("#myModal").load($(this).attr("href"),function(e) {
							$('#myModal').modal({
								backdrop : "static"
							});
						});
			});
			$(".goodsBtn").click(function(e){
				e.preventDefault();
				e.stopPropagation();
				$("#myModal").load($(this).attr("href"),function(e) {
							$("#myModal").modal({
								backdrop : "static"
							});
						});
			});
			$("#dataList a.ajaxLink").click(function(e){
				e.preventDefault();
				var method="POST";
				if($(this).attr("data-role")){
					if(!window.confirm("删除将无法恢复数据,是否继续?")){
						return false;
					}
					method="DELETE";
				}
				var url=$(this).attr("href");
				$.ajax({url:url,method:method,complete:function(xhr,ts){
					if(xhr.status>=200 && xhr.status<300){
						$("#winBody").empty().html("操作成功");
						$("#winModal").modal({backdrop:"static",show:true});
						$("#search").click();
					}else{
						$("#winBody").empty().html("操作失败").addClass("text-danger");
						$("#winModal").modal({backdrop:"static",show:true});
					}
				}});
			});
			$("tbody tr[data-row]").each(function(index,row){
				$(row).click(function(event){
					if(event.target.nodeName!="INPUT"){
						rowSelect($(this));
					}
					switchCss($(this));
				});
				$(row).bind("contextmenu",function(){
					return false;
				});
			});
		});
	</script>
</body>
</html>
