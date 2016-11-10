package helloworld.register;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Random;

public class LeanerRegister extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
	
        String name = request.getParameter("l_name");
        System.out.println("eureka");
        String contact=request.getParameter("contact");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String dob=request.getParameter("dob");
        String gender=request.getParameter("gender");
        String username = request.getParameter("username");
        System.out.println("saka");
        String password = request.getParameter("password");
        System.out.println("mika");
        try{
        
        //loading drivers for mysql
        Class.forName("com.mysql.jdbc.Driver");

	//creating connection with the database 
          Connection  con=DriverManager.getConnection
                     ("jdbc:mysql://localhost:3306/drivingschool","root","cisco123");

        PreparedStatement ps=con.prepareStatement
                  ("insert into learner(l_name,l_contact,l_email_id,l_dob,l_gender,l_username,l_password) values(?,?,?,?,?,?,?,?)");
        ps.setString(1, "PK"+ (new Random()).nextInt(10000));
        ps.setString(2, name);
        ps.setString(3, contact);
        ps.setString(4, email);
        ps.setDate(5, new Date(System.currentTimeMillis()));
        ps.setString(6, gender);
        ps.setString(7, username);
        ps.setString(8, password);
        int i=ps.executeUpdate();
        
          if(i>0)
          {
            System.out.println("Thanks for your registration");
          }
        
        }
        catch(Exception se)
        {
            se.printStackTrace();
        }
	
      }
  }