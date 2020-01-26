<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String  url  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);
    if(request.getQueryString()!=null)
    {
        url+="?"+request.getQueryString();
    } %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type" content="text/html;charset=utf-8">
    <meta name="keywords" content="Genesis,论坛,社区,程序员">
    <title>Genesis - 一个分享创造的开发者社区 </title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-paginator.js"></script>
    <style>
        li {
            list-style-type: none;
        }

        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular, AvenirNext-Regular, arial, Hiragino Sans GB, "Microsoft Yahei", "Hiragino Sans GB", "WenQuanYi Micro Hei", sans-serif;
            background: #f0f2f5;
        }

        .footer {
            background-color: #fff;
            margin-top: 22px;
            margin-bottom: 22px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 200px;
            border: 1px;
            clear: both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            width: 40%;
            float: left;
        }

        .info {
            margin-right: 5%;
            width: 10%;
            float: left;
        }

        a {
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp" %>

<div class="panel panel-default" id="main" style="width: 70%;height:100%;margin:1% 2% 5% 5%;float: left;">
    <div class="panel-heading" style="background-color: white">
        <div>
            <div style="display: inline-block">
                <a style="margin-right: 0%;display: inline" class="pull-left">最新回帖</a>
            </div>
            <div class="input-group pull-right" style="width: 300px; " align="right">
                <input id="searchText" type="text" class="form-control" style="display: inline-block">
                <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="search()">搜索</button>
                    </span>
            </div><!-- /input-group -->
        </div>
    </div>


    <ul id="topicList_id" class="list-group" style="width: 100%;overflow-y:scroll;height:530px">
        <c:forEach items="${topics}" var="topic">
            <li class="list-group-item">
                <div style="height: 50px">
                    <div style="float: left;width: 6%;margin-bottom: 5px">
                        <img width="50px" height="50px" src="${pageContext.request.contextPath}${topic.user.avatar}"
                             class="img-rounded">
                    </div>
                    <div style="width: 89%;float: left">
                        <c:if test="${topic.sort == 1}">
                            <span style="color:red">公告</span>
                        </c:if><a href="/t/${topic.id}">${topic.title}</a><br/>
                        <div>
                            <a><span class="label label-default">${topic.tab.tabName}</span></a>&nbsp;&nbsp;&nbsp;
                            <a href="/member/${topic.user.username}"><span><strong>${topic.user.username}</strong></span></a>&nbsp;&nbsp;&nbsp;
                            <small class="text-muted">${topic.localCreateTime}</small>
                        </div>
                    </div>
                    <div style="width: 5%;float: right;text-align: center">
                        <span class="badge">${topic.countReplies}</span>
                        <c:if test="${topic.sort == 1}">
                            <span class="badge">置顶</span>
                        </c:if>
                    </div>
                </div>
            </li>
        </c:forEach>

    </ul>
    <div align="right">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous" onclick="changePage(1, 7);">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a onclick="changePage(this.text, 7);">1</a></li>
                <c:if test="${lastPageNum}>2">
                    <li><a onclick="changePage(this.text, 7);">2</a></li>
                </c:if>
                <c:if test="${lastPageNum}>3">
                    <li><a onclick="changePage(this.text, 7);">3</a></li>
                </c:if>
                <c:if test="${lastPageNum}>4">
                    <li><a onclick="changePage(this.text, 7);">4</a></li>
                </c:if>
                <li><a>...</a></li>
                <li><a onclick="changePage(this.text, 7);">${lastPageNum}</a></li>
                <li>
                    <a href="#" aria-label="Next" onclick="changePage(${lastPageNum}, 7);">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <div class="input-group pull-right" style="width: 106px; margin-left: 5px" align="right">

                    <input id="pageText" type="text" class="form-control" style="display: inline-block"
                           placeholder="页码">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="changePage_input()">跳转</button>
                        <%--<button onclick="getUrl()"/>--%>
                    </span>
                </div><!-- /input-group -->
            </ul>

        </nav>
    </div>

</div>

<script>
    var keyword;

    function changePage(page, count) {
        keyword = $("#searchText").val();

        var pathUrl = (window.location.href).split("/?")[0];

        window.location.href = pathUrl+'/?page=' + page + '&count=' + count + '&keyword=' + keyword;

    }

    function changePage_input() {
        var pathUrl = (window.location.href).split("/?")[0];
        keyword = $("#searchText").val();
        var count = 7;
        window.location.href = pathUrl+'/?page=' + $('#pageText').val() + '&count=' + count + '&keyword=' + keyword;
    }

    function search() {
        var pathUrl = (window.location.href).split("/?")[0];
        keyword = $("#searchText").val();
        window.location.href = pathUrl+'/?keyword=' + keyword;
    }
    function getUrl(){
        var pathUrl = (window.location.href).split("/?")[0];
        alert(pathUrl);
    }
</script>


<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp" %>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp" %>
</body>
</html>