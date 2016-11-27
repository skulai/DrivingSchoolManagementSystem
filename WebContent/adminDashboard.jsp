<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
	<h2 align="center">Admin Dashboard</h2>
	<h3 align="center">Current list of users and their schedule</h3>
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