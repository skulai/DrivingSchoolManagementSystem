<%@page import="org.joda.time.Years"%>
<%@page import="org.joda.time.LocalDate"%>
<%@page import="java.time.Year"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>
<link rel='stylesheet' href='css/bootstrap.css' />
<link rel='stylesheet' href='css/bootstrap-theme.css' />
<script src="js/jquery-1.12.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.js"></script>


</head>
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
	</nav>
<br>
<br>
<br>

	<div class="container" ng-app="learStatApp"
		ng-controller="learStatCtrl">
		<h2>Learners</h2>
		<%
				String usertype = (String) session.getAttribute("userType");
				ResultSet rs = (ResultSet) session.getAttribute("users");
			%>
		<!-- <p>Listing learners and their status.....</p>  -->
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>Fullname</th>
					<th>DOB</th>
					<th>Email</th>
					<th>Activation Status</th>
					<th>Suggestions</th>
				</tr>
			</thead>
			<tbody>
				 
				<% while(rs.next()) { %>
				<tr>
					<td><%= rs.getString("l_name") %></td>
					<td><%= rs.getString("l_dob")  %></td>
					<td><%= rs.getString("l_email_id")  %></td> 
					<%if (rs.getString("l_status").equals("enr")) { %>
					<td>
					<div id="<%= rs.getString(1) %>"  style="display:none;" class="answer_list" > Activated</div>
					<button ng-click="actlear(<%= rs.getString(1) %>);"
					type="button" class="btn btn-secondary btn-sm" id="button_<%= rs.getString(1) %>"  style="display:block;" >Activate</button></td>  
					<% } 
					else {%>
					<td>Activated</td>
					<% } %>
					<%
					
					String strArray[] = rs.getString("l_dob").split("-");
					System.out.print(strArray[0]+" "+strArray[1]+" "+strArray[2]);
					LocalDate birthdate = new LocalDate (Integer.parseInt(strArray[0]), Integer.parseInt(strArray[1]), Integer.parseInt(strArray[2]));
					LocalDate now = new LocalDate();
					Years age = Years.yearsBetween(birthdate, now);
					if(age.getYears()>=16)
						out.print("<td style='color:green;'>Age "+age.getYears()+" is greater than 16");
					else
						out.print("<td style='color:red;'>Age "+age.getYears()+" is less than 16");
					
					%></td>
				</tr>
				
				<% } %>
				
			</tbody>
		</table>
		<h2><a href ="prepareSchedule.jsp"> Prepare Schedule for Courses</a></h2>
		<h2><a href ="manageOffers.jsp">Add/Remove Offers</a></h2>
		<h2><a href ="getLearnerCourse">View Learner Course Schedule</a></h2>
	</div>	
<script src="angularjs/admin_lear.js"></script>
</body>
</html>