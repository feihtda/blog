<%--
  Created by IntelliJ IDEA.
  User: 13411
  Date: 2020/4/19
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>404访问错误</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</head>
<body>
<!--头部信息-->
<jsp:include page="TopBar.jsp"/>
<!--主页内容-->
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <h1>404</h1>
            <h2>功能尚未开发，请点击<a href="${pageContext.request.contextPath}/index">返回</a>操作</h2>

        </div>
        <!--侧边栏-->
        <div class="col-lg-3">
            <jsp:include page="SideBar.jsp"/>
        </div>
    </div>
</div>


</body>
</html>
