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
<style type="text/css">
body {margin: 0;}
</style>

    <title>image调用</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <!-- base需要放到head中 -->    
    <base href=" <%=basePath%>"> 
    <style type="text/css">
    .row{
    margin:20px;
    text-align:center!important;
    }
    .form-gruop{
    margin:20px;
    }
    .form-control{
    width:auto;
    margin-right:10px;
    margin-bottom:10px;
    }
    .textareaitem {
    height: 300px;
    width: 500px;
    background: #fff;
    display: inline-block;
    vertical-align: top;
	}
    </style>
   <link rel="stylesheet" href="resource/bootstrap-3.3.7/dist/css/bootstrap.min.css" type="text/css"/>  
   <script type="text/javascript" src="resource/jquery-easyui-1.5.5.2/jquery.min.js"></script>
  <script type="text/javascript" src="resource/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
  
  
  <script type="text/javascript" src="resource/js/country.js"></script>
<link rel="stylesheet" href="resource/css/editpic/cropper.min.css" type="text/css"/>  
<link rel="stylesheet" href="resource/css/editpic/sitelogo.css" type="text/css"/>  
<script type="text/javascript" src="resource/js/editpic/cropper.min.js"></script>
<script type="text/javascript" src="resource/js/editpic/sitelogo.js"></script>
  <script type="text/javascript">
  //** Power by Fason(2004-3-11) 
  //** Email:fason_pfx@hotmail.com
   $(function(){
	  var s=["country","province","city"]; 
	   for(i=0;i<s.length-1;i++) 
	    document.getElementById(s[i]).onchange=new Function("change("+(i+1)+")"); 
	   change(0); 
  })
  </script>
