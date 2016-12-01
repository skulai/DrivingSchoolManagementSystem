<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Console</title>
<link rel='stylesheet' href='css/bootstrap.css' />
<link rel='stylesheet' href='css/bootstrap-theme.css' />
<script src="js/jquery-1.12.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.js"></script>


</head>
<body>
<body>
	<br>

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
				<li><a ref="#home" class="smoothScroll">Admin Console</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<!-- Home Page
    ==========================================-->

	<br>

	<!-- LoginIn Sign In 
    ==========================================-->
	<a name="loginsignin"></a>

	<div class="section section-signin text-center" >
		<br> <br> <br> <br> <br>
		<div class="row">
			<div
				class="panel panel-default col-sm-6 center col-md-offset-2 col-md-8"
				style="max-width: 400px; margin-left: auto; margin-right: auto;" >
				<div class="panel-body" role="tabpanel">

					<ul class="nav nav-pills">
						<li class="active"><a data-toggle="pill" href="#do-signin">Login</a></li>
					</ul>

					<!-- forms container -->
					<div class="tab-content">

						<!-- sign in -->
						<div role="tabpanel" class="tab-pane active" id="do-signin"
							ng-app="login" ng-controller="login">
							<h3 class="text-center">Sign in</h3>
							<p class="text-center">
								<br> Please use the form below to sign in to your account.
								<br>
							</p>
							<div class="form">
								<div class="form-group">
									<label class="sr-only">username <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" ng-model="username" name="username"
										placeholder="username" required="required">
								</div>
								<div class="form-group">
									<label class="sr-only">Password <span
										class="text-danger">*</span></label> <input type="password"
										class="form-control" name="password" ng-model="password"
										placeholder="Password" required="required">
								</div>

								<div class="col-md-12" style="margin: 10px;">
									<div class="alert alert-danger" ng-hide="invalid_login">
										<strong>Incorrect username or password</strong>
									</div>
									<div class="alert alert-danger" ng-hide="unexpected_error">
										<strong>Unexpected error, try again</strong>
									</div>

									<input type="submit" class="btn btn-success"
										ng-click="submit();" value="Login" />
								</div>
							</div>
						</div>
						<!-- end of sign in -->

					</div>
					<!-- end of forms container -->


				</div>
			</div>

		</div>
		<!-- /panel -->
	</div>
	<br>
	<script src="angularjs/adminlogin.js"></script>
</body>

</body>
</html>