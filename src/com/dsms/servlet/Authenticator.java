
package com.dsms.servlet;
import javax.sql.*;
import java.sql.*;
 
public class Authenticator {
 
	public String authenticate(String username, String password) {
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://mydb.cf3yndxmarmx.us-west-2.rds.amazonaws.com:3306/cmpe138_Driving_School_Management_System","root","password"); 
		Statement st= con.createStatement(); 
		ResultSet rs=st.executeQuery("select * from instructor where i_username='"+username+"' and i_password ='"+password+"'"); 
		if (rs.next()) {
			return Integer.toString(rs.getInt("i_id"));
		} else {
			return "failure";
		}
	} catch(Exception e) {
		System.out.println(e);
		return "Exception";
	}
}
}