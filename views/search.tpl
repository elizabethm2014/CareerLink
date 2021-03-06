<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Career Link - Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet">
    <style>
      body {
        padding-top: 70px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
      .search {
      	padding-bottom: 20px;
      }
      .card-title {
      	font-size:28px;
      	font-weight:500;
      }
    </style>

  </head>

  <body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="/home">Home</a></li>
              <li><a href="/profile">Profile</a></li>
              <li class="active"><a href="/search">Search</a></li>
              <li><a href="/events">Events</a></li>
              <li><a href="/careerFair">Career Fair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div id="main" class="container">
		<div class="row search">
    		<form role="form">
    		    <div class="input-group">
					<input id="search" type="text" class="form-control input-sm" placeholder="Search here - enter keywords, company names, locations, position type, etc.">
    		        <span class="input-group-btn">
        		        <button class="btn btn-default btn-sm" type="submit"><span class="glyphicon glyphicon-search"></span></button>
    			    </span>
      			 </div>
  		  </form>
		</div>
		
		<div id="template" class="hidden">
			<div class='panel panel-default'>
    <div class='panel-heading'>
    	<div class='row'>
    		<div class='col-md-8'>
    			<span class='card-title'></span>
    		</div>
    		<div class='col-md-4'>
    			<div class='pull-right'><a class="apply"><button type='submit' class='btn btn-lg btn-success'>Apply Now!</button></a></div>
    		</div>
    	</div>
    </div>
  	<div class='panel-body'>
  		<div class='row'>
  			<div class='col-md-8 text description'>
    		</div>
    		<div class='col-md-2'>
    			<ul class='list-group'>
  					<li class='list-group-item'><strong>Company: </strong><span class='company'></span></li>

  					<a class='list-group-item positions'>
  						   <strong class='list-group-item-heading'>Positions</strong>
    				</a>
  						
				</ul>

			</div>
    		<div class='col-md-2'>
					<ul class='list-group'>
    					<li class='list-group-item'><strong>Due: </strong><span class='label label-danger pull-right due'></span></li>
    					<a class='list-group-item locations'>
  						    <strong class='list-group-item-heading'>Locations</strong>
    					</a>
					</ul>
    				</div>

    	</div>
  	</div>
  	<div class='panel-footer'>
  		<div class='container'>
  		<select multiple data-role="tagsinput" class="tags" placeholder="Insert your tags here!"></select>
  		</div>
  	</div>
</div>
		</div>
</ul>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    
	<script>
    	var tags = [];
	function renderElement(elements){
		if(elements == null){return;}
		var id = elements.id;
		$('<div/>', {'id':id}).appendTo("#main");
		$("#"+id).prepend($("#template").html());
		
		$('#'+id+' .card-title').text(elements.name);
		$('#'+id+' .text').text(elements.text);
		$('#'+id+' .company').text(elements.company);
		$('#'+id+' .due').text(elements.due);
		$('#'+id+' .positions').append("<br><small class='list-group-item-text'>"+elements.positions+"</small>");
		$('#'+id+' .description').text(elements.description);	
		$('#'+id+' .locations').append("<br><small class='list-group-item-text'>"+elements.locations+"</small>");
		$('#'+id+' .apply').attr("href", "/job/"+id);
	
		var i=0;
		while(tag = elements.tags[i++]){
			$('#'+id+' .tags').append("<option value='"+tag+"'>"+tag+"</option>")
		}
		$('#'+id+' .tags').change(function() { 
			var tagVal = $('#'+id+' .tags').val();
			$.get( "/tag/"+elements.id+"/"+tagVal );
});
}		
	% count = 0
	% setdefault('jobs', 'None')
	% print str(count) 
	%if jobs is not None:
	%	for job in jobs:
			{{!"var v"+str(count)+" = "+job+";"}}
			{{!"renderElement(v"+str(count)+");"}}
	%		count += 1
	%	end
	%end
$('#search').keypress(function(e) {
  if (e.which == '13') {
	var query = $('#search').val();
	query.replace(/ /g,'+');	
	window.location = "/search/0/"+query;
	return false;
   }
});
    </script>
    
  </body>
<footer>
<div class="text-center">
<ul class="pagination">
%if max < 4:
%if current==0:
<li class="disabled"><a>&laquo;</a></li>
%else:
<li> <a href="/search/{{current//4-1}}/{{query}}">&laquo;</a></li>
%end	
%print paginateArray
%for page in paginateArray:
%if current//4 == page:
	<li class="active"> <a href="/search/{{page}}/{{query}}">{{page+1}}</a></li>
%else:
	<li> <a href="/search/{{page}}/{{query}}">{{page+1}}</a></li>
%end
%end

%if (max-current)<4:
<li class="disabled"><a>&raquo;</a></li>
%else:
<li> <a href="/search/{{current//4+1}}/{{query}}">&raquo;</a></li>
%end
%end
</ul>
</div>
</footer>
</html>
