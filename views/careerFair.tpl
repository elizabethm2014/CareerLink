<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Career Link - Career Fair</title>
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
            <li><a href="/home">Home</a></li>
              <li><a href="/profile">Profile</a></li>
              <li><a href="/search">Search</a></li>
              <li><a href="/events">Events</a></li>
              <li class="active"><a href="/careerFair">Career Fair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

	<div class="container">
    
	<table class="table table-striped" id="companies">
 		<thead>
			<tr>
				<th>Company</th>
				<th>Website</th>
				<th>Location(s)</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			%for job in jobs:
			<tr>
				<td><a href="/company/{{job[1]}}">{{job[1]}}</a></td>
				<td>{{job[2]}}</td>
				<td>{{job[3]}}</td>
				<td><button type="button" class="btn btn-default" id="star{{job[0]}}"></button></td>
			</tr>
			%end
		</tbody>
	</table>
	</div>
	<script type="text/javascript">
		function setStar() {
			for (var i = 0; i < document.getElementById("companies").rows -1; i++) {
				var nextstar = "star" + i;
				document.getElementById(nextstar).innerHTML = "<span class=\"glyphicon glyphicon-star-empty\"></span>";
			}
		}
		document.addEventListener("DOMContentLoaded", setStar, false);
	</script>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
