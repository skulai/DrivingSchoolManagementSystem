<hr/>  
<%  
String profile_msg=(String)request.getAttribute("profile_msg");  
if(profile_msg!=null){  
out.print(profile_msg);  
}  
String login_msg=(String)request.getAttribute("login_msg");  
if(login_msg!=null){  
out.print(login_msg);  
}  
 %>  
 
 
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
 <br/>  
<form action="learnerlogincontroller" method="post">  

<h1> Driving School Management System </h1>
<br>
	<%
 			String loginfailed = (String) request.getSession().getAttribute("loginfailed");
 			System.out.println(loginfailed);
 			if(loginfailed !=null && loginfailed.equals("true")) {
 			
 			%>
 			<br><br><br><br>
 			<span class="blink_text">Login Failed. Please try again.</span> <br><br>
 			<%
 			}
 			 request.getSession().removeAttribute("loginfailed");
 			%>
Username : <input type="text" name="Username" required/><br/><br/>  
Password : <input type="password" name="password" required/><br/><br/>  
<input type="submit" value="login"/> 
<br/><br/>  
<a href="register.jsp"> Do not have an account ? Register Here </a>
</form>  
