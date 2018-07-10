var grid = $("#datalist").bootgrid({
  	ajax : true,
  	url : path + '/sensor/getJson.do',
  	post : function(){
  		return {
  			id : 'b0df282a-0d67-40e5-8558-c9e93b7befed',
  			sName : $("#sName").val(),
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
    	    
    	    "contro": function(column, row){
    	    	var r1 = row.r1;
    	    	var max = row.maxRange;
          		var min = row.minRange;
    	    	var contro = "";
    	    	if(max != '0' || min != '0'){
    	    		if(r1 >= max || r1 <= min) {
    	    			contro = '报警';
    	    		}
    	    	}
          		return contro;
    	    },
     
      "link": function(column, row)
	    {
	        return "<button type=\"button\" class=\"btn btn-large btn-primary command-edit\" data-row-id=\"" + row.sid + "\">&nbsp;设置参数&nbsp;</button>&nbsp;&nbsp; " ;
	    }
      }
  }).on("loaded.rs.jquery.bootgrid", function() {
	  
      grid.find(".command-edit").on("click", function(e) {
    	  var id = $(this).data("row-id");
      	  window.location.href= encodeURI(path + "/sensor/toEdit.do?id="+id);
      })
  });
	
	$('.btn_search').click(function(){
		$("#datalist").bootgrid('reload');
	});
