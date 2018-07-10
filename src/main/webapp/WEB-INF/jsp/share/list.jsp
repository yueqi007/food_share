<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>image调用</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <!-- base需要放到head中 -->    
    <base href=" <%=basePath%>">  
    <style type="text/css">
    .header{
    height:129px;
    background:black; 
    width:100%;
    
    }
    .row{
    margin:20px;
    text-align:center!important;
    }
    </style> 
    <link rel="stylesheet" href="resource/bootstrap-4.1.1/css/bootstrap.min.css" type="text/css"/>  
   <script type="text/javascript" src="resource/jquery-easyui-1.5.5.2/jquery.min.js"></script>
  <script type="text/javascript" src="resource/bootstrap-4.1.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="resource/js/country.js"></script>
</head>
<body>
	<div class="container-fluid">
		<!-- 头部 -->
		<div class="row" style="">
			<div class="col-md-4">22</div>
			<div class="input-group col-md-4"><!-- 搜索框 -->
	       		<input type="text" class="form-control"placeholder="请输入美食名称" />
	            <span class="input-group-btn">
	               <button class="btn btn-danger">查找</button>
	            </span>
			</div>
			<div class="col-md-4">22</div>
		</div>
		<!-- 标签栏 -->
		<div class="row">
			<div class="col-md-2">22</div>
			<div class="col-md-8"><!-- 导航栏 -->
				<nav class="navbar navbar-expand-sm  bg-light">
				  <ul class="navbar-nav">
				    <li class="nav-item">
				      <a class="nav-link" href="">Link 1</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">Link 2</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">Link 3</a>
				    </li>
				  </ul>
				</nav>
			</div>
			<div class="col-md-2">22</div>
		</div>
		<!-- 中间排序栏 -->
		<div class="row">
			<div class="col-md-4">22</div>
			<div class="col-md-4">22</div>
			<div class="col-md-4">22</div>
		</div>
		<!-- 主要部分 -->
		<div class="row" style="background:#FAE8C8">
			<div class="col-md-2">22</div>
			<div class="col-md-8"><!-- 产品列表 -->
				<div class="row">
					<c:forEach items="${share_list}" var="item">
				  	<div class="col-md-4">
				  		<div>
				  			<img class="center-block" src="resource/doccenter/temp/1.jpg">
				  		</div>
				  		<div>
				  			${item.username}
				  		</div>
				  	</div>
             
          		</c:forEach>
				</div>
				
			</div>
			<div class="col-md-2">22</div>
		</div>
		<!-- 页脚 -->
		<div class="row">
			<div class="col-md-4">22</div>
			<div class="col-md-4">22</div>
			<div class="col-md-4">22</div>
		</div>
		
		<div id="header" class="header"></div>
		<div id="nav"></div>
		<div id="main"></div>
		<div id="fotter"></div>
</div>

<%-- 	<div id="north">
		
	</div>
	<div id="center" style="width:700px;top:50%;left:50%;">
		  <c:forEach items="${share_list}" var="item">
		  	<div style="height:332px;width:232px;float:left;">
		  		<div>
		  			<img alt="" src="">
		  		</div>
		  		<div>
		  			${item.username}
		  		</div>
		  	</div>
             
          </c:forEach>
	</div>
	
	<div id="footer"></div> --%>
</body>
</html>