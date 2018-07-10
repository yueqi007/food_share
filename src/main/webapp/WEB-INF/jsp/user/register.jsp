<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <title>image调用</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <!-- base需要放到head中 -->    
    <base href=" <%=basePath%>">   
   <script type="text/javascript" src="resource/jquery-easyui-1.5.5.2/jquery.min.js"></script>
  <!-- 引入EasyUI -->
  <script type="text/javascript" src="resource/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
  <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
  <script type="text/javascript" src="resource/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
  <!-- 引入EasyUI的样式文件-->
  <link rel="stylesheet" href="resource/jquery-easyui-1.5.5.2/themes/default/easyui.css" type="text/css"/>
  <!-- 引入EasyUI的图标样式文件-->
  <link rel="stylesheet" href="resource/jquery-easyui-1.5.5.2/themes/icon.css" type="text/css"/>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="user/register.do" method="post">
<label>账号：</label>
<input type="text" id="username" name="username" placeholder="请输入账号" /><span id='errorMsg'></span><br/>
<label>密码：</label>
<input type="password" id="password" name="password" placeholder="请输入密码" /><br/>
<label>手机号：</label>
<input type="text" id="phone" name="phone" placeholder="请输入手机号" /><br/>
<label>性别：</label>
<input type="text" id="sex" name="sex" placeholder="" /><br/>
<label>生日：</label>
<input type="text" id="birthday" name="birthday" placeholder="" class="easyui-datebox" required="required" /><br/>
<input type="submit" value="提交" />
<input type="reset" value="重置" />
</form>
</body>
<script type="text/javascript">
$("#username").focusout(function() {
	var name = $("#username").val();
	  if(name != null && name != ''){
	  	checkName(name);
	  }
	});
	
	function checkName(name){
	 $.ajax({
		 url:'user/validateUserName.do',
		 type:'post',
		 data:{username:name},
		 dataType:'json',
		 success:function(result){
			//已经存在该名字提示用户
       		if(result.status != 'true'){
       			$("#errorMsg").html("恭喜您，用户名可以使用");
       		}else{
       			$("#errorMsg").html("该用户名已经存在");
       		}
		 },
		 error:function(){
			  alert('检查用户是否存在发生错误');
		 }
	 })
	}
</script>
</html>