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
			%	compname = job[1].replace(" ", "_")
			<tr>
				<td><a href="/company/{{job[1]}}">{{job[1]}}</a></td>
				<td>{{job[2]}}</td>
				<td>{{job[3]}}</td>
				<td><button type="button" class="btn btn-default" onclick="resetStar(star{{job[0]}}__{{compname}})" id="star{{job[0]}}__{{compname}}"><span class="glyphicon glyphicon-star-empty"></span></button></td>
			</tr>
			<div class="hidden" id="info_star{{job[0]}}">{{job[1]}}</div>
			%end
		</tbody>
	</table>
	</div>
	<script type="text/javascript">
		function setStar() {
			//alert("in setStar - " + document.getElementById("companies").rows.length);
			for (var i = 0; i < document.getElementById("companies").rows.length; i++) {
				var nextstar = "star" + i;
			//	alert("nextstar id = " + nextstar);
				if (document.getElementById(nextstar) != null) {
					document.getElementById(nextstar).innerHTML = "<span class=\"glyphicon glyphicon-star-empty\"></span>";
					starOn[i] = 0;
				}
			}
		}
		document.addEventListener("DOMContentLoaded", setStar, false);

		var starOn = new Array(); //0 = empty
                function resetStar(info1) {
			//alert("in reset star");
			var info = info1.id;
			var arr = info.split("__");
			var id = arr[0];
			var company1 = arr[1];
			company = company1.replace(/_/g, " ");
			var starid = id.split("r")[1];
                        //%if fave == true:
			//var company = document.getElementById("info_"+id).innerHTML;
                        if (starOn[starid] == 1) {
				starOn[starid] = 0;
				
                                document.getElementById(info).innerHTML = "<span class=\"glyphicon glyphicon-star-empty\"></span>";
                        } else {
				starOn[starid] = 1;
                                //id.innerHTML = "<span class=\"glyphicon glyphicon-star\"></span>";
				document.getElementById(info).innerHTML = "<span class=\"glyphicon glyphicon-star\"></span>";
                        }
			$.get("/comp/"+company);
                }

/*              function changeStar(id) {
                        if (starOn[id] == 1) {
                                starOn[id] = 0;
				document.getElementById(id).innerHTML = "<span class=\"glyphicon glyphicon-star-empty\"></span>";

                        } else {
                                starOn[id] = 1;
				document.getElementById(id).innerHTML = "<span class=\"glyphicon glyphicon-star\"></span>";

                        }
                }
*/

	</script>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
