package com.dsms.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dsms.util.CryptWithMD5;

import java.sql.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.ResultSet;

public class LearnerRegister extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
	
        String name = request.getParameter("l_name");
        String contact=request.getParameter("contact");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String dob=request.getParameter("dob");
        String gender=request.getParameter("gender");
        String username = request.getParameter("username");
        String password0 = request.getParameter("password");
        
        String password = CryptWithMD5.crypt(password0);
        
        RequestDispatcher rd = null;
        PreparedStatement ps = null;
        Connection conn = null;
        try{
        //loading drivers for mysql
      conn = ConnectionManager.getConnection();
        
        
        boolean userExists = checkIfUserIDExists(username);
			if (userExists) {

				System.out.println("User Exists 2!!!!");
				rd = request.getRequestDispatcher("/register.jsp");
				request.getSession().setAttribute("userExists", "true");

				// request.getSession().setAttribute(arg0, arg1);
				rd.forward(request, response);
				return;

			}
			
			
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
			java.util.Date dob_date = df.parse(dob);
			java.sql.Date dob_sql = new Date(dob_date.getDate());

	//creating connection with the database 
         

        ps=conn.prepareStatement
                  ("insert into learner(l_name,l_contact,l_email_id,l_dob,l_gender,l_username,l_password,l_status) "+" values(?,?,?,?,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, contact);
        ps.setString(3, email);
        ps.setDate(4, dob_sql);
        if(gender!=null && gender.equalsIgnoreCase("female"))
        ps.setString(5, "F");
        else if(gender!=null && gender.equalsIgnoreCase("male"))
        	ps.setString(5, "M");	
        ps.setString(6, username);
        ps.setString(7, password);
        ps.setString(8, "P");
        
        int i=ps.executeUpdate();
        
          if(i>0)
          {
            System.out.println("Thanks for your registration");
            User userobj = FetchUserObject.getUserObject(username);
            request.setAttribute("user", userobj);
            RequestDispatcher rd2 = request.getRequestDispatcher("/instructorDashboard.jsp");
            rd2.forward(request, response);
            return;
            
            
          }
        
        }
        catch(SQLException se)
        {
            se.printStackTrace();
            se.getSQLState();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		    // it is a good idea to release
		    // resources in a finally{} block
		    // in reverse-order of their creation
		    // if they are no-longer needed

		    if (ps != null) {
		        try {
		            ps.close();
		        } catch (SQLException sqlEx) { } // ignore

		        ps = null;
		    }

		    if (conn != null) {
		        try {
		            conn.close();
		        } catch (SQLException sqlEx) { } // ignore

		        conn = null;
		    }
		}
	
      }
	
	
	public boolean checkIfUserIDExists(String userId) {
		// assume that conn is an already created JDBC connection (see previous examples)

		Statement stmt = null;
		ResultSet rs = null;
		  //Connection  conn = null;
		  Integer db_count = -1;
		try {
			
			Connection con = ConnectionManager.getConnection();
		    stmt = con.createStatement();
		    rs = stmt.executeQuery("select count(*) as count from learner where l_username='"+userId+"'");

		    // or alternatively, if you don't know ahead of time that
		    // the query will be a SELECT...

		   while(rs.next()) {
			  db_count =  rs.getInt("count");
			   
		   }
		   
		   if(db_count > 0) {
			   return true;
		   } else {
			  return false;
		   }

		    // Now do something with the ResultSet ....
		}
		catch (SQLException ex){
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		    // it is a good idea to release
		    // resources in a finally{} block
		    // in reverse-order of their creation
		    // if they are no-longer needed

		    if (rs != null) {
		        try {
		            rs.close();
		        } catch (SQLException sqlEx) { } // ignore

		        rs = null;
		    }

		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException sqlEx) { } // ignore

		        stmt = null;
		    }
		}
		
		return false;
	}
  }