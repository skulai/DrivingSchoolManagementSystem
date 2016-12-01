<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
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
				<li><a ref="#home" class="smoothScroll">Learners Registration</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
	
	<br>
	<br>
	<br>
	<h2 align="center">Learner User Dashboard</h2>
	<h3 align="center">Available Courses</h3>
	<form action="learnerlogincontroller" method="get">
		<table border="2" align="center" cellpadding="5" height="50px">
		<tr>
			<td>Course</td>
			<td>Instructor</td>
			<td>Start Date</td>
			<td>Duration (Month)</td>
			<td>End Date</td>
			<td>Fees</td>
			<td>Scheduled Time</td>
			<td>Rating</td>
		</tr>
			<c:forEach items="${courseList}" var="course">
				<tr>
					<td align="center">${course.courseName}</td>
					<td align="center">${course.instructorName}</td>
					<td align="center">${course.startDate}</td>
					<td align="center">${course.courseDuration}</td>
					<td align="center">${course.endDate}</td>
					<td align="center">${course.courseFee}</td>
					<td align="center">${course.slot}</td>
					<td align="center">${course.rating}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<form action="paymentDetails" method="post">
		<table align="center" cellpadding="5" height="50px">
			<tr>
				<td>Please Select your Course:</td>
				<td><select name="dropDown">
						<option value="select">--select--</option>
						<c:forEach items="${courseList}" var="course">
							<option value="${course}">${course.courseName}-${course.instructorName}-${course.startDate}-${course.slot}</option>
						</c:forEach>
				</select></td>
				<td>Please Select Offer:</td>
				<td><select name="dropDown2">
						<option value="select">--select--</option>
						<c:forEach items="${offerList}" var="offer">
							<option value="${offer}">${offer.offerValue}</option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<h4 align="center"><input type="submit" value="Pay Now!"></h4>
	</form>
	<br>
	<br>
	<br>
	<h3 align="center">Your Current Schedule</h3>
	<form action="learnerlogincontroller" method="get">
		<table border="2" align="center" cellpadding="5" height="50px">
		<tr>
			<th>Course ID</th>
			<th>Course Name</th>
			<th>Instructor Name</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Time</th>
		</tr>
			<c:forEach items="${courseSchedule}" var="schedule">
				<tr>
					<td align="center">${schedule.courseId}</td>
					<td align="center">${schedule.courseName}</td>
					<td align="center">${schedule.instructorName}</td>
					<td align="center">${schedule.startDate}</td>
					<td align="center">${schedule.endDate}</td>
					<td align="center">${schedule.scheduleTime}</td>
				</tr>
			</c:forEach>
		</table>
		<c:forEach items="${courseSchedule}" var="schedule">
			<h3 align="center">Your Grade for the registered course is:
				${schedule.grade}</h3><br>
				<div style="text-align:center">
				<a href="Feedback.jsp" align="center">Give Feedback</a>
				</div>
		</c:forEach>
	</form>
</body>
</html>