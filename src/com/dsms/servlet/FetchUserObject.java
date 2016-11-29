package com.dsms.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FetchUserObject {
	
	public static User getUserObject(String uname) {
		// assume that conn is an already created JDBC connection (see previous examples)

		Statement stmt = null;
		ResultSet rs = null;
		  Connection  conn = null;
		 
		try {
			
			conn = DriverManager.getConnection
	                  ("jdbc:mysql://localhost:3306/cmpe138_driving_school_management_system","root","root");
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("select * from learner where l_username='"+uname+"'");

		    // or alternatively, if you don't know ahead of time that
		    // the query will be a SELECT...

		   while(rs.next()) {
			  int user_id =  rs.getInt("l_id");
			  String user_password =  rs.getString("l_password");
			  User userobj = new User(uname, user_password, Integer.toString(user_id));
			  return userobj;
			   
		   }
		   
		  

		    // Now do something with the ResultSet ....
		}
		catch (SQLException ex){
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
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
		
		return null;
	}

}
