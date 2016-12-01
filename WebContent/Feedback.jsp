<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.dsms.servlet.ConnectionManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>    
<head>        
<title>Instructor feedback form</title>        
<style>            
</style> 
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
				<li><a ref="#home" class="smoothScroll">Learners Console</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
	
	<br>
	<br>
	<br>
	<br>
	<div style="text-align: center;">
<form action="Feedback" method="post" >            
<fieldset>
<%
String l_id = session.getAttribute("l_id").toString();
//out.print("-----------------");
//out.print(l_id);
//out.print("-----------------");
//String l_id = "1";
Class.forName("com.mysql.jdbc.Driver"); 
//java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmpe138_Driving_School_Management_System","root","root");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmpe138_Driving_School_Management_System","root","qwerty");

PreparedStatement pst = con.prepareStatement("select i.i_id, i.i_name from(Select * from learner where l_id=?) t inner join instructor i on t.l_choice_of_instructor = i.i_id;");
pst.setString(1, l_id);
//PreparedStatement pst = con.prepareStatement("Select * from admin");
//pst.setString(1, name);
//pst.setString(2, password);
ResultSet rs = pst.executeQuery();
String i_id = null;
String i_name = null;
if (rs.next()) {
	//out.print(rs.getString("i_id"));
	//out.print(rs.getString("i_name"));
	i_id = rs.getString("i_id");
	i_name = rs.getString("i_name");
	//response.setCharacterEncoding("UTF-8");
	//response.getWriter().write("{\"statusCode\" : \"100\"}");


}

%>                
<legend>Learner Feedback</legend>                
<input type="hidden" name="l_id" value='<% out.print(l_id); %>' required/>
<input type="hidden" name="i_id"  value='<% out.print(i_id); %>'required/>
<label for="IName">Instructor Name: </label> <% out.print(i_name); %><br>
<label for="feedback">Feedback</label> 
<input type="text" name="feedback" /> <br/>   
<label for="rating">Rating</label> 
            <input type="radio" name="rating" value="1" class="star">
            <input type="radio" name="rating" value="2" class="star">
            <input type="radio" name="rating" value="3" class="star">
            <input type="radio" name="rating" value="4" class="star">
            <input type="radio" name="rating" value="5" class="star">
       <br/>
<input type="submit" value="submit"> 
</fieldset>        
</form>    
</div>
</body>
</html>