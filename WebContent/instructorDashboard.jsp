<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Instructor Dashboard</title>
</head>
<body>
<h3>Instructor Dashboard</h3>
Welcome ${requestScope['user'].username}.
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://mydb.cf3yndxmarmx.us-west-2.rds.amazonaws.com:3306/cmpe138_Driving_School_Management_System"
        user="root" password="password"
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
        	<option>A</option>
        	<option>B</option>
        	<option>C</option>
        	<option>D</option>
        </select>
        <input type="submit" value="Change Grade">
        </form>
        
    </div>
</body>
</html>