</head>
<body>
<div class="container-fluid"><!-- 整体 -->
	<!-- 头部 -->
		<div class="row" >
			<div class="col-md-4">22</div>
			<div class="col-md-4"><!-- 搜索框 -->
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
				<ul class="nav nav-pills">
				  <li role="presentation" class="active"><a href="#">Home</a></li>
				  <li role="presentation"><a href="#">Profile</a></li>
				  <li role="presentation"><a href="#">Messages</a></li>
				</ul>
			</div>
			<div class="col-md-2">22</div>
		</div>
		<!-- 中间排序栏 -->
		<div class="row">
			<div class="col-md-4">22</div>
			<div class="col-md-4">22</div>
			<div class="col-md-4">22</div>
		</div>
		<!-- 主要 -->
		<div class="row" style="background:#FAE8C8">
			<div class="col-md-3">22</div>
			<div class="col-md-6" style="">
				<form id="main" action="">
						<!-- 标题 -->
						<div class="form-gruop">
							<label class=" control-label" for="inputTitle">标题</label>
								<input class="col-md-3 form-control" id="inputTitle" type="text" placeholder="填写美食名称">
							</div>
						<!-- 品尝地点 -->
						<div class="form-gruop">
							<label class="control-label">品尝地点</label>
							<div class="row" style="margin-left:0">
								<select id="country"  class="col-md-3 form-control" ><option>国家</option></select>
								<select id="province" class="col-md-3 form-control" ><option>省份、州</option></select>
								<select id="city" class="col-md-3 form-control" ><option>地级市、县</option></select>
								<input class="col-md-4 form-control" type="text" id="addressDesc" placeholder="请填写品尝详细地址"> 
							</div>
						</div>
						<!-- 食物属性 -->
						<div class="form-gruop">
							<label class="control-label">食物属性</label>
							<div class="row" style="margin-left:0">
								<select id="country"  class="col-md-3 form-control" ><option>国家</option></select>
								<select id="province" class="col-md-3 form-control" ><option>省份、州</option></select>
								<select id="city" class="col-md-3 form-control" ><option>地级市、县</option></select>
								<input class="col-md-4 form-control" type="text" id="addressDesc" placeholder="请填写品尝详细地址"> 
							</div>
						</div>
						<!-- 封面展示图 -->
						<div class="form-gruop">
							<label class="control-label">封面图片</label>
							<div class="row" style="margin-left:0">
								<div id="crop-avatar" class="col-md-5 "  style="padding-left:0">
									<div class="avatar-view" title="Change Logo Picture">
			    						<img src="resource/doccenter/default/upload_big_img.png" alt="Logo" >
			    					</div>
									<!--  <iframe id="newsphoto_iframe" frameborder="0" height="400px" width="300px" scrolling="no" src="iframe/pic.do"></iframe>-->
								</div>
								<div class="col-md-7">
									<textarea class="textareaitem">
										
									</textarea>
								</div>
							</div>
						</div>
			</form>
			</div>
			<div class="col-md-3">22</div>
		</div>

		<!-- <div class="col-md-6">左侧框
			<form id="main" action="" class="form-horizontal">
				<fieldset>
					<legend>添加分享</legend>
					<div class="form-gruop">
						<label class="col-md-2 control-label" for="inputTitle">标题</label>
						<div class="col-md-10">
							<input class="form-control" id="inputTitle" type="text">
						</div>
					</div>
					
						<fieldset>
							<legend>食物分类</legend>
						</fieldset>
					
					<div class="form-gruop">
						<label class="col-md-2 control-label" for="country"></label>
						<select id="country"  class="form-control" ><option>国家</option></select>
					</div>
					
					<div class="form-gruop">
						<label class="col-md-2 control-label" for="province"></label>
						<select id="province" class="form-control" ><option>省份、州</option></select> 
					</div>
					
					<div class="form-gruop">
						<label class="col-md-2 control-label" for="city"></label>
						<select id="city" class="form-control" ><option>地级市、县</option></select> 
					</div>
					
					<div class="form-gruop">
						<label class="col-md-2 control-label" for="dec">描述</label>
						<div class="col-md-10">
							<textarea class="form-control" id="dec" rows="3" cols=""></textarea>
						</div>
					</div>
					
					<div class="form-gruop">
						<label class="col-md-2 control-label" for="dec">描述</label>
						<div class="col-md-10">
							<textarea class="form-control" id="dec" rows="3" cols=""></textarea>
						</div>
					</div>
					
					<div class="form-gruop">
						<label class="col-md-3 control-label" for="address">详细地址</label>
						<div class="col-md-10">
							<textarea class="form-control" id="dec" rows="2" cols=""></textarea>
						</div>
					</div>
					
				</fieldset>
			</form>
		</div> -->
	</div>
	<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form class="avatar-form" action="" enctype="multipart/form-data" method="post">
				<div class="modal-header">
					<button class="close" data-dismiss="modal" type="button">&times;</button>
					<h4 class="modal-title" id="avatar-modal-label">Change Logo Picture</h4>
				</div>
				<div class="modal-body">
					<div class="avatar-body">
						<div class="avatar-upload">
							<input class="avatar-src" name="avatar_src" type="hidden">
							<input class="avatar-data" name="avatar_data" type="hidden">
							<label for="avatarInput">图片上传</label>
							<input class="avatar-input" id="avatarInput" name="avatar_file" type="file"></div>
						<div class="row">
							<div class="col-md-9">
								<div class="avatar-wrapper"></div>
							</div>
							<div class="col-md-3">
								<div class="avatar-preview preview-lg"></div>
								<div class="avatar-preview preview-md"></div>
								<div class="avatar-preview preview-sm"></div>
							</div>
						</div>
						<div class="row avatar-btns">
							<div class="col-md-9">
								<div class="btn-group">
									<button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
								</div>
								<div class="btn-group">
									<button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
								</div>
							</div>
							<div class="col-md-3">
								<button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
							</div>
						</div>
					</div>
				</div>
  		</form>
  	</div>
  </div>
</div>
<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
</body>
</body>
</html>