package com.dsms.servlet;

/**
* Learner Login module
*/
 
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
 

public class LoginServlet extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String username = request.getParameter("Username");
        String password= request.getParameter("password");
        System.out.println("Username is" + username);
        System.out.println("Password is" + password);
        try {
            Class.forName("com.mysql.jdbc.Driver");
          //creating connection with the database 
            Connection  con=DriverManager.getConnection
                       ("jdbc:mysql://localhost:3306/drivingschool","root","cisco123");
            PreparedStatement pst = con.prepareStatement("Select l_username,l_password from learner where l_username=?");
            pst.setString(1, username);
            //pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                System.out.println("Valid!!");
            }
            else {
                System.out.println("Invalid");
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}