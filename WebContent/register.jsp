<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
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
<script type="text/javascript">
	function validateForm() {
		var errorMsg="";
		
		var x = document.forms["registerform"]["l_name"].value;
		if (x == "" || x.length == 0) {
			errorMsg = "Name cannot be empty \n";

		}
		
		var phone_numer = document.forms["registerform"]["contact"].value;
		if (phone_numer == "" || phone_numer.length == 0) {
			errorMsg = errorMsg + "Phone Number Cannot be Empty\n";
		} else {
			var validPhone = validatephonenumber(phone_numer);
			//if (!validPhone) {
			//	errorMsg = errorMsg + "Phone Number is invalid .\n";
			//}
		}

		

		
			var form_email_id = document.forms["registerform"]["email"].value;
			if (form_email_id == "" || form_email_id.length == 0) {
				errorMsg = errorMsg + "Email address Cannot be Empty\n";
			} else {
				var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				var email_valid = re.test(form_email_id);
				if (!email_valid) {
					errorMsg = errorMsg + "Email address is invalid\n";
				}
			}
		
			var form_dob = document.forms["registerform"]["dob"].value;
			//alert(form_dob);
			var valid_date = isValidDate(form_dob);
			if(!valid_date) {
				errorMsg = errorMsg + "Please enter a valid DOB in mm/dd/yyyy format \n";
			} else {
				
				 	var parts = form_dob.split("/");
				    var day = parseInt(parts[1], 10);
				    var month = parseInt(parts[0], 10);
				    var year = parseInt(parts[2], 10);
				    //alert(year);
				    var currentyear = new Date().getFullYear();
				    //alert(currentyear);
				    if(currentyear - year < 18) {
				    	errorMsg = errorMsg + "You should be atleast 18 years to register as a learner \n";
				    }
				
			}
		
			
			var form_username = document.forms["registerform"]["username"].value;
			if (form_username == "" || form_username.length == 0) {
				errorMsg = errorMsg + "Username Cannot be Empty\n";
			}
			
			var form_password = document.forms["registerform"]["password"].value;
			if (form_password == "" || form_password.length == 0) {
				errorMsg = errorMsg + "Password Cannot be Empty\n";
			}
	
		if (!(errorMsg == "" || errorMsg.length == 0)) {
			alert(errorMsg);
			return false;
		}
		
		return true;

	}
	
	
	
	function isValidDate(dateString)
	{
	    // First check for the pattern
	    if(!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString))
	        return false;

	    // Parse the date parts to integers
	    var parts = dateString.split("/");
	    var day = parseInt(parts[1], 10);
	    var month = parseInt(parts[0], 10);
	    var year = parseInt(parts[2], 10);

	    // Check the ranges of month and year
	    if(year < 1000 || year > 3000 || month == 0 || month > 12)
	        return false;

	    var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	    // Adjust for leap years
	    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
	        monthLength[1] = 29;

	    // Check the range of the day
	    return day > 0 && day <= monthLength[month - 1];
	};
	
	
	function validatephonenumber(inputtxt) {
		  var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
		  
		  if(inputtxt.match(phoneno)) {
		    return true;
		  }
		  else {
		    return false;
		  }
		}
</script>
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
	<br>
        <form  name="registerform" method="post" action="LearnerRegister" onsubmit="return validateForm(); " class="col-sm-3 center col-md-offset-2 col-md-4">
        <div class="form-group" class="col-sm-3 center col-md-offset-2 col-md-4">
            <center>
            <br><br>
            <%
            String userExists = (String) request.getSession().getAttribute("userExists");
 			System.out.println(userExists);
 			if(userExists !=null && userExists.equals("true")) {
 			%>
 			<br><br><br><br>
 			<span class="blink_text">UserName Already exists</span>
 			<%
 			}
 			request.getSession().removeAttribute("userExists");
 			%>
            <table border="1" width="30%" cellpadding="5" class="table" class="col-sm-3 center col-md-offset-2 col-md-4">
                <thead>
                    <tr>
                        <th colspan="2">Enter Learner Information Here</th>
                    </tr>
                </thead>
                <tbody>
              <!--    <tr>
                 <td colspan="2" > 
                  <INPUT TYPE="radio" name="user_type" VALUE="Learner" CHECKED> Learner
         		   <BR>
         	   <INPUT TYPE="radio"  name="user_type" VALUE="Instructor"> Instructor
           		 <BR>
                 
                 </td>
                      
                    </tr> -->
                    
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="l_name" value="" class="form-control" /></td>
                    </tr>
                      
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="contact" value="" class="form-control" /></td>
                    </tr>
                     <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value="" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" value="" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td>Date of Birth(mm/dd/yyyy)</td>
                        <td><input type="text" name="dob" value="" class="form-control"/></td>
                    </tr>
                     <tr>
                        <td>Gender</td>
                        <td>
                        <select name="gender" class="form-control">
    						<option value="male">Male</option>
							<option value="female">Female</option>
						 </select>
						 </td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="username" value=""  class="form-control"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" class="btn btn-success"/></td>
                      
                    </tr>
                    <tr>
                        <td colspan="2">Already have a user account ? <a href="index.jsp">Login</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
            </div>
        </form>
    </body>
</html>