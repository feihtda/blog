<%--
  Created by IntelliJ IDEA.
  User: 13411
  Date: 2020/4/19
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${requestScope.articleid.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/editor/lib/marked.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/editor/lib/prettify.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/editor/lib/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/editor/lib/underscore.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/editor/lib/sequence-diagram.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/editor/lib/flowchart.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/editor/lib/jquery.flowchart.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor/css/editormd.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/editor/editormd.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

</head>
<body>
<!--头部信息-->
<jsp:include page="TopBar.jsp"/>
<!--主页内容-->
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <div class="article" id="article">

                <h1>${requestScope.articleid.title}</h1>
                <div class="spannav">
                    <span><i><span class="glyphicon glyphicon-user"/></i>${sessionScope.user}</span>
                    <span><i><span class="glyphicon glyphicon-th-list"/></i>${requestScope.articleid.label}</span>
                    <span><i><span class="glyphicon glyphicon-time"/></i><fmt:formatDate value="${requestScope.articleid.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    <span><i><span class="glyphicon glyphicon-edit"/></i>0条 </span>
                </div>
                <div style="letter-spacing: 2px;line-height: 1.9;font-size: 15px">
                    <div id="test-editormd">
                        　　<textarea style="display:none;" placeholder="markdown语言">${requestScope.articleid.content}</textarea>
                    </div>

                </div>

            </div>

            <!--评论区-->
            <form action="${pageContext.request.contextPath}/article/comment/${requestScope.articleid.id}" method="post">
            <div class="article1">
                <span class="glyphicon glyphicon-erase"></span>
                留下你憨憨的看法
                    <form action="${pageContext.request.contextPath}/article/comment/${requestScope.articleid}" method="post"></form>
                    <textarea name="content"  style="height: 120px;width: 750px"></textarea>
                    <br/><br/>
                    <div class="row col-lg-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">昵称</span>
                        <input type="text" name="nickname" class="form-control" placeholder="好汉请留名" aria-describedby="basic-addon1">
                    </div>
                    </div>
                <button type="submit" class="btn btn-info">提交&nbsp;</button>
                <!--评论区-->
                <c:forEach items="${comments}" var="comment">
                <div class="comment">
                    <p class="text-uppercase">${comment.content}</p>
                    <br/>
                    <blockquote class="blockquote-reverse">
                        <footer>nickname:${comment.nickname} </footer><footer>time:<fmt:formatDate value="${comment.comTime}" pattern="yyyy-MM-dd HH:mm:ss"/></footer>
                    </blockquote>
                </div>
                </c:forEach>

            </div>
            </form>
        </div>
        <!--侧边栏-->
            <div class="col-lg-3">
                <jsp:include page="SideBar.jsp"/>
            </div>
    </div>
</div>
<script>
    editormd.markdownToHTML("test-editormd", {
        htmlDecode      : "style,script,iframe",
        emoji           : true,
        taskList        : true,
        tex             : true,  // 默认不解析
        flowChart       : true,  // 默认不解析
        sequenceDiagram : true  // 默认不解析
    });


</script>
</body>
</html>
