var grid = $("#datalist").bootgrid({
  	ajax : true,
  	url : path + '/warning/getJson.do',
  	post : function(){
  		return {
  			id : 'b0df282a-0d67-40e5-8558-c9e93b7befed',
  			sName : $("#sName").val(),
  			startTime : $("#startTime").val(),
  			endTime : $("#endTime").val(),
  		}
  	},
      formatters: {
      	"range": function(column, row){
      		var max = row.maxRange;
      		var min = row.minRange;
      		var unit1 = row.unit1;
      		var fate = "";
      		if(max != '0' || min != '0')
      		fate = min + "-" + max + " " + unit1;
      		return fate;
    	    },
	    "r1": function(column, row){
	    	var r1 = row.r1;
	    	var max = row.maxRange;
      		var min = row.minRange;
	    	var unit1 = row.unit1;
      		var fee = r1 + " " + unit1;
      		if(max != '0' || min != '0'){
      			if(r1 >= max || r1 <= min) {
    	    		r1 = '<font color = red >'+ fee +'</font>';
    	    	} 
      		}
      		return fee;
	    },
	    "isWarning": function(column, row){
	    	var is = row.isWarning;
	    	var isWarning;
      		if(is == '0'){
      			isWarning = '<font color = red >未报警</font>';
      		} else {
      			isWarning = '<font color = green >已报警</font>';
      		}
      		return isWarning;
	    },
    	    "link": function(column, row)
    	    {
    	    	var r1 = row.r1;
    	    	var max = row.maxRange;
          		var min = row.minRange;
    	    	if(max != '0' || min != '0'){
    	    		if(r1 >= max || r1 <= min) {
		    	        return "<button type=\"button\" class=\"btn btn-large btn-primary command-edit\" data-row-id=\"" + row.sid +"&"+ row.dataTime + "\">&nbsp;&nbsp;报&nbsp;警&nbsp;</button>&nbsp;&nbsp; " ; 
    	    		} else {
    	    			return "<button type=\"button\" class=\"btn btn-large btn-primary command-send\" data-row-id=\"" + row.sid +"&"+ row.dataTime + "\">&nbsp;&nbsp;正&nbsp;常&nbsp;</button>&nbsp;&nbsp; " ; 
    	    		}
    	    	}
    	    }
      }
  }).on("loaded.rs.jquery.bootgrid", function() {
	  
	  grid.find(".command-edit").on("click", function(e) {
    	  var id = $(this).data("row-id");
//      	  window.location.href= encodeURI(path + "/warning/warning.do?id="+id);
    	  warning(id);
      }).end().find(".command-send").on("click", function(e) {
    	  var id = $(this).data("row-id");
    	  send(id);
      });
	  
  });
	
	$('.btn_search').click(function(){
		$("#datalist").bootgrid('reload');
	});
	
	
	 function warning(id){
     	var flag = window.confirm("确定要发送报警短信？");
     	if(flag){
     		$.ajax({
       		   type: "POST",
       		   url:path + "/warning/warning.do?type=0",
       		   data: {
       			   id : id
       		   },
       		   dataType : 'JSON',
       		   success: function(data){
       			   var result = eval(data);
       			   $("#operate_result_info").text(result.msg);
       			   showResult();
       		   }
       		});
     	}
      }
	 
	 function send(id){
	     	var flag = window.confirm("确定要发送短信？");
	     	if(flag){
	     		$.ajax({
	       		   type: "POST",
	       		   url:path + "/warning/warning.do?type=1",
	       		   data: {
	       			   id : id
	       		   },
	       		   dataType : 'JSON',
	       		   success: function(data){
	       			   var result = eval(data);
	       			   $("#operate_result_info").text(result.msg);
	       			   showResult();
	       		   }
	       		});
	     	}
	      }
      function showResultDiv(flag) {
          if (flag)
         	 $("#operate_result_info").css('display','block');
          else
          	$("#operate_result_info").css('display','none');
          	$("#datalist").bootgrid('reload');
      }
      
      $('.btn_add').click(function(){
    	  var flag = window.confirm("确定要发送短信？");
	     	if(flag){
	     		$.ajax({
	     			type: "POST",
		       		url:path + "/warning/daysend.do",
		       		data: {
		       			startTime : $("#startTime").val(),
		      			endTime : $("#endTime").val(),
	       		   },
	       		   dataType : 'JSON',
	       		   success: function(data){
	       			   var result = eval(data);
	       			   $("#operate_result_info").text(result.msg);
	       			   showResult();
	       		   }
	     		});
	     	}
  	});
  	function showResult() {
          showResultDiv(true);
          window.setTimeout("showResultDiv(false);", 3000);
      }
