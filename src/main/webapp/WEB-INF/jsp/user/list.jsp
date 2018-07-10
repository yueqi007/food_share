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
<head>
<base href="<%=basePath%>">
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
<script type="text/javascript">
$(function(){
	$("#dg").datagrid({
		url:'user/getList.do',
		loadMsg:'数据加载中...',
		fitColumns:true,
		striped:true,
		nowrap:true,
		singleSelect:false,
		pagination: true ,
		pageSize:5,
	    pageList:[5,10,15,20],
	    idField:'id',
	    frozenColumns:[[
	        {field:'checkbox',checkbox:true},
			{field:'id',title:'用户编号',width:100}   
	     ]],
	    columns:[[    		           
	        {field:'username',title:'用户名',width:100},    
	        {field:'sex',title:'性别',width:100},
	        {field:'phone',title:'手机号',width:100},
	        {field:'birthday',title:'生日',width:100,formatter: formatDatebox},
	        {field:'createdate',title:'创建时间',width:100,formatter: formatDatebox},
	       

	        /* {field:'sex',title:'推荐商品',width:100,  
				formatter: function(value,row,index){
					if(value=='女') {
						return "<input type='checkbox' checked='checked' disabled='true'";
					} else {
						return "<input type='checkbox' disabled='true'";
					}
				 }
	        }
	        {field:'open',title:'有效商品',width:100,  
				formatter: function(value,row,index){
					if(value) {
						return "<input type='checkbox' checked='checked' disabled='true'";
					} else {
						return "<input type='checkbox' disabled='true'";
					}
				}
	         },
	        {field:'category.type',title:'所属商品类别',width:200, //category.type是商品类别
	        	formatter: function(value,row,index){
	        		if(row.category != null && row.category.type != null) {
	         			return row.category.type; //如果商品类别不为空，返回商品类别
	         		} else {
	        			return "此商品暂时未分类";
	        		}
				 }	
	        } */
	    ]],
	    toolbar: [{
    		iconCls: 'icon-add',
    		text:'新增用户',
    		handler: function(){ 
    			$("#win").window({ //因为<div>放在了aindex.jsp中，所以这里创建窗口要先调用parent  
                title:"新增用户",  
                shadow:true,
                width:400,
                height:600,
                content:'<iframe src="user/toRegister.do" frameborder="0" width="400" height="600"/>'  
            });  
			//添加触发代码
		}
    	},'-',{
    		iconCls: 'icon-remove',
    		text:'删除用户',
    		handler: function(){
    			var rows = $("#dg").datagrid("getSelections");
    			if(rows.length == 0){
    				$.messager.show({
    					 title:'错误提示',  
	    	             msg:'至少要选择一条记录',  
	    	             timeout:2000,  
	    	             showType:'slide',
    				})
    			}else{
    				$.messager.confirm('确认对话框','您确认删除吗？',function(data){
    					if(data){
    						//1. 从获取的记录中获取相应的的id,拼接id的值，然后发送后台1,2,3,4  
    	                    var ids = "";
    						for( var i=0;i<rows.length;i++){
    							ids = ids + rows[i].id + ',';
    						}
    						ids = ids.substring(0,ids.length-1);
    						//2. 发送ajax请求
    						$.ajax({
    							url:'user/delete.do',
    							type:'post',
    							dataType:'json',
    							data:{ids:ids},
    							success:function(result){
    								if(result.status=='true'){
    									$("#dg").datagrid("uncheckAll");
	    	                            //刷新当前页，查询的时候我们用的是load，刷新第一页，reload是刷新当前页  
	    	                            $("#dg").datagrid("reload");//不带参数默认为上面的queryParams 
    								}else{
    									$.messager.show({
   				    					 title:'错误提示',  
   					    	             msg:result.msg,  
   					    	             timeout:2000,  
   					    	             showType:'slide',
   				    				})
    								}
    							},
    							error:function(){
    								$.messager.show({
  				    					 title:'错误提示',  
  					    	             msg:'无法访问后台方法',  
  					    	             timeout:2000,  
  					    	             showType:'slide',
  				    				})
    							}
    						})
    					}
    				})
    			}
    		}
    	},'-',{
    		iconCls: 'icon-edit',
    		text:'更新用户',
    		handler: function(){
    			 var rows = $("#dg").datagrid("getSelections");//判断是否有选中行记录，使用getSelections获取选中的所有行
    			 if(rows.length == 0) {  
                     //弹出提示信息  
                     $.messager.show({ //语法类似于java中的静态方法，直接对象调用  
                         title:'错误提示',  
                         msg:'至少要选择一条记录',  
                         timeout:2000,  
                         showType:'slide',  
                     });  
                 }else if(rows.length != 1) {  
                     //弹出提示信息  
                     $.messager.show({ //语法类似于java中的静态方法，直接对象调用  
                         title:'错误提示',  
                         msg:'每次只能更新一条记录',  
                         timeout:2000,  
                         showType:'slide',  
                     });  
                 } else{  
                     //1. 弹出更新的页面  
                     $("#win").window({  
                         title:"更新用户",  
                         width:400,  
                         height:600,  
                         content:'<iframe src="user/toUpdate.do?id='+rows[0].id+'" frameborder="0" width="100%" height="100%"/>'  
                     });  
                     //2.   
                 } 
    		}
    	},'-',{
    		text:"<input id='ss' name='serach' />"
    	}]
		
	})
	
	//把普通的文本框转化为查询搜索文本框
			$('#ss').searchbox({ 
 				//触发查询事件
				 searcher:function(value,name){ //value表示输入的值  
				        //添加触发代码  
				        $('#dg').datagrid('load',{//重新load，参数name指定为用户输入value  
				        	searchPhrase: value  
				        });  
				  
				}, 
				prompt:'请输入姓名关键字' 
 			}); 
})

		

/* 日期格式化 开始*/
Date.prototype.format = function (format) {  
    var o = {  
        "M+": this.getMonth() + 1, // 月  
        "d+": this.getDate(), // 日  
        "h+": this.getHours(), // 小时  
        "m+": this.getMinutes(), // 分  
        "s+": this.getSeconds(), // 秒  
        "q+": Math.floor((this.getMonth() + 3) / 3), // 刻  
        "S": this.getMilliseconds()  
        // millisecond  
    }  
    if (/(y+)/.test(format))  
        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
            .substr(4 - RegExp.$1.length));  
    for (var k in o)  
        if (new RegExp("(" + k + ")").test(format))  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
    return format;  
};  
	
	
	function formatDatebox(value) {  
    if (value == null || value == '') {  
        return '';  
    }  
    var dt;  
    if (value instanceof Date) {  
        dt = value;  
    } else {  
        dt = new Date(value);  
    }  
    return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)  
}  
/* 日期格式化结束*/
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>Insert title here</title>-->
</head>
<body>
<div id="dg"></div>
<div id="win" ></div>
</body>
</html>