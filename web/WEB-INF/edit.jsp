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
  <title>小花blog编辑</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
  <script src="${pageContext.request.contextPath}/static/editor/lib/jquery.flowchart.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor/css/editormd.min.css"/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/editor/editormd.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">


</head>
<body>
<!--头部信息-->
<jsp:include page="TopBar.jsp"/>
<!--主页内容-->
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <!--主要内容-->
      <div class="editcontent">
        <form action="${pageContext.request.contextPath}/article/edit" enctype="multipart/form-data" method="post">
        <div class="form-horizontal">

          <div class="form-group">
            <label class="col-lg-1 control-label">标题</label>
            <div class="col-lg-6">
              <input type="text" class="form-control" onblur="gettitle()" name="title" id="title" placeholder="输入你的文章标题">
              <span id="error-title"></span>
            </div>
          </div>


          <div class="form-group">
            <label class="col-lg-1 control-label">简介</label>
            <div class="col-lg-6">
              <textarea class="form-control" name="preface"  placeholder="输入30-40字以内的简介" ></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-1 control-label">blog</label>
            <div class="col-lg-6">
              <p class="form-control-static">${sessionScope.user}</p>
            </div>
          </div>

          <div class="form-group" style="margin-left: 10px">
            <label class="col-lg-1 control-label">图片上传</label>
            <div class="col-lg-6">
              <input type="file" name="file" id="file" accept="image/*" onchange="image(event)" style="position:absolute;clip:rect(0 0 0 0);" />
              <label for="file" class='btn btn-success'>选择背景图片</label>
                <img alt="放上你帅气的图片" id="myImg" src="" width="170px" height="130px">
            </div>
          </div>


          <div class="form-group">
            <label class="control-label art">憨憨的写下你的文章吧</label>
            <!--编辑框-->
            <div id="test-editormd" style="margin-left: 40px" >
              <textarea style="display: none" class="form-control" id="content-editormd-markdown-doc" name="content-editormd-markdown-doc"></textarea>
<%--              markdown-doc--%>
            </div>
            <div class="form-group">
              <div class="col-lg-10">
                <button style="margin-left: 40px" id="sumb" type="submit" onclick="getPlainTxt()" class="btn btn-default">提交</button>
              </div>
            </div>

          </div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
    $(function(){
      var editor=editormd("test-editormd",{
          width:"99%",
          height:"1000px",
          path:"${pageContext.request.contextPath}/static/editor/lib/",
          toolbarAutoFixed:true,
          saveHTMLToTextarea:true,
          imageUpload:true,
          imageFormats:["jpg","jpeg","gif","png"],
          imageUploadURL:"${pageContext.request.contextPath}/file/uploadImage"
      });

    });



    function gettitle() {
      let title=$("#title").val();
      console.log(title);
      console.log(title=="");
      if(title.length==0){
      $("#error-title").css({"color":"red"});
      $("#error-title").html("标题不能为空");
      }else{
        $("#error-title").css({"color":"black"});
        $("#error-title").html("is good");
      }
    }

  function getcategory() {
    let label=$("#category").val();
    console.log(label);
    if(label.length==0){
      $("#error-category").css({"color":"red"});
      $("#error-category").html("类别不能为空");
    }else{
      $("#error-category").css({"color":"black"});
      $("#error-category").html("is good");
    }
  }

    function image(e){
        for (var i = 0; i < e.target.files.length; i++) {
            var file = e.target.files.item(i);
            if (!(/^image\/.*$/i.test(file.type))) {
                continue; //不是图片 就跳出这一次循环  
            }
            //实例化FileReader API  
            var freader = new FileReader();
            freader.readAsDataURL(file);
            freader.onload = function(e) {
                $("#myImg").attr("src",e.target.result);
            };
        }
    }
</script>
</body>
</html>
