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
    <%@include file="/WEB-INF/view/common/head_css_upload.jsp"%>
    <%@include file="/WEB-INF/view/common/head_css_fav.jsp"%>
    <%@include file="/WEB-INF/view/common/hf_css_upload.jsp"%>
    <link href="https://cdn.bootcss.com/bootstrap-datepicker/1.7.0-RC3/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <title>评论管理</title>
</head>
<body>
<div id="wrapper">
    <jsp:include page="/menu.html"></jsp:include>
    <div id="page-wrapper">
        <%--<nav class="navbar navbar-default" role="navigation">--%>
            <%--<div class="container-fluid">--%>
                <%--<div class="collapse navbar-collapse" id="top-navbar-collapse">--%>
                    <%--<form class="navbar-form navbar-left" id="searchForm"--%>
                          <%--role="search" action="<c:url value='/goods/index.html'/>"--%>
                          <%--method="GET">--%>
                        <%--<input type="hidden" name="action" value="list" /> <input--%>
                            <%--type="hidden" name="resourceCode" value="${resourceCode }" />--%>
                        <%--<div class="form-group">--%>
                            <%--<label class="">产品名称</label> <input type="text"--%>
                                                                <%--value="${parameter.entity.name}" name="entity.name" id="name"--%>
                                                                <%--autofocus class="typeahead form-control" placeholder="产品名称">--%>
                            <%--<label class="">积分系数</label> <input type="number"--%>
                                                                <%--value="${parameter.entity.pointFactor}" name="entity.pointFactor" id="pointFactor"--%>
                                                                <%--autofocus class="typeahead form-control" placeholder="产品积分系数">--%>

                            <%--<button type="submit" class="btn btn-primary" id="search"--%>
                                    <%--name="search">--%>
                                <%--<span class="glyphicon glyphicon-search searchBtn"></span>&nbsp;查询--%>
                            <%--</button>--%>
                        <%--</div>--%>
                    <%--</form>--%>
                    <%--<ul class="nav navbar-nav navbar-right">--%>
                        <%--<li><button type="button"--%>
                                    <%--class="btn btn-primary navbar-btn addBtn">--%>
                        <%--<li class="fa fa-plus-square fa-fw"></li>新增产品--%>
                        <%--</button></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</nav>--%>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="table-responsive">
                    <table
                            class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>选择</th>
                            <th>产品</th>
                            <th>评论人</th>
                            <th>内容</th>
                            <th>时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="dataList">
                        <c:forEach items="${comments}" var="comment">
                            <tr data-row="${g.id}" <c:if test="${g.mainGoods}"> class="danger"</c:if>>
                                <td><input type="checkbox" value="${g.id}"></td>
                                <td>${comment.goodsName}</td>
                                <td>${comment.agent.realName}</td>
                                <td>${comment.body}</td>
                                <td>${comment.updateTime}</td>
                                <c:if test="${comment.canPublish}">
                                    <td>通过</td>
                                </c:if>
                                <c:if test="${!comment.canPublish}">
                                    <td>未通过</td>
                                </c:if>
                                <td><a class="btn btn-success default changeBtn ajaxLink" href="<c:url value='/comment/change.json?cid=${comment.id}' /> "><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>改变状态</a>
                                <%--<td><a class="btn btn-success default editBtn"--%>
                                       <%--href="<c:url value='/goods/edit.html?id=${g.id}' /> "><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>修改</a>--%>
                                    <%--<a class="ajaxLink btn btn-danger default" data-role="delete"--%>
                                       <%--href="<c:url value='/goods/remove.json?id=${g.id}' /> "><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</a>--%>
                                <%--</td>--%>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body" id="messageBody"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<div class="modal fade" id="winModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="winModalLabel"></h4>
            </div>
            <div class="modal-body" id="winBody"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/view/common/head.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/common/startbootstrap.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/common/script_upload.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/common/script_common.jsp"></jsp:include>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.7.0-RC3/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.7.0-RC3/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    $(function() {


        $("#dataList a.ajaxLink").click(function(e){
            e.preventDefault();
            e.stopPropagation();
            var method="POST";
            if($(this).attr("data-role")){
                if(!window.confirm("删除后无法恢复数据,是否继续删除?")){
                    return false;
                }
                method="DELETE";
            }
            var url=$(this).attr("href");
            $.ajax({url:url,method:method,complete:function(xhr,ts){
                if(xhr.status>=200 && xhr.status<300){
                    window.setTimeout(function() {
                        window.location.reload();
                    }, 1500);
                    $("#winBody").empty().html("操作成功");
                    $("#winModal").modal({backdrop:"static",show:true});

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
