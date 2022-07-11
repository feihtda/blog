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
  <title>Title</title>
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

      <div  class="col-lg-9">
        <c:forEach var="article" items="${requestScope.pagemsg.lists}">
        <div class="content">
            <div class="row">
                <div class="col-lg-3">
                    <img src="${pageContext.request.contextPath}/static/image/picture.jpg" width="170px" height="130px">
                </div>
                <div class="col-lg-9">
                     <h4><a href="prime.html">${article.title}</a></h4>
                     <div class="spannav">
                             <span><i><span class="glyphicon glyphicon-th-list"></i><a href="${pageContext.request.contextPath}/index?label=${article.label}">${article.label}</a></span>
                             <span><i><span class="glyphicon glyphicon-time"></span></i>${article.createTime}</span>
                             <span><i><span class="glyphicon glyphicon-edit"></span></i>0条 </span>
                     </div>
                     <p>${article.content}</p>
                </div>
        </div>
        </div>
        </c:forEach>

        <!--分页按钮-->
        <div style="text-align: center">
          <ul class="pager page">
              <li><a href="${pageContext.request.contextPath}/index?currPage=1">首页</a></li>
              <c:choose>
                  <c:when test="${requestScope.pagemsg.currPage != 1}">
                      <li id="left"><a href="${pageContext.request.contextPath}/index?currPage=${requestScope.pagemsg.currPage-1}">前一页</a></li>
                  </c:when>
                  <c:otherwise>
                      <li class="disabled" id="left"><a href="#">前一页</a></li>
                  </c:otherwise>
              </c:choose>
              <c:choose>
                  <c:when test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
                      <li id="right"><a href="${pageContext.request.contextPath}/index?currPage=${requestScope.pagemsg.currPage+1}">后一页</a></li>
                  </c:when>
                  <c:otherwise>
                      <li class="disabled" id="right"><a href="#">后一页</a></li>
                  </c:otherwise>
              </c:choose>
              <li><a href="${pageContext.request.contextPath}/index?currPage=${requestScope.pagemsg.totalPage}">尾页</a></li>
          </ul>
        </div>

      </div>

     <!--侧边栏-->
      <div class="col-lg-3">
          <jsp:include page="SideBar.jsp"/>
      </div>
  </div>
</div>
</body>
</html>
