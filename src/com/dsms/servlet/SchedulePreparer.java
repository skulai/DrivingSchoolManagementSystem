/**
 * 
 */
package com.dsms.servlet;

import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author ****thi
 *
 */
public class SchedulePreparer extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public SchedulePreparer() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {



		/*String oldstring = request.getParameter("s_start_date");
		Date s_start_date;
		try {
			s_start_date = new SimpleDateFormat("yyyy-MM-dd").parse(oldstring);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}


		String s_date= new SimpleDateFormat("dd/MM/yyyy",Locale.getDefault()).format(s_start_date);
		 */
		String s_start_date = request.getParameter("s_start_date");
		//String s_status = request.getParameter("s_status");
		//String s_slot = request.getParameter("s_slot");
		String i_id = request.getParameter("i_id");
		//String c_id = request.getParameter("c_id");
		String s_time = request.getParameter("s_time");	    
		RequestDispatcher rd = null;

		try{
			Connection con = ConnectionManager.getConnection();


			PreparedStatement pst2 = con.prepareStatement("Select i_course_choice from instructor where i_id=?");
			//PreparedStatement pst = con.prepareStatement("Select * from admin");
			pst2.setString(1, i_id);
			ResultSet rs2 = pst2.executeQuery();
			
			if (rs2.next()) {
				
				String c_id = rs2.getString("i_course_choice");
				System.out.println("Got the course choice");

				Statement st = con.createStatement();
				int i = st.executeUpdate("insert into schedule(s_start_date, s_status, s_slot, i_id, c_id,s_time)"+ "values ('" + s_start_date + "','A','1','" +i_id + "','" +c_id + "','" +s_time + "')");
				if (i > 0) {
					System.out.println("Inserted successfully in the DB");
					PreparedStatement st2 = con.prepareStatement("update instructor set i_status='A' where i_id=?");
					st2.setString(1, i_id);
					st2.executeUpdate();


					rd = request.getRequestDispatcher("/scheduleAdd.jsp");

					rd.forward(request, response);
				} 
				//rd.forward(request, response);



			}
			else {
				response.setContentType("application/json");
				//response.setCharacterEncoding("UTF-8");
				response.getWriter().write("{\"statusCode\" : \"401\"}");
				System.out.println("Invalid");

			}







		} catch(Exception e) {
			System.out.println(e);
		}
	}

}

