<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Career Link - Profile</title>
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
	
	<script type="application/javascript">
		var username;

		function readCookie(name) {
			var i, c, ca, nameEQ = name + "=";
			ca = document.cookie.split(';');
			for(i=0;i < ca.length;i++) {
				c = ca[i];
				while (c.charAt(0)==' ') {
					c = c.substring(1,c.length);
				}
				if (c.indexOf(nameEQ) == 0) {
					//alert("found cookie - name = " + name);
					return c.substring(nameEQ.length,c.length);
				}
			}
			return '';
		}
	
		function loadJSON()
		{
			//get username from cookie
			username = readCookie("account");
			var name;
			var major;
			var year;
			if (username == "james") {
				name = "James Thompson";
				major = "chemical engineering";
				year = "sophomore";
			}
			else if (username == "leah") {
				name = "Leah Brown";
				major = "biology";
				year = "senior";
			} else if (username == "tiffany") {
				name = "Tiffany Young";
				major = "marketing";
				year = "junior";
			} else {
				name = "Paul Jones";
				major = "computer science";
				year = "senior";
			}
			document.getElementById("student_name").innerHTML = name+" <small>"+ year+" | "+major+"</small>";
		}		
	
		function addJob(job)
		{	
			//get all jobs
			var jobtable = document.getElementById("tagged_jobs");
			var id = "job_" + job.id;
			var row = jobtable.insertRow(1);
			var cell1 = row.insertCell(0);
			cell1.innerHTML="<button type=\"button\" class=\"btn btn-default btn-sm\" id=\""+ id+"\" onclick=\"DeleteJob("+job.id+")\"><span class=\"glyphicon glyphicon-trash\"></span></button>";
			var cellTitle = row.insertCell(1);
			cellTitle.innerHTML = job.title;
			var cellComp = row.insertCell(2);
			cellComp.innerHTML = job.company;
			var cellLoc = row.insertCell(3);
			cellLoc.innerHTML = job.locations
			var cellDead = row.insertCell(4);
			cellDead.innerHTML = job.deadline;
				//document.getElementById(id).addEventListener("click", DeleteJob(jsonObj.tagged_jobs[i].id), false);
		}
				
				//get all companies
		function addCompany(company)
		{	
			var cmptable = document.getElementById("fave_companies");
			var row2 = cmptable.insertRow(1);
			var cell2 = row2.insertCell(0);
			cell2.innerHTML="<button type=\"button\" class=\"btn btn-default btn-sm\" onclick=\"RemoveCompany("+company.id+")\"><span class=\"glyphicon glyphicon-trash\"></span></button>";
			var cellTitle = row2.insertCell(1);
			cellTitle.innerHTML=company.name;
			var cellCareer = row2.insertCell(2);
			cellCareer.innerHTML = "<p><span class=\"glyphicon glyphicon-ok\"></span></p>";
		}
				
		//get all documents
		function addDocument(doc) 
		{		
			var doctable = document.getElementById("documents");
			var row3 = doctable.insertRow(1);
			var cellEdit = row3.insertCell(0);
			//cellEdit.innerHTML="<button type=\"button\" class=\"btn btn-default btn-sm\" formtarget=\"_blank\" onclick=\"window.open(\'"+jsonObj.doc_links[k].link+"\')><span class=\"glyphicon glyphicon-pencil\"></span></button>"; 
			cellEdit.innerHTML="<a href=\"" +doc.link+"\"><span class=\"glyphicon glyphicon-pencil\"></span></a>";
			var cellDelete = row3.insertCell(1);
			cellDelete.innerHTML="<button type=\"button\" class=\"btn btn-default btn-sm\" onclick=\"DeleteDoc("+doc.id+")\"><span class=\"glyphicon glyphicon-trash\"></span></button>";
			var cell3 = row3.insertCell(2);
			cell3.innerHTML=doc.title;			  
		 }

		document.addEventListener("DOMContentLoaded", loadJSON, false);
		
		
	</script>
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
	<h1 id="student_name"></h1>
		<div class="panel-group" id="accordion">
		  <div class="panel panel-default">
			<div class="panel-heading">
			  <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
				  Tagged Jobs
				</a>
			  </h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse">
			  <div class="panel-body">
			  </div>
			  <table class="table" id="tagged_jobs">
					<thead>
						<tr>
							<th></th>
							<th>Job Title</th>
							<th>Company</th>
							<th>Location(s)</th>
							<th>Deadline</th>
							<!--th>Posted</th-->
						</tr>
					</thead>
					<tbody>
						
						%for item in jobs:
						<tr>
							<!--script type="text/javascript">alert({{item}});
							alert({{item[0]}});</script-->
							<td><button type="button" class="btn btn-default btn-sm" onclick="DeleteJob({{item[0]}})"><span class="glyphicon glyphicon-trash"></span></button></td>
							<td>{{item[1]}}</td>
							<td>{{item[2]}}</td>
							<td>{{item[3]}}</td>
							<td>{{item[4]}}</td>
						</tr>	
						%end
					</tbody>
				</table>
			</div>
			%for item in jobs:
			<p>start of item</p>
			<p>{{item}}</p>
			<p>end of item<p>
			%end
		  </div>
		  <div class="panel panel-default">
			<div class="panel-heading">
			  <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				  Favorite Companies
				</a>
			  </h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse">
			  <div class="panel-body">
			  </div>
			  <table class="table" id="fave_companies">
				<thead>
					<tr>
						<th></th>
						<th>Company</th>
						<th>Career Fair</th>
					</tr>
				</thead>
				<tbody>
					%for comp in fave_comps:
					<tr>
						<td><button type="button" class="btn btn-default btn-sm" id="{{comp}}" onclick="DeleteJob({{comp}})"><span class="glyphicon glyphicon-trash"></span></button></td>
						<td><a href="/company/{{comp}}">{{comp}}</a></td>
						<td><center><span class="glyphicon glyphicon-ok"></span></center></td>
					</tr>
					%end
				</tbody>
			  </table>
			</div>
		  </div>
		  <div class="panel panel-default">
			<div class="panel-heading">
			  <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
				  Resumes, Cover Letters, and other Documents
				</a>
			  </h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse">
			  <div class="panel-body">
			  </div>
			  <table class="table" id="documents">
				<thead>
					<tr>
						<th></th>
						<th></th>
						<th>Document</th>
						<!--<th>Last Updated On</th>-->
					</tr>
				</thead>
				<tbody>
					%for key in docs:
					<tr>
						<td><button type="button" class="btn btn-default btn-sm" id="{{key}}" onclick="DeleteJob({{key}})"><span class="glyphicon glyphicon-trash"></span></button></td>
						<td><button type="button" class="btn btn-default btn-sm"><a href="{{docs[key]}}"><span class="glyphicon glyphicon-pencil"></span></a></button></td>
						<td>{{key}}</td>
					</tr>
					%end
				</tbody>
			  </table>
			  <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> Add Document</button>
			</div>
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
