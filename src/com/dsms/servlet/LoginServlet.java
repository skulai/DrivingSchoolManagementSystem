package com.dsms.servlet;

/**
* Learner Login module
*/

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String username = request.getParameter("Username");
		String password = request.getParameter("password");
		System.out.println("Username is" + username);
		System.out.println("Password is" + password);

		Integer learner_id = null;
		User userObject = null;
		RequestDispatcher rd = null;
		boolean successFlag = false;
		// creating connection with the database
		if (username != null && password != null) {
			learner_id = Authenticator.authenticateLearner(username, password);
			if (learner_id != null) {
				userObject = FetchUserObject.getUserObject(username);
				if (userObject != null) {
					successFlag = true;

				} else {
					successFlag = false;
				}

			} else {
				successFlag = false;

			}

			if (successFlag) {
				request.setAttribute("user", userObject);
				RequestDispatcher rd2 = request.getRequestDispatcher("/learnerDashboard.jsp");
				rd2.forward(request, response);
				return;

			} else {
				rd = request.getRequestDispatcher("/index.jsp");
				request.getSession().setAttribute("loginfailed", "true");

				// request.getSession().setAttribute(arg0, arg1);
				rd.forward(request, response);
				return;
			}

		}

	}
}