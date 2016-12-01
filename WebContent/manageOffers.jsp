<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Offers</title>
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
		
        <form  name="addOfferform" method="post" action="addOffer">
       
            <center>
            <p style="color: red;">${msgString}</p>
            <br><br>
           
 			
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Add Offers</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                        <td>Offer ID</td>
                        <td><input type="text" name="o_id" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Offer name</td>
                        <td><input type="text" name="o_name" value="" /></td>
                    </tr>
                      
                    <tr>
                        <td>Offer Discount</td>
                        <td><input type="text" name="o_discount" value="" /></td>
                    </tr>
                     <tr>
                        <td>Offer Validity</td>
                        <td><input type="text" name="o_validity" value="" /></td>
                    </tr>
                    <tr>
                        <td>Offer Description</td>
                        <td><input type="text" name="o_description" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit"/></td>                    
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>