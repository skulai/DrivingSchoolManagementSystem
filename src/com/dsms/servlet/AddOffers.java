/**
 * 
 */
package com.dsms.servlet;

import java.io.IOException;
import java.sql.Connection;
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
public class AddOffers extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public AddOffers() {
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
		String o_id = request.getParameter("o_id");
		String o_name = request.getParameter("o_name");
		String o_discount = request.getParameter("o_discount");
		String o_validity = request.getParameter("o_validity");
		String o_description = request.getParameter("o_description");
		String msgString = null;
		RequestDispatcher rd = null;

		try{
			Connection con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			int i = st.executeUpdate("insert into offers(o_id,o_name, o_discount, o_validity, o_description)"+ "values ('" + o_id + "','" + o_name + "','" + o_discount + "','" +o_validity + "','" +o_description+"')");
			if (i > 0) {
				msgString ="Offer Added Successfully! Go ahead to add more";	    	
			} 
			else{
				msgString =" Offer was not added! Check again";
			}
			request.setAttribute("msgString", msgString);
			rd = request.getRequestDispatcher("/manageOffers.jsp");
			rd.forward(request, response);
		} catch(Exception e) {
			System.out.println(e);
		}
	}

}

