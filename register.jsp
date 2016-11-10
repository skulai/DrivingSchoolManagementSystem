<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <form method="post" action="LeanerRegister">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="l_name" value="" /></td>
                    </tr>
                      
                    <tr>
                        <td>contact</td>
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
                        <td><input type="text" name="gender" value="" /></td>
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
                        <td><input type="submit" value="Submit" /></td>
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