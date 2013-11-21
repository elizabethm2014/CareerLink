<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <style>
		body {
  			padding-top: 80px;
		}
		.search {
			padding-top: 20px;
		}
		.cal {
			padding-top: 20px;
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
            <li class="active"><a href="/home">Home</a></li>
              <li><a href="/profile">Profile</a></li>
              <li><a href="/search">Search</a></li>
              <li><a href="/events">Events</a></li>
              <li><a href="/careerFair">Career Fair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
<div class="container">
	<div class="page-header">
  		<h1>CareerLink <small>Home Page</small></h1>
	</div>
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
	<div class="cal">
		<center>
			<iframe src="https://www.google.com/calendar/embed?title=Career%20Events&amp;mode=WEEK&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=9f5hlenimagao051c35m5c16co%40group.calendar.google.com&amp;color=%23182C57&amp;src=en.usa%23holiday%40group.v.calendar.google.com&amp;color=%232F6309&amp;ctz=America%2FChicago" style=" border-width:0 " width="800" height="600" frameborder="0" scrolling="no"></iframe>
		</center>
	</div>
</div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>

<script>
$('#search').keypress(function(e) {
  if (e.which == '13') {
	var query = $('#search').val();
	query.replace(/ /g,'+');	
	window.location = "/search/0/"+query;
	return false;
   }
});
</script>

</html>
