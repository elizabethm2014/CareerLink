<DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Career Link - Apply</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style>
		body {
			padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
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
            <li><a href="home">Home</a></li>
              <li><a href="profile">Profile</a></li>
              <li><a href="search">Search</a></li>
              <li><a href="events">Events</a></li>
              <li><a href="careerFair">Career Fair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	
	<div class="container">
	    <div class="jumbotron">
		<h1>{{job[1]}}</h1>
		<h3>{{job[2]}}</h2>
	    </div>
		<h4>Choose an existing resume or upload a new one to apply.</h4>
	        <form role="form" class="form-horizontal">
 		<p>Exisiting:</p>
		 <div class="form-group"><div class="col-sm-offset-2 col-sm-10"><div class="checkbox">
        	        %for key in docs:
        		    <label>
        		      <input type="checkbox">{{key}}
        		    </label>
                	%end
			% if len(docs) == 0 :
				<p>There are no exisiting documents.</p>
			
          	</div></div></div>
			<p>New:</p>
	  		<div class="form-group">
	    			<label class="sr-only" for="exampleInputFile">Filename: </label>
	    			<div class="col-sm-10"><input type="text" placeholder="Filename" id="exampleInputFile"></div>
			</div>
			<div class="form-group">
				<label class="sr-only" for="link">Link: </label>
				<div class="col-sm-10"><input type="text" id="link" placeholder="Link"></div>
			</div>
		</form>
		<button type="button" class="btn btn-default" onclick="AddDoc()">Submit</button>

	  </div>

               <script type="text/javascript">

                function AddDoc() {
			//add doc
                        var file = document.getElementById("exampleInputFile").value;
                        var link = document.getElementById("link").value;
                        alert("file = " + file + "and link = " + link);
                        $.get("/doc/add/"+file+"/"+link);
			//submit form
			//aka mark as applied???
			$.get("/tag/"+{{job[0]}}+"/applied");
                }
		</script>

	
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) 
    <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>-->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>

