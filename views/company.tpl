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
              <li class="active"><a href="profile.html">Profile</a></li>
              <li><a href="search">Search</a></li>
              <li><a href="events">Events</a></li>
              <li><a href="careerFair">Career Fair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	
	<div class="container">
		<h1 id="company_name">{{company}}</h1>
		<button type="button" id="star" onclick="changeStar()" class="btn btn-default"></button>
		<h4>Available Positions</h4>
		<table class="table table-striped" id="jobs">
		  <thead>
			<tr>
				<th>Job Title</th>
				<th>Position</th>
				<th>Location</th>
				<!--<th>Date Posted</th-->
				<th>Deadline</th>
			</tr>
		  </thead>
		  <tbody>
			%for job in jobs:
			<tr>
				<td><a href="/job/{{job[0]}}">{{job[1]}}</a></td>
				<td>{{job[6]}}</td>
				<td>{{job[3]}}</td>
				<td>{{job[7]}}</td>
			</tr>
			%end
		  </tbody>
		</table>
		<h3><a href="{{jobs[0][5]}}">Visit their Website</a></h3>
	</div>

	<script>
		var starOn = 0; //0 = empty
		function setStar() {
			//%if fave == true:
			if (starOn) {
				document.getElementById("star").innerHTML = "<span class=\"glyphicon glyphicon-star\"></span>";
			} else {
				document.getElementById("star").innerHTML = "<span class=\"glyphicon glyphicon-star-empty\"></span>";
			}
		}
		
		function changeStar() {
			if (starOn == 1) {
				starOn = 0;
			} else {
				starOn = 1;
			}
			setStar();
		}

		document.addEventListener("DOMContentLoaded", setStar, false);
	</script>
	
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) 
    <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>-->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>
