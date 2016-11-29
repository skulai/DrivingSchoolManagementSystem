<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h3>Instructor Login</h3>
	<form action="instructorLoginController" method="post">
		Enter username : <input type="text" name="username"> <BR>
		Enter password : <input type="password" name="password"> <BR>
		<input type="submit" />
		Not Yet Registered!! <a href="i_reg.jsp">Register Here</a>
	</form>
</body>
</html>