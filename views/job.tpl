<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Career Link</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
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
              <li class="active"><a href="profile">Profile</a></li>
              <li><a href="search">Search</a></li>
              <li><a href="events">Events</a></li>
              <li><a href="careerFair">Career Fair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	
	<div class="container">
		<h1 id="title">{{job[1]}}</h1>
		<h3 id="company"><a href="/company/{{job[2]}}">{{job[2]}}</a></h2>
		<button type="button" class="btn btn-success">Apply Now</button>
		<p id="description">{{job[4]}}</p>
		<h4>Details</h4>
		<table class="table table-striped" id="jobs">
		  <thead>
			<tr>
				<th>Position</th>
				<th>Location</th>
				<!--th>Date Posted</th-->
				<th>Deadline</th>
			</tr>
		  </thead>
		  <tbody>
			<tr>
				<td>{{job[6]}}</td>
				<td>{{job[3]}}</td>
				<td>{{job[7]}}</td>
			</tr>
		  </tbody>
		</table>
		<div class='panel-footer'>
			<div class='container'>
				<select multiple data-role="tagsinput" class="tags" placeholder="Insert your tags here!"></select>
			</div>
		</div>
	</div>
	
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) 
    <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>-->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>
