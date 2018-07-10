<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href=" <%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<!-- 引入JQuery -->
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
 <body>
       <div id="loginWin" class="easyui-window" title="登录" style="width:400px;height:220px;padding:5px;"
         minimizable="false" maximizable="false" resizable="false" collapsible="false">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding:5px;background:#fff;border:1px solid #ccc;">
                <form action="main/index.do" id="loginForm" method="post">
                    <div style="padding:5px 0;">
                        <label for="login">帐号:</label>
                        <input type="text" id="username" name="username" style="width:260px;" />
                    </div>
                    <div style="padding:5px 0;">
                        <label for="password">密码:</label>
                        <input type="password" id="password" name="password" style="width:260px;" />
                    </div>
                    <div style="padding:5px 0;text-align: center;color: red;" id="errMsg"> ${errMsg} </div>
                </form>
            </div>
            <div region="south" border="false" style="text-align:right;padding:5px 0;">
                <a id="loginBtn" class="easyui-linkbutton" iconcls="icon-ok" href="javascript:void(0)" onclick="login()">登录</a>
            </div>
        </div>
    </div>
    <div>
    	<a href="share/test.do">23434</a>
    </div>
</body>

<script type="text/javascript">
	function login(){
		var username = $("#username").val();
		var password = $("#password").val();
		if(username==''){
			$.messager.alert('警告','账户不能为空！'); 
			return false;
		}
		if(password==''){
			$.messager.alert('警告','密码不能为空！');
			return false;
		}
		$("#loginForm").submit();
		/* $.ajax({
			url:'main/index.do',
			type:'post',
			data:{username:username,password:password},
			/* type:'json', 
			success:function(result){
				if(result.errMsg != ''){
					$("#errMsg").html = result.errMsg;
				}else{
					
				}
			},
			error:function(){
			}
		}) */
	}
</script>
</html>