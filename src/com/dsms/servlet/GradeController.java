
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
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drivingschool","root","cisco123");
		    Statement st = con.createStatement();
		    ResultSet rs=st.executeQuery("select l_id from learner where l_name='"+student+"'");
		    Integer l_id = rs.getInt("l_id");
		    RequestDispatcher rd = null;
		    
		    String query="UPDATE learner SET l_grade=? WHERE l_id=?";
		    PreparedStatement statement = null;
		    statement=con.prepareStatement(query);
		    statement.setString(1,grade);
		    statement.setInt(2,l_id);
		   
		    int i = statement.executeUpdate();
		    if (i > 0) {
		    	rd = request.getRequestDispatcher("/i_grade.jsp");
		    } else {
		    	rd = request.getRequestDispatcher("/i_error.jsp");
		    }
		    //request.getSession().setAttribute(arg0, arg1);
		    rd.forward(request, response);
		    } catch(Exception e) {
				System.out.println(e);
			}
		}
}