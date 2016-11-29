package com.dsms.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException  {
		
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmpe138_Driving_School_Management_System","root","root");
//		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmpe138_Driving_School_Management_System","root","qwerty");
		
		return con;
	}

}
