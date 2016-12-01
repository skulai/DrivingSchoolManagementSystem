<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prepare Schedule</title>
        <link rel='stylesheet' href='css/bootstrap.css' />
<link rel='stylesheet' href='css/bootstrap-theme.css' />
<script src="js/jquery-1.12.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.js"></script>   
    </head>
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
				<li><a href="adminhomepage">Admin Console</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
<br>
<br>
<br>

<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url = "jdbc:mysql://localhost:3306/cmpe138_Driving_School_Management_System"
        user = "root"
        password = "qwerty"
       
    />
    
    
     
    <sql:query var="instructor"   dataSource="${myDS}">
        SELECT i_id,i_name,i_gender,i_course_choice FROM instructor WHERE i_status=?;
    <sql:param value="U"/>
    </sql:query>
    
    
  
        <form  name="scheduleform" method="post" action="prepareSchedule">
       
            <center>
            <br><br>
           
 			
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Schedule Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>Start Date</td>
                        <td><input type="date" name="s_start_date" value="" /></td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td>Instructor And Course</td>
                        <td><select name="i_id">
                    <c:forEach var="io" items="${instructor.rows}">
                          <option value="${io.i_id}" />${io.i_name} | ${io.i_gender} | ${io.i_course_choice}</option>
                    </c:forEach>
  						
					</select></td>
                    </tr>
                     <tr>
                        <td>s_time</td>
                        <td><input type="text" name="s_time" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>