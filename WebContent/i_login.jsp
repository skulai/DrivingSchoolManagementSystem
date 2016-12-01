<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel='stylesheet' href='css/bootstrap.css' />
<link rel='stylesheet' href='css/bootstrap-theme.css' />
<script src="js/jquery-1.12.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.js"></script>
</head>
<body>

	<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">DSMS</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a ref="#home" class="smoothScroll">Instructors Console</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>

	<br>
	<br>
	<br>
	<h3 style="margin-left: 250px;">Instructor Login</h3>
	<form action="instructorLoginController" method="post"
		class="col-sm-3 center col-md-offset-2 col-md-4">
		<div class="form-group">
			<label class="sr-only">Username : </label><input class="form-control"
				placeholder="username" type="text" name="username" required /><br />
			<br /> <label class="sr-only">Password : </label><input
				class="form-control" placeholder="password" type="password"
				name="password" required /><br />
			<br /> <input type="submit" class="btn btn-success" /> Not Yet
			Registered!! <a href="i_reg.jsp">Register Here</a>
		</div>
	</form>
</body>
</html>