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
	
	private static int learnerId;
	public static int getLearnerId() {
		return learnerId;
	}
	public static void setLearnerId(int learnerId) {
		UtilConstants.learnerId = learnerId;
	}
	
	private static int learnerInstructor;
	private static int scheduleId;
	private static String courseId;
	private static String offerId;
	public static int getLearnerInstructor() {
		return learnerInstructor;
	}
	public static void setLearnerInstructor(int learnerInstructor) {
		UtilConstants.learnerInstructor = learnerInstructor;
	}
	public static int getScheduleId() {
		return scheduleId;
	}
	public static void setScheduleId(int scheduleId) {
		UtilConstants.scheduleId = scheduleId;
	}
	public static String getCourseId() {
		return courseId;
	}
	public static void setCourseId(String courseId) {
		UtilConstants.courseId = courseId;
	}
	public static String getOfferId() {
		return offerId;
	}
	public static void setOfferId(String offerId) {
		UtilConstants.offerId = offerId;
	}
}

