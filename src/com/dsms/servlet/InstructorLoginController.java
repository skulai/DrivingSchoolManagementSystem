package com.dsms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dsms.util.CryptWithMD5;

/**
 * Servlet implementation class InstructorLoginController
 */
@WebServlet("/ilogin")
public class InstructorLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstructorLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password0 = request.getParameter("password");
		String password = CryptWithMD5.crypt(password0);

		System.out.println("Encrypted Password"+password);
		RequestDispatcher rd = null;
 
		Authenticator authenticator = new Authenticator();
		String result = authenticator.authenticate(username, password);
		if (result.equals("failure")) {
			rd = request.getRequestDispatcher("/i_error.jsp");
		} else {
			rd = request.getRequestDispatcher("/instructorDashboard.jsp");
			String userId = result;
			User user = new User(username, password, userId);
			request.setAttribute("user", user);
		} 
		rd.forward(request, response);
	}

}
