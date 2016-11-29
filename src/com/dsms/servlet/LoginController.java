
package com.dsms.servlet;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.text.normalizer.ICUBinary.Authenticate;
 
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	public LoginController() {
		super();
	}
 
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		RequestDispatcher rd = null;
 
		Authenticator authenticator = new Authenticator();
		String result = authenticator.authenticate(username, password);
		if (result.equals("failure")) {
			rd = request.getRequestDispatcher("/i_error.jsp");
		} else {
			rd = request.getRequestDispatcher("/LearnerDashboard.jsp");
			String userId = result;
			User user = new User(username, password, userId);
			request.setAttribute("user", user);
		} 
		rd.forward(request, response);
	}
 
}