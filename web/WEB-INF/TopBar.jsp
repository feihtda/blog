<%--
  Created by IntelliJ IDEA.
  User: 13411
  Date: 2020/4/19
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid head">
<nav  class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="col-lg-5">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/edit">
        <span>
          控制台
          </span>
        </a>
    </div>

        <div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/index">个人blog</a></li>

            </ul>
        </div>
    </div>
    <div class="col-lg-4">
        <c:choose>
            <c:when test="${sessionScope.user==null}">
                <a href="${pageContext.request.contextPath}/toLogin" style="line-height: 50px">[登录]</a>
                <a href="${pageContext.request.contextPath}/toRegister" style="line-height: 50px">[注册]</a>
            </c:when>
            <c:otherwise>
                <a style="line-height: 50px;color: #333;text-decoration: none">${sessionScope.user}用户发现宝藏之处！</a>
                <a href="${pageContext.request.contextPath}/exitLogin">[退出登录]</a>

            </c:otherwise>
        </c:choose>
    </div>
</nav>
<div class="alert alert-info alert-dismissable">
    <button type="button" class="close" data-dismiss="alert"
            aria-hidden="true">
        &times;
    </button>
    &nbsp;&nbsp;&nbsp;&nbsp;重要的事情说三遍！！！欢迎到访小花blog！欢迎到访小花blog！欢迎到访小花blog！
</div>
</div>
</body>
</html>
