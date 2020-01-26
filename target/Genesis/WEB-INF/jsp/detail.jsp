<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type"  content="text/html;charset=utf-8">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layer/skin/default/layer.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/layer/layer.js"></script>
    <title>${topic.title} - Genesis </title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>
<div style="width: 70%;margin:1% 2% 1% 5%;float: left;" style="height:100%">
<div class="panel panel-default" id="main" style="height:100%">
    <div class="panel-heading" style="background-color: white">
        <div class="panel-heading" style="background-color: white">
            <a href="/">Genesis</a> › 主题
        </div>
        <h3>${topic.title}</h3><br/>
        <div>
            <a href="/member/${topic.user.username}"><span ><strong>${topic.user.username}</strong></span></a>&nbsp;&nbsp;
            <small class="text-muted">${topic.localCreateTime}&nbsp;&nbsp;&nbsp;+08:00</small>&nbsp;&nbsp;
            <small class="text-muted">${topic.click}次点击</small>
            <c:if test="${!empty userId}">
            	<small class="text-muted"><a style="padding-left:10px" onclick="shoucang()">我要收藏</a></small>
       		</c:if>
        </div>
    </div>

    <ul class="list-group" style="width: 100%;overflow-y:scroll;height:638px">
            <li class="list-group-item">
                ${topic.content}
            </li>
    </ul>
</div>

<c:if test="${!empty replies}">
<div class="panel panel-default" id="main" style="height:100%">
    <div class="panel-heading" style="background-color: white">
        <span>
                ${fn:length(replies)} 回复  |  直到 <c:forEach items="${replies}" var="reply" varStatus="status">

<c:if test="${status.last}">
    ${reply.localCreateTime}
    </c:if>
    </c:forEach>
    </span>
    </div>

    <ul class="list-group" style="width: 100%">
        <!-- 遍历评论 -->
        <c:forEach items="${replies}" var="reply">
        <li class="list-group-item">
            <div style="height: 50px">
                <div style="float: left;width: 6%;margin-bottom: 5px">
                    <img width="50px" height="50px" src="${reply.user.avatar} " class="img-rounded">
                </div>
                <div style="width: 89%;float: left">
                    <a href="/member/${reply.user.username}"><strong>${reply.user.username}</strong></a>&nbsp;&nbsp;
                    <small class="text-muted">${reply.localCreateTime}&nbsp;&nbsp;&nbsp;+08:00</small>
                    <c:if test="${reply.replyUserId == sessionScope.userId}">
                    	<a style="padding-left:10px" onclick="delReply(${reply.id})">删除回复</a>
                    </c:if>
                    <br/>
                    <div>
                        <p>${reply.content}</p>
                    </div>
                </div>
            </div>
        </li>
        </c:forEach>

    </ul>
</div>
</c:if>

<c:if test="${!empty user}">

<div class="panel panel-default" id="main" style="height:100%">
    <div class="panel-heading" style="background-color: white">
        添加一条新回复
    </div>
    <div class="panel-body">
        <div class="form-group">
            <form action="/reply/add" method="post">
                <input type="hidden" id="topicId" name="topicId" value="${topic.id}">
                <input type="hidden" id="replyUserId" name="replyUserId" value="${user.id}">
                <textarea class="form-control" rows="3" name="content" required="required"></textarea><br/>
            <input type="submit" class="btn btn-default btn-sm" value="回复">
            </form>
        </div>

    </div>
</div>
</c:if>

</div>
<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

<script type="text/javascript">
function shoucang(){
	var topicid = $("#topicId").val();
	var replyUserId = $("#replyUserId").val();
	
	$.ajax({
	       type: "POST",
	       url:"/user/collect",
	       data:{'topicid':topicid,'replyUserId':replyUserId},
	       dataType:"json",
	       success: function(data) {
	       	 if(data=='1'){
	       		layer.alert('收藏成功',{icon: 6}); 
	       	 }else{
	       		 layer.alert('该贴已收藏过',{icon: 5}); 
	       	 }
	       }
	   });
	
}


function delReply(id){
	layer.confirm('确认要删除吗？', {
        btn : [ '确定', '取消' ]//按钮
    }, function(index) {
    	$.ajax({
 	       type: "POST",
 	       url:"/user/delReply",
 	       data:{'id':id},
 	       dataType:"json",
 	       success: function(data) {
 	       	 if(data=='1'){
 	       		layer.alert('删除成功',{icon: 6}); 
 	       	 }else{
 	       		 layer.alert('删除失败',{icon: 5}); 
 	       	 }
 	       }
 	   });
    });
}
</script>
</body>
</html>