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
<div class="panel panel-default" id="main" style="height:100%;width: 70%;margin:1% 2% 5% 5%;float: left;">
    <div class="panel-heading" style="background-color: white">
        我的发帖
    </div>
<input type="hidden" id="replyUserId" name="replyUserId" value="${user.id}">
<ul class="list-group" style="width: 100%">
    <c:forEach items="${myTopicList}" var="topic">
    <li class="list-group-item">
        <div style="height: 50px">
            <div style="float: left;width: 6%;margin-bottom: 5px">
                <img width="50px" height="50px" src="${topic.avatar}" class="img-rounded">
            </div>
            <div style="width: 89%;float: left">
                <a href="/t/${topic.id}">${topic.title}</a><br/>
                <div>
                    <a><span class="label label-default" >${topic.tabname}</span></a>&nbsp;&nbsp;&nbsp;
                    <a href="/member/${topic.username}"><span ><strong>${topic.username}</strong></span></a>&nbsp;&nbsp;&nbsp;
                    <small class="text-muted">${topic.createTime}</small>
                    <small class="text-muted"><a style="padding-left:10px" onclick="quxiaobbs(${topic.id})">取消收藏</a></small>
                </div>
            </div>
            <div style="width: 5%;float: right;text-align: center">
                <span class="badge">${topic.countReplies}</span>
            </div>
        </div>
    </li>
    </c:forEach>

</ul>

</div>
<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>
<script type="text/javascript">
function quxiaobbs(topicid){
	var replyUserId = $("#replyUserId").val();
	layer.confirm('确认要取消收藏吗？', {
        btn : [ '确定', '取消' ]//按钮
    }, function(index) {
    	$.ajax({
 	       type: "POST",
 	       url:"/user/quxiaobbs",
 	       data:{'topicid':topicid,'replyUserId':replyUserId},
 	       dataType:"json",
 	       success: function(data) {
 	       	 if(data=='1'){
 	       		layer.alert('取消成功',{icon: 6}); 
 	       	 }else{
 	       		 layer.alert('取消失败',{icon: 5}); 
 	       	 }
 	       }
 	   });
    }); 
}
</script>
</body>
</html>