/**
 * 
 */
package com.dsms.entity;
/**
 * @author Rahul
 *
 */
public class LearnerAvailableCoursesVO {
	private String courseName;
	private String instructorName;
	private String startDate;
	private String courseDuration;
	private String courseFee;
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getInstructorName() {
		return instructorName;
	}
	public void setInstructorName(String instructorName) {
		this.instructorName = instructorName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getCourseDuration() {
		return courseDuration;
	}
	public void setCourseDuration(String courseDuration) {
		this.courseDuration = courseDuration;
	}
	public String getCourseFee() {
		return courseFee;
	}
	public void setCourseFee(String courseFee) {
		this.courseFee = courseFee;
	}
	@Override
	public String toString() {
		return "courseName=" + courseName + ", instructorName=" + instructorName
				+ ", startDate=" + startDate + ", courseDuration=" + courseDuration + ", courseFee=" + courseFee;
	}
	
}
