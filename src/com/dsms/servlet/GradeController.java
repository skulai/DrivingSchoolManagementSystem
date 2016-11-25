
package com.dsms.servlet;
 
import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.text.normalizer.ICUBinary.Authenticate;
 
public class GradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	public GradeController() {
		super();
	}
 
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
 
		String student = request.getParameter("student");
		String grade = request.getParameter("grade");

		try{
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://mydb.cf3yndxmarmx.us-west-2.rds.amazonaws.com:3306/cmpe138_Driving_School_Management_System","root","password");
		    Statement st = con.createStatement();
		    ResultSet rs=st.executeQuery("select l_id from learner where l_name='"+student+"'");
		    System.out.println(rs.next());
		    Integer l_id = rs.getInt("l_id");
		    
		    String query="UPDATE learner SET l_grade=? WHERE l_id=?";
		    PreparedStatement statement = null;
		    statement=con.prepareStatement(query);
		    statement.setString(1,grade);
		    statement.setInt(2,l_id);
		   
		    int i = statement.executeUpdate();
		    if (i > 0) {
		    	System.out.println("Update success");
		    } else {
		    	System.out.println("Update failed");
		    }
		    } catch(Exception e) {
				System.out.println(e);
			}
		}
}