package com.dsms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminHomepage
 */
@WebServlet("/adminhomepage")
public class AdminHomepage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminHomepage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		if(session.getAttribute("userType")!=null){
			if(session.getAttribute("userType").equals("admin")){
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//creating connection with the database 


				Connection con;
				try {
					con = DriverManager.getConnection
							("jdbc:mysql://localhost:3306/cmpe138_Driving_School_Management_System","root","qwerty");
					PreparedStatement pst2;
					pst2 = con.prepareStatement("Select * from learner");
					ResultSet rs2 = pst2.executeQuery();
					session.setAttribute("users", rs2);
					response.setContentType("application/json");
					request.getRequestDispatcher("/adminHomePage.jsp").forward(request, response);
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}


				//PreparedStatement pst = con.prepareStatement("Select * from admin");

			}
			else{
				response.getWriter().append("You are not an admin, you are not authorised.").append(request.getContextPath());
			}
		}
		else{
			response.getWriter().append("You are not an admin, you are not authorised.").append(request.getContextPath());
		}
		System.out.println("adminHomepage");
		//response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
