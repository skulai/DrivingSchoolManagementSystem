/**
 * 
 */
package com.dsms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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
		String s_status = request.getParameter("s_status");
		String s_slot = request.getParameter("s_slot");
		String i_id = request.getParameter("i_id");
		String c_id = request.getParameter("c_id");
		String s_time = request.getParameter("s_time");	    
		RequestDispatcher rd = null;

		try{
			Connection con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			int i = st.executeUpdate("insert into schedule(s_start_date, s_status, s_slot, i_id, c_id,s_time)"+ "values ('" + s_start_date + "','" + s_status + "','" + s_slot + "','" +i_id + "','" +c_id + "','" +s_time + "')");
			if (i > 0) {
				rd = request.getRequestDispatcher("/scheduleAdd.jsp");
			} 
			rd.forward(request, response);
		} catch(Exception e) {
			System.out.println(e);
		}
	}

}

