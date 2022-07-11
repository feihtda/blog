8
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小花blog登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url(${pageContext.request.contextPath}/static/image/register.jpg) top left;
            background-size: 100%;
        }
    </style>
</head>
<body>
    <div class="login">
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label >Username</label>
                <input type="text" name="username" class="form-control" placeholder="Username">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>

            <button type="submit" class="btn btn-default">注册</button>
            <p style="color: red">${requestScope.msg}</p>
        </form>
    </div>




</body>
</html>
