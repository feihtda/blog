<%--
  Created by IntelliJ IDEA.
  User: 13411
  Date: 2020/4/19
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/css/index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/js/bootstrap.min.js"></script>
</head>
<body>
</div>
</div>
    <div class="lbottom navbar-fixed-bottom">
    小花所有
</div>
<script>
    $(function () {
        $.ajax({
            url:"/blog/article/getLabelCategory",
            method:"get",
            success:function (response) {
                let Label=response.map.label;
                let category=response.map.category;
                console.log(Label);
                console.log(category);
            //<button type="button" class="list-group-item">
                for(let i=0;i<category.length;i++){
                let $l=$("<button>").addClass("list-group-item").attr("type","button").text(category[i]);
                $("#category").append($l);
                }
                for(let i=0;i<Label.length;i++){
                    let $l=$("<a>").addClass("btn btn-default").attr("type","button").text(Label[i]);
                    $("#label").append($l);
                }

            },
            error:function () {
                console.log("小朋友偷懒了哦");
            }
        });
    });

</script>
</body>
</html>
