<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='css/bootstrap.css' />
<link rel='stylesheet' href='css/bootstrap-theme.css' />
<script src="js/jquery-1.12.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.js"></script>   
<title>Instructor Dashboard</title>
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
	<br>
<h3 style="text-align: center;">Instructor Dashboard</h3>
Welcome ${requestScope['user'].username} !.
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url = "jdbc:mysql://localhost:3306/cmpe138_Driving_School_Management_System"
        user = "root"
        password = "qwerty"
       
    />
     
    <sql:query var="schedule"   dataSource="${myDS}">
        SELECT c_id,c_name,c_description,s_start_date,s_time FROM schedule natural join courses WHERE i_id=?;
    <sql:param value="${requestScope['user'].userId}"/>
    </sql:query>
    
    <sql:query var="learner"   dataSource="${myDS}">
        SELECT l_name,l_gender,l_contact,l_email_id,l_grade FROM learner WHERE l_choice_of_instructor=?;
    <sql:param value="${requestScope['user'].userId}"/>
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption>Schedule</caption>
            <tr>
                <th>Course ID</th>
    			<th>Course Name</th>
    			<th>Course Description</th>
    			<th>Schedule Start Date</th>
    			<th>Schedule Time</th>
            </tr>
            <c:forEach var="user" items="${schedule.rows}">
                <tr>
                    <td><c:out value="${user.c_id}" /></td>
                    <td><c:out value="${user.c_name}" /></td>
                    <td><c:out value="${user.c_description}" /></td>
                    <td><c:out value="${user.s_start_date}" /></td>
                    <td><c:out value="${user.s_time}" /></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <table border="1" cellpadding="5">
            <caption>Learners</caption>
            <tr>
                <th>Learner Name</th>
    			<th>Learner Gender</th>
    			<th>Learner Contact</th>
    			<th>Learner Email ID</th>
    			<th>Learner Grade</th>
            </tr>
            <c:forEach var="user" items="${learner.rows}">
                <tr>
                    <td><c:out value="${user.l_name}" /></td>
                    <td><c:out value="${user.l_gender}" /></td>
                    <td><c:out value="${user.l_contact}" /></td>
                    <td><c:out value="${user.l_email_id}" /></td>
                    <td><c:out value="${user.l_grade}" /></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        
        <form action="GradeController" method="post">
        <label>Change Learner Grades:</label>
        <br>
        <label>Select Student:</label>
        <select name="student">
        <c:forEach var="user" items="${learner.rows}">
            <option>${user.l_name}</option>
        </c:forEach>
        </select>
        
        <label>Select Grade:</label>
        <select name="grade">
        	<option>P</option>
        	<option>F</option>
        	<option>I</option>
        </select>
        <input type="submit" value="Change Grade">
        </form>
        
        
    </div>
</body>
</html>