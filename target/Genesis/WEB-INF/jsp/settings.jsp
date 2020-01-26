<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/js/layer/skin/default/layer.css">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/layer/layer.js"></script>
    <script src="/js/common.js"></script>
    <title>Genesis ›设置</title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="height:100%;">
        <div class="panel-heading" style="background-color: white">
            <a href="/">Genesis</a> › 设置
        </div>

        <div class="panel-body">

                <form class="form-horizontal" role="form" >
                    <div style="margin-left: 17%">
                        <img width="60px" height="60px" src="${user.avatar}" class="img-rounded">
                        <!-- <a class="btn btn-default" href="/settings/avatar" role="button">更换头像</a> -->
                        <a class="btn btn-default" onclick="add()" role="button">修改信息</a>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">uid</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.id}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.username}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.email}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">注册时间</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.localCreateTime}</p>
                        </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">手机号码</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.phoneNum}</p>
                    </div>
                </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">积分</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.credit}</p>
                        </div>
                    </div>

                </form>

        </div>

    </div>



</div>

<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>
<div style="width:80%;height:50%;display:none;padding-top:5px;" id="inputDiv">
	<form class="form-horizontal" role="form" id="subForm">
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				用户名：
			</label>
			<div class="col-sm-8">
				<input class="form-control" readonly="readonly" id="username" type="text" value="${user.username}" name="username" />
			</div>
		</div>
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				Email：
			</label>
			<div class="col-sm-8">
				<input class="form-control" id="email" type="text" value="${user.email}" name="email" />
			</div>
		</div>
<!-- 		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				密码：
			</label>
			<div class="col-sm-8">
				<input class="form-control" id="pwd" type="password" name="pwd" />
			</div>
		</div>
 -->		<input type="hidden" value="${user.id}" id="uid">
		<div class="form-group">
			<div class="col-sm-offset-6 ">
				<button type="button" onclick="subMit()" class="btn btn-success">确定</button>
				<button type="button" class="btn btn-success" onclick="closeAllLayer()">取消</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
function add(){
	layer.open({
		type: 1,//层的类型。0：信息框（默认），1：页面层，2：iframe层，3：加载层，4：tips层。
		area: ['50%', '7	0%'],//控制层宽高 [宽度, 高度]
	  	content: $("#inputDiv"),
	  	offset:['100px','300px'],
	  	title:'新增',
	  	scrollbar: false
	});
}

function subMit(){
	//var formData = new FormData($('#subForm')[0]);
	var email = $("#email").val();
	//var pwd = $("#pwd").val();
	
	 var number1 = nullOrEmpt(email);
	 //var major1 = nullOrEmpt(pwd);
	 if(!number1){
		 layer.alert('请填写完每一项信息',{icon: 0});
		 return;
	 }
	$.ajax({
	       type: "POST",
	       url:"${pageContext.request.contextPath}/editUser",
	       data:{'email':email,'pwd':"",'id':$("#uid").val()},
	       dataType:"json",
	       success: function(data) {
	       	 if(data=='1'){
	       		layer.alert('操作成功',{icon: 6}); 
	       		closeAllLayer();
	       	 }else{
	       		 layer.alert('操作失败',{icon: 5}); 
	       	 }
	       }
	   }); 
}
</script>
</body>
</html>