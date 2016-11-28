<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>    
<head>        
<title>Instructor feedback form</title>        
<style>            
</style>    
</head>    
<body>        

<form action="Feedback" method="post">            
<fieldset>                
<legend>Learner Feedback</legend>                
Learner ID : <input type="text" name="l_id" required/><br/>
InstructorID : <input type="text" name="i_id" required/><br/>
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

</body>
</html>