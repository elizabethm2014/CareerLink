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
		<div class="container">
			<div class="page-header">
				<h1>CareerLink <small>Login <span class="label label-danger">Still in Alpha!</span></small></h1>
			</div>
		
			<p class="text-danger" id="errorMessage"></p>
			<form role="form" >
			  <div class="form-group">
				<label for="username">Welcome!</label>
				<input type="text" class="form-control" id="username" placeholder="Enter username">
			  </div>
			  <button type="submit" id="submit" class="btn btn-default">Sign in</button>
			</form>
		</div>


	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>


  </body>
</html>
