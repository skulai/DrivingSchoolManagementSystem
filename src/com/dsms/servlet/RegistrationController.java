
package com.dsms.servlet;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
 
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	public RegistrationController() {
		super();
	}
 
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		String user = request.getParameter("uname");    
	    String pwd = request.getParameter("pass");
	    String name = request.getParameter("name");
	    String gender = request.getParameter("gender");
	    String course = request.getParameter("course");
	    RequestDispatcher rd = null;
	    
	    try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://mydb.cf3yndxmarmx.us-west-2.rds.amazonaws.com:3306/cmpe138_Driving_School_Management_System","root","password");
	    Statement st = con.createStatement();
	    int i = st.executeUpdate("insert into instructor(i_name, i_gender, i_username, i_password, i_course_choice)"+ "values ('" + name + "','" + gender + "','" + user + "','" + pwd + "','" + course + "')");
	    if (i > 0) {
	    	rd = request.getRequestDispatcher("/i_welcome.jsp");
	    } else {
	    	rd = request.getRequestDispatcher("/i_login.jsp");
	    }
		rd.forward(request, response);
	    } catch(Exception e) {
			System.out.println(e);
		}
	}
 
}