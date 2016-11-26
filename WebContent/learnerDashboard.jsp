<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	<h2 align="center">Learner User Dashboard</h2>
	<h3 align="center">Available Courses</h3>
	<form action="learnerDashboard" method="get">
		<table border="2" align="center" cellpadding="5" height="50px">
			<c:forEach items="${courseList}" var="course">
				<tr>
					<td>${course.courseName}</td>
					<td>${course.instructorName}</td>
					<td>${course.startDate}</td>
					<td>${course.courseDuration}</td>
					<td>${course.courseFee}</td>
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
							<option value="${course}">${course.courseName}-${course.instructorName}-${course.startDate}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr align="right">
				<td align="right"><input type="submit" value="Pay Now!">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<h3 align="center">Your Current Schedule</h3>
	<form action="learnerDashboard" method="get">
		<table border="2" align="center" cellpadding="5" height="50px">
			<c:forEach items="${courseSchedule}" var="schedule">
				<tr>
					<td>${schedule.courseId}</td>
					<td>${schedule.courseName}</td>
					<td>${schedule.instructorName}</td>
					<td>${schedule.startDate}</td>
					<td>${schedule.courseDuration}</td>
					<td>${schedule.scheduleTime}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>