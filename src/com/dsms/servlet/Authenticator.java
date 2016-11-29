
package com.dsms.servlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
public class Authenticator {
 
	public String authenticate(String username, String password) {
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmpe138_driving_school_management_system","root","root");
		Statement st= con.createStatement(); 
		ResultSet rs=st.executeQuery("select * from instructor where i_username='"+username+"' and i_password ='"+password+"'"); 
		if (rs.next()) {
			return Integer.toString(rs.getInt("l_id"));
		} else {
			return "failure";
		}
	} catch(Exception e) {
		System.out.println(e);
		return "Exception";
	}
}
	
	
	public static Integer authenticateLearner(String username, String password) {
		Connection con = null;
		Statement st= null;
		ResultSet rs = null;
		try{
		 con = ConnectionManager.getConnection();
		 st= con.createStatement(); 
		 rs=st.executeQuery("select * from learner where l_username='"+username+"' and l_password ='"+password+"'"); 
		while (rs.next()) {
			return rs.getInt("l_id");
		}
		return null;
	} catch(Exception e) {
		System.out.println(e);
		return null;
	} 		finally {
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

	    if (st != null) {
	        try {
	            st.close();
	        } catch (SQLException sqlEx) { } // ignore

	        st = null;
	    }
	    
	    if (con != null) {
	        try {
	            con.close();
	        } catch (SQLException sqlEx) { } // ignore

	        con = null;
	    }
	}
}
}