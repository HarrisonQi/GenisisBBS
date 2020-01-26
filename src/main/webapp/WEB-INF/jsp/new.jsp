<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="release/wangEditor.min.js"></script>
    <title>创作新主题 › Genesis </title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

    <div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="height:100%;">
        <div class="panel-heading" style="background-color: white">
            <a href="/">Genesis</a> › 创作新主题
        </div>

        <div class="panel-body">
            <form action="/topic/add" method="post" id="replyForm">
                <div class="form-group">
                    <label for="title">主题标题</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空" required="required">
                </div>
                <div class="form-group">
                    <label for="content">正文</label>
                    <div id="editor"></div>
                </div>

                <div class="form-group">
                    <label for="tab">板块</label><br/>
                    <div class="col-sm-10" style="width: 40%">
                        <select class="form-control" id="tab" name="tab">
                            <c:forEach items="${tabs}" var="tab">
                            <option value="${tab.id}">${tab.tabName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div><br/>
                <input type="button" onclick="sub()" class="btn btn-default btn-sm" value="发布主题">

            </form>
        </div>

    </div>



</div>


    <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
        <div class="panel-heading" style="background-color: white;text-align: center">
            发帖提示
        </div>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
                <h5>主题标题</h5>
                <p>
                    请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。
                </p>
            </li>

            <li class="list-group-item">
                <h5>正文</h5>
                <p>
                    请清楚地表达所要说明的内容。
                </p>
            </li>
        </ul>
    </div>


    <div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        社区指导原则
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item">
            <h5>尊重原创</h5>
            <p>
                请不要发布任何盗版下载链接，包括软件、音乐、电影等等。Genesis是创意工作者的社区，我们尊重原创。
            </p>
        </li>

        <li class="list-group-item">
            <h5>友好互助</h5>
            <p>
                保持对陌生人的友善。用知识去帮助别人。
            </p>
        </li>
    </ul>
</div>


<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

<script>
var editor;
$(document).ready(function(){
	var E = window.wangEditor;
	editor = new E('#editor');
	editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload'; //上传URL
	editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
	editor.customConfig.uploadImgMaxLength = 5;    
	editor.customConfig.uploadFileName = 'myFileName';
	editor.customConfig.uploadImgHooks = {
	    customInsert: function (insertImg, result, editor) {
	                // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
	                // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
	         
	                // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
	                var url =result.data;
	                insertImg(url);
	         
	                // result 必须是一个 JSON 格式字符串！！！否则报错
	            }
	        }
	        editor.create();
	});
	
	
	function sub(){
		var title = $("#title").val().trim();
		if(title==''){
            alert("请填写标题！");
            return submitValidate(false);
        }
		var content = editor.txt.html();
		var tab = $("#tab").find("option:selected").val();
		
		 $.ajax({
		       type: "POST",
		       url:"${pageContext.request.contextPath}/topic/add",
		       data:{'content':content,'tab':tab,'title':title},
		       dataType:"json",
		       success: function(data) {
		       	  if(data=='-1'){
		       		  alert("请先登录");
		       		 //location.href="${pageContext.request.contextPath}/signin"; 
		       	 }else{
		       		 alert("发表成功");
		       		//location.href="${pageContext.request.contextPath}";
		       	 } 
		       }
		   });
	}
	
    function submitValidate(flag){
        return flag;
    }
    /* $("#replyForm").submit(function () {
    	alert(editor.txt.html());
        if($("#title").val()==''){
            alert("请填写标题！");
            return submitValidate(false);
        }else {
            var ifSubmit=confirm("确定发表该主题吗?");
            if (ifSubmit == true){

            }else {
                return submitValidate(false);
            }
        }
    }) */
</script>
</body>
</html>