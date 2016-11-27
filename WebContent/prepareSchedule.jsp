<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prepare Schedule</title>
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
                        <td>Status</td>
                        <td><input type="text" name="s_status" value="" /></td>
                    </tr>
                     <tr>
                        <td>Slot</td>
                        <td><input type="text" name="s_slot" value="" /></td>
                    </tr>
                    <tr>
                        <td>Instructor ID</td>
                        <td><input type="text" name="i_id" value="" /></td>
                    </tr>
                    <tr>
                        <td>Course Id</td>
                        <td><input type="text" name="c_id" value="" /></td>
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