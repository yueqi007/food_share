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
<base href=" <%=basePath%>"> 
<style type="text/css">
.file {
    position: absolute;
    top: 0;
    left: 0;
    height: 400px;
    filter: alpha(opacity:0);
    opacity: 0;
    width: 300px;
    cursor: pointer;
    font-size: 400px;
    z-index: 200;
}
#clickToUpload {
    position: relative;
    z-index: 100;
    width: 300px;
}
.delimgbtn{height:32px;background:#333;position:absolute;right:0px;top:0px;display:none;z-index:300;width:32px;line-height:32px;font-size:12px;color:#fff;cursor:pointer;text-indent:-9999px;background:rgba(0,0,0,0.5) url(https://s1.c.meishij.net/n/images/delimgicon.png) 0px 0px no-repeat;}

</style>
<link rel="stylesheet" href="resource/css/editpic/bootstrap.min.css" type="text/css"/>  
<link rel="stylesheet" href="resource/css/editpic/cropper.min.css" type="text/css"/>  
<link rel="stylesheet" href="resource/css/editpic/sitelogo.css" type="text/css"/>  
<script type="text/javascript" src="resource/js/editpic/jquery.min.js"></script>
<script type="text/javascript" src="resource/js/editpic/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/js/editpic/cropper.min.js"></script>
<script type="text/javascript" src="resource/js/editpic/sitelogo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="ibox-content">
		<div class="row">
			<div id="crop-avatar" class="col-md-6">
				<div class="avatar-view" title="Change Logo Picture">
			    	<img src="logo.jpg" alt="Logo" >
			    </div>
			</div>
		</div>
	</div>
<!-- avatar-modal-->
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
</html>