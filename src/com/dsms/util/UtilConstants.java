/**
 * 
 */
package com.dsms.util;

/**
 * @author Rahul
 *
 */
public class UtilConstants {
	// Database credentials
	public static final String URL = "jdbc:mysql://localhost:3306/cmpe138_driving_school_management_system";
	public static final String USER = "root";
	public static final String PASS = "root";
//	public static final String PASS = "qwerty";
	private static double balance=1000; 
	public static double getBalance() {
		return balance;
	}
	public static void setBalance(double balance) {
		UtilConstants.balance = balance;
	}
}

