<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <title>网上论坛后台管理系统</title>
    
    <link href="/admin/css/style.css" rel="stylesheet">
    <link href="/admin/css/style-responsive.css" rel="stylesheet">
    
    <link rel="stylesheet" href="/layer/skin/default/layer.css">
    <script src="/admin/js/jquery.min.js"></script>
    <script src="/layer/layer.js"></script>
    <script src="/admin/js/modernizr.min.js"></script>
</head>

<body class="login-body">

<div class="container" style="margin-top:80px">

    <form class="form-signin" action="login.do" id="subForm">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">网上论坛后台管理系统</h1>
            <img src="/admin/css/images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">
            <input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名" autofocus>
            <input type="password" class="form-control" id="pwd"name="pwd" placeholder="请输入密码">
            <!-- <select class="form-control m-bot15" id="utype">
                 <option selected="selected">管理员</option>
                 <option>学生</option>
             </select> -->
            <button class="btn btn-lg btn-login btn-block" type="button" onclick="submitUpload()">
                <i class="fa" style="font-size:22px">登录</i>
            </button>

        <!-- <div class="registration">
                <a class="" onclick="forgetPwd()">
                    忘记密码?
                </a>
            </div> -->
        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                        <button class="btn btn-primary" type="button">Submit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>
<script type="text/javascript">

$(function () {
	 
	//撑开浏览器
	 if (window != top) {
			top.location.href = location.href;
	}
	 
   $(document).keydown(function(event){
		if(event.keyCode == 13){
			submitUpload();
		}
	});
 });

function validateForm(){
	 var userAccount = $("#uname").val().trim();
	 var password = $("#pwd").val().trim();
	 if(userAccount.length == 0){
		 layer.alert('用户名不能为空！',{icon: 0});
		 return false;
	 }
	 if(password.length == 0){
		 layer.alert('密码不能为空！',{icon: 0});
		 return false;
	 }
	  return true;
};

function submitUpload(){
	if(validateForm()){
		 var userAccount = $("#uname").val().trim();
		 var password = $("#pwd").val().trim();
		$.ajax({
	       type: "POST",
	       url:"/admin/gologin",
	       data:{"uname":userAccount,"pwd":password},
	       dataType:"json",
	       success: function(data) {
	       	 if(data=='1'){
	       		 location.href="/admin/index"; 
	       	 }else{
	       		 layer.alert('帐号或者密码有误',{icon: 5}); 
	       	 }
	       }
	   }); 
	}
};

	
</script>
</body>
</html>
