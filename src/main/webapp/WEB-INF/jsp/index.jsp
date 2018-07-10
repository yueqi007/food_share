<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<%-- <base href=" <%=basePath%>">
 --%><!-- 引入JQuery -->
  <script type="text/javascript" src="<%=basePath%>resource/jquery-easyui-1.5.5.2/jquery.min.js"></script>
  <!-- 引入EasyUI -->
  <script type="text/javascript" src="<%=basePath%>resource/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
  <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
  <script type="text/javascript" src="<%=basePath%>resource/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
  <!-- 引入EasyUI的样式文件-->
  <link rel="stylesheet" href="<%=basePath%>resource/jquery-easyui-1.5.5.2/themes/default/easyui.css" type="text/css"/>
  <!-- 引入EasyUI的图标样式文件-->
  <link rel="stylesheet" href="<%=basePath%>resource/jquery-easyui-1.5.5.2/themes/icon.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
    $(function(){  
        $("a[title]").click(function(){  
            var text = $(this).text();  
            var href = $(this).attr("title");  
            //判断当前右边是否已有相应的tab  
            if($("#tt").tabs("exists", text)) {  
                $("#tt").tabs("select", text);  
            } else {  
                //如果没有则创建一个新的tab，否则切换到当前tag  
                $("#tt").tabs("add",{  
                    title:text,  
                    closable:true,  
                    content:'<iframe title=' + text + ' src=' + '<%=basePath%>' + href +' frameborder="0" width="100%" height="100%" />'  
                    //href:默认通过url地址加载远程的页面，但是仅仅是body部分  
                    //href:'send_category_query.action'  
                });  
            }  
                  
        });  
    });  
</script>  
</head>

   <body class="easyui-layout">  
         <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background:  #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 疯狂秀才 <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><!-- <img src="images/blocks.gif" width="20" height="20" align="absmiddle" />  -->jQuery.EasyUI- 1.2.2 应用实例</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
    <div class="footer"></div>
    </div>
        <div data-options="region:'west',title:'系统操作',split:true" style="width:200px;">  
            <!-- 此处显示的是系统菜单 -->  
            <div id="menu" class="easyui-accordion" >     
                <div title="用户管理" data-options="iconCls:'icon-user'" >     
                      <ul>
                      	<li><a href="#" title="user/list.do">用户</a>
                      	<li><a href="#" title="send_product_query.action">商品管理</a>
                      </ul>
                </div>    
                <div title="权限管理" data-options="iconCls:'icon-group_key'" >     
                      <ul>
                      	<li><a href="#" title="send_category_query.action">权限组</a>
                      	<li><a href="#" title="send_product_query.action">用户组</a>
                      </ul>
                </div>
                <div title="留言管理" data-options="iconCls:'icon-note_edit'" >     
                      <ul>
                      	<li><a href="#" title="send_category_query.action">类别管理</a>
                      	<li><a href="#" title="send_product_query.action">商品管理</a>
                      </ul>
                </div> 
                <div title="美分管理" data-options="iconCls:'icon-rainbow'" >
                	<ul>
                		<li><a href="#" >类别管理</a>
              			<li><a href="#" >商品管理</a>
                	</ul>
                </div>     
            </div>     
        </div>     
        <div data-options="region:'center',title:'后台操作页面'" style="padding:5px;background:#eee;">
        	<div id="tt" class="easyui-tabs" data-options="fit:true">
        	</div>
        </div>  
        <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>   
    </body>  
</html>