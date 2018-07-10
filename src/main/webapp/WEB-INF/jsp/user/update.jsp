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
<form action="user/update.do" method="post">
<label>账号：</label>
<input readonly type="text" id="username" name="username"  value='${sessionScope.updateUser.username}' /><span id='errorMsg'></span><br/>
<label>密码：</label>
<input type="text" id="password" name="password"  value="${sessionScope.updateUser.password}"/><br/>
<label>手机号：</label>
<input type="text" id="phone" name="phone"  value="${sessionScope.updateUser.phone }" /><br/>
<label>性别：</label>
<input readonly type="text" id="sex" name="sex" value="${sessionScope.updateUser.sex }" /><br/>
<label>生日：</label>
<input type="text" id="birthday" name="birthday"  class="easyui-datebox" required="required" value="${sessionScope.updateUser.birthday}" /><br/>
<input type="hidden" id='id' name='id' value='${sessionScope.updateUser.id}'/>
<input type="submit" value="提交" />
<input type="reset" value="重置" />
</form>
</body>

</html>