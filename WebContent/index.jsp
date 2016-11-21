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
 <br/>  
<form action="login" method="post">  

<h1> Driving School Management System </h1>
Username : <input type="text" name="Username" required/><br/><br/>  
Password : <input type="password" name="password" required/><br/><br/>  
<input type="submit" value="login"/> 
<br/><br/>  
<a href="register.jsp"> Do not have an account ? Register Here </a>
</form>  
