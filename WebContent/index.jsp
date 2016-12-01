<head>
<link rel='stylesheet' href='css/bootstrap.css' />
<link rel='stylesheet' href='css/bootstrap-theme.css' />
<script src="js/jquery-1.12.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.js"></script>   
</head>
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
				<li><a ref="#home" class="smoothScroll">Learners Console</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
<%  
String profile_msg=(String)request.getAttribute("profile_msg");  
if(profile_msg!=null){  
out.print(profile_msg);  
}  
String login_msg=(String)request.getAttribute("login_msg");  
if(login_msg!=null){  
out.print(login_msg);  
}  
 %>  
 
 
    <style type="text/css">
.blink_text {

animation:1s blinker linear infinite;
-webkit-animation:1s blinker linear infinite;
-moz-animation:1s blinker linear infinite;

 color: red;
}

@-moz-keyframes blinker {  
 0% { opacity: 1.0; }
 50% { opacity: 0.0; }
 100% { opacity: 1.0; }
 }

@-webkit-keyframes blinker {  
 0% { opacity: 1.0; }
 50% { opacity: 0.0; }
 100% { opacity: 1.0; }
 }

@keyframes blinker {  
 0% { opacity: 1.0; }
 50% { opacity: 0.0; }
 100% { opacity: 1.0; }
 }
 </style>
 <br/>  
 <br>
<br>
<br>
<br>
<h1 class="col-sm-3 center col-md-offset-2 col-md-6"> Driving School Management System </h1>
<form action="learnerlogincontroller" method="post" class="col-sm-3 center col-md-offset-2 col-md-4">  
 <div class="form-group">

<br>
	<%
 			String loginfailed = (String) request.getSession().getAttribute("loginfailed");
 			System.out.println(loginfailed);
 			if(loginfailed !=null && loginfailed.equals("true")) {
 			
 			%>
 			<br><br><br><br>
 			<span class="blink_text">Login Failed. Please try again.</span> <br><br>
 			<%
 			}
 			 request.getSession().removeAttribute("loginfailed");
 			%>
<label class="sr-only">Username : </label><input class="form-control" placeholder="username" type="text" name="Username" required/><br/><br/>  
<label class="sr-only">Password : </label><input class="form-control" placeholder="password" type="password" name="password" required/><br/><br/>  
<input type="submit" class="btn btn-success" value="login"/> 
<br/><br/>  
<a href="register.jsp"> Do not have an account ? Register Here </a>
</div>
</form>  

