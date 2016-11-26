/**
 * 
 */
package com.dsms.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dsms.entity.LearnerAvailableCoursesVO;
import com.dsms.entity.LearnerCourseScheduleVO;
import com.dsms.util.DatabaseOperations;

/**
 * @author Rahul
 *
 */
public class LearnerDashboardServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			DatabaseOperations dboper = new DatabaseOperations();
			List<LearnerAvailableCoursesVO> courseList = dboper.getCourseDetails();
			request.setAttribute("courseList", courseList);
			
			List<LearnerCourseScheduleVO> courseSchedule = dboper.getCourseSchedule();
			request.setAttribute("courseSchedule", courseSchedule);
			
			RequestDispatcher rd = request.getRequestDispatcher("learnerDashboard.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
