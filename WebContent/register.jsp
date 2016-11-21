<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
<script type="text/javascript">
	function validateForm() {
		var errorMsg;
		alert(1);
		var x = document.forms["registerform"]["l_name"].value;
		if (x == "" || x.length == 0) {
			errorMsg = "Name cannot be empty \n";

		}
		
		var phone_numer = document.forms["registerform"]["contact"].value;
		if (phone_numer == "" || phone_numer.length == 0) {
			errorMsg = errorMsg + "Phone Number Cannot be Empty\n";
		} else {
			var phoneRe = /^[2-9]\d{2}[2-9]\d{2}\d{4}$/;
			var digits = phone_numer.replace(/\D/g, "");
			var validPhone = phoneRe.test(digits);
			if (!validPhone) {
				errorMsg = errorMsg + "Phone Number is invalid\n";
			}
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
			alert(form_dob);
			var valid_date = isValidDate(form_dob);
			if(!valid_date) {
				errorMsg = errorMsg + "Please enter a valid DOB in mm/dd/yyyy format \n";
			} else {
				
				 	var parts = form_dob.split("/");
				    var day = parseInt(parts[1], 10);
				    var month = parseInt(parts[0], 10);
				    var year = parseInt(parts[2], 10);
				    alert(year);
				    var currentyear = new Date().getFullYear();
				    alert(currentyear);
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
</script>
<body>
        <form  name="registerform" method="post" action="LeanerRegister" onsubmit="return validateForm();">
       
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                 <tr>
                 <td colspan="2" > 
                  <INPUT TYPE="radio" name="user_type" VALUE="Learner" CHECKED> Learner
         		   <BR>
         	   <INPUT TYPE="radio"  name="user_type" VALUE="Instructor"> Instructor
           		 <BR>
                 
                 </td>
                      
                    </tr>
                    
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="l_name" value="" /></td>
                    </tr>
                      
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="contact" value="" /></td>
                    </tr>
                     <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="address" value="" /></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><input type="text" name="dob" value="" /></td>
                    </tr>
                     <tr>
                        <td>Gender</td>
                        <td>
                        <select name="gender">
    						<option value="male">Male</option>
							<option value="female">Female</option>
						 </select>
						 </td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">User name exists!! <a href="index.jsp">Login</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>