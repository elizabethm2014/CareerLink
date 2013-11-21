<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Career Link</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet">
	<style>
		body {
			padding-top: 50px; /* 60px to make the container go all the way to the bottom of the topbar */
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
              <li><a href="/search">Search</a></li>
              <li><a href="/events">Events</a></li>
              <li><a href="/careerFair">Career Fair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	


      <div class="jumbotron">
	<div class="container">
        <h1 id="name"></h1>
        <p id="description" class="lead"></p>
	<a class="btn btn-lg btn-success pull-right" role="button">Apply Now!</a>
	</div>
	</div>
	<div class="container">
      <div class="row marketing">
        <div class="col-md-4">
          <h4>Company</h4>
          <p id="company"></p>
	</div>
	<div class="col-md-4">
          <h4>Locations</h4>
          <div id="locations"></div>

        </div>

        <div class="col-md-4">
          <h4>Positions</h4>
          <div id="positions"></div>

        </div>
	</div>
	</div>
	<hr>
	<div class="container">
	<select id="tags" multiple data-role="tagsinput" class="tags" placeholder="Insert your tags here!"></select>
	</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script type="text/javascript">
		
        function renderElement(elements){
                if(elements == null){return;}
                var id = elements.id;
		$('#name').text(elements.name);
                $('#description').text(elements.description);
                $('#company').text(elements.company);
                $('#positions').append("<p>"+elements.positions+"</p>")
                $('#locations').append("<p>"+elements.locations+"</p>")

                var i=0;
                while(tag = elements.tags[i++]){
                        $('#tags').append("<option value='"+tag+"'>"+tag+"</option>")
                }
                $('#tags').change(function() {
                        var tagVal = $('#tags').val();
                        $.get( "/tag/"+elements.id+"/"+tagVal );
		});
	}
	
	function renderElement2(element) {
		if(element == null) {return;}
		var id = element.id;
		
		document.getElementById("job").innerHTML = "<h1>" + element.name + "</h1>";
		document.getElementById("job").innerHTML+="<h3>"+element.company+"</h3>";
                document.getElementById("job").innerHTML+="<div class=\"pull-right\"><button type=\"button\" class=\"btn btn-success\" id=\"apply\">Apply</button></div>";
		document.getElementById("job").innerHTML+="<p>Position(s): "+element.positions+"</p>";
		document.getElementById("job").innerHTML+="<div><p>Location(s): "+element.locations+"</p><div>";
		document.getElementById("job").innerHTML+="<p>" +element.description+"</p>";
		
		var i=0;
                while(tag = element.tags[i++]){
                        $('#'+id+' .tags').append("<option value='"+tag+"'>"+tag+"</option>")
                }
                $('#'+id+' .tags').change(function() {
                        var tagVal = $('#'+id+' .tags').val();
                        $.get( "/tag/"+element.id+"/"+tagVal );
                });


	}


        % count = 0
        % setdefault('jobs', 'None')
        %if job is not None:
                        {{!"var v"+str(count)+" = "+job+";"}}
                        {{!"renderElement(v"+str(count)+");"}}
        %               count += 1
        %end


		$("apply").click( function() {
			var id = element.id
			$.get("/apply/"+id);
		});
	</script>
	
		 
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
	
  </body>
</html>
