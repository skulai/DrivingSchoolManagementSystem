package com.dsms.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import java.sql.Connection;
import java.sql.SQLException;


public class Feedback extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		int learnerid = Integer.parseInt(request.getParameter("l_id"));
		int instructorid=Integer.parseInt(request.getParameter("i_id"));
		String feedback = request.getParameter("feedback");
		int rating=Integer.parseInt(request.getParameter("rating"));

		RequestDispatcher rd = null;
		PreparedStatement ps = null;
		Connection con = null;
		try{
			//loading drivers for mysql
			con = ConnectionManager.getConnection();


			//creating connection with the database 


			ps=con.prepareStatement
					("insert into taught_by(l_id,i_id,feedback,rating) values(?,?,?,?)");
			ps.setInt(1, learnerid);
			ps.setInt(2, instructorid);
			ps.setString(3, feedback);
			ps.setInt(4, rating);

			int i=ps.executeUpdate();

			if(i>0)
			{
				System.out.println("Thanks for your Feedback");
				RequestDispatcher rd2 = request.getRequestDispatcher("/index.jsp");
				rd2.forward(request, response);
				return;


			}

		}
		catch(SQLException se)
		{
			se.printStackTrace();
			se.getSQLState();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// it is a good idea to release
			// resources in a finally{} block
			// in reverse-order of their creation
			// if they are no-longer needed

			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException sqlEx) { } // ignore

				ps = null;
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException sqlEx) { } // ignore

				con = null;
			}
		}

	}

}
