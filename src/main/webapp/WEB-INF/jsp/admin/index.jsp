<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="keywords" content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>网上论坛后台管理系统</title>

  <!--icheck-->
  <link href="/admin/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="/admin/js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="/admin/js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="/admin/js/iCheck/skins/square/blue.css" rel="stylesheet">

  <!--dashboard calendar-->
  <link href="/admin/css/clndr.css" rel="stylesheet">

  <!--Morris Chart CSS -->
  <link rel="stylesheet" href="/admin/js/morris-chart/morris.css">

  <!--common-->
  <link href="/admin/css/style.css" rel="stylesheet">
  <link href="/admin/css/style-responsive.css" rel="stylesheet">
  <link rel="stylesheet" href="/layer/skin/default/layer.css">
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a ><img src="/admin/css/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a ><img src="/admin/css/images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="/admin/css/images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">John Doe</a></h4>
                        <span>"Hello There..."</span>
                    </div>
                </div>

                <h5 class="left-nav-title">Account Information</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                  <li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
                  <li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
                  <li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li><a href="/admin/userinfoManage"><i class="fa fa-comments"></i> <span>用户管理</span></a></li>
                <li><a href="/admin/noticeManage"><i class="fa fa-home"></i> <span>公告管理</span></a></li>
                <li><a href="/admin/plateManage"><i class="fa fa-glass"></i> <span>版块管理</span></a></li>
                <li><a href="/admin/commentManage"><i class="fa fa-globe"></i> <span>评论审核</span></a></li>
                <li><a href="/admin/noteManage"><i class="fa fa-retweet"></i> <span>帖子审核</span></a></li>
            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                          	  欢迎您！
                        </a>
                    </li>
					<li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="images/photos/user-avatar.png" alt="" />
                            Admin
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li><a onclick="editPwd()"><i class="fa fa-user"></i>修改密码</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--notification menu end -->

        </div>
        <!-- header section end-->

        <!-- page heading start-->
        <div class="page-heading">
            <h3>
                欢迎来到   网上论坛后台管理系统！
            </h3>
            <ul class="breadcrumb">
                <li class="active">本团队为您倾情打造 </li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper" >
            <div class="row" >
                <div class="col-md-12">
                    <!--statistics start-->
                     <div class="row state-overview">
                        <div class="col-md-12 col-xs-12 col-sm-12">
                             <img style="width:80%;padding-left:10%"src="/admin/images/aa.jpg" alt="" />
                        </div>
                    </div>
                    <!--statistics end-->
                </div>
            </div>

        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2018 &copy; 网上论坛后台管理系统 
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
<div style="width:80%;height:50%;display:none;padding-top:5px;" id="inputDiv">
	<form class="form-horizontal" role="form" id="subForm">
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				用户名：
			</label>
			<div class="col-sm-8">
				<input class="form-control" value="admin" readonly="readonly" type="text"/>
			</div>
		</div>
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				原密码：
			</label>
			<div class="col-sm-8">
				<input class="form-control" id="oldpwd" type="password" name="oldpwd" />
			</div>
		</div>
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				新密码：
			</label>
			<div class="col-sm-8">
				<input class="form-control" id="newpwd" type="password" name="newpwd" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-6 ">
				<button type="button" onclick="subMit()" class="btn btn-success">确定</button>
				<button type="button" class="btn btn-success" onclick="closeAllLayer()">取消</button>
			</div>
		</div>
	</form>
</div>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="/admin/js/jquery-1.10.2.min.js"></script>
<script src="/admin/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/admin/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/admin/js/bootstrap.min.js"></script>
<script src="/admin/js/modernizr.min.js"></script>
<script src="/admin/js/jquery.nicescroll.js"></script>
<script src="/admin/js/scripts.js"></script>
<script src="/layer/layer.js"></script>
<script src="/admin/js/common.js"></script>

<script type="text/javascript">
function editPwd(){
	layer.open({
		type: 1,//层的类型。0：信息框（默认），1：页面层，2：iframe层，3：加载层，4：tips层。
		area: ['50%', '70%'],//控制层宽高 [宽度, 高度]
	  	content: $("#inputDiv"),
	  	offset:['100px','300px'],
	  	title:'修改密码',
	  	scrollbar: false
	});
}

function subMit(){
	//var formData = new FormData($('#subForm')[0]);
	var oldpwd = $("#oldpwd").val();
	var newpwd = $("#newpwd").val();
	
	 var number1 = nullOrEmpt(oldpwd);
	 var major1 = nullOrEmpt(newpwd);
	 if(!number1 || !major1 ){
		 layer.alert('请填写完每一项信息',{icon: 0});
		 return;
	 }
	$.ajax({
	       type: "POST",
	       url:"/admin/editpwd",
	       data:{'oldpwd':oldpwd,'newpwd':newpwd},
	       dataType:"json",
	       success: function(data) {
	       	 if(data=='1'){
	       		layer.alert('修改成功',{icon: 6}); 
	       		closeAllLayer();
	       	 }else{
	       		 layer.alert('原密码输入有误',{icon: 5}); 
	       	 }
	       }
	   }); 
}
</script>

</body>
</html>
