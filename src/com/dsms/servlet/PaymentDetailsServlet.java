/**
 * 
 */
package com.dsms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dsms.util.DatabaseOperations;

/**
 * @author Rahul
 *
 */
public class PaymentDetailsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String s = request.getParameter("dropDown").toString();
			String courseFee = null;
			String slot = null;
			if (s.contains("courseFee=")) {
				String[] courseDetails = s.split("courseFee=");
				String courseFeeData = courseDetails[1];
				String[] courseFeeDetails = courseFeeData.split(",");
				courseFee = courseFeeDetails[0];
			}

			if (s.contains("slot=")) {
				String[] scheduleDetails = s.split("slot=");
				String scheduleData = scheduleDetails[1];
				String[] schedule = scheduleData.split(",");
				slot = schedule[0];
				System.out.println(slot);
			}

			String discount = request.getParameter("dropDown2").toString();
			float discountValue = 0;
			int discountDB = 0;
			if (!discount.equals("select")) {
				discountValue = Float.parseFloat(discount);
				discountDB = Integer.parseInt(discount);
			}
			float fee = (Float.parseFloat(courseFee)) * (1 - (discountValue) / 100);

			DatabaseOperations dbOper = new DatabaseOperations();
			dbOper.getDetailsfromSlot(slot, discountDB);
			
			request.setAttribute("courseFee", Float.toString(fee));
			RequestDispatcher rd = request.getRequestDispatcher("paymentDetails.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
