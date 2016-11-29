/**
 * 
 */
package com.dsms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String s = request.getParameter("dropDown").toString();
		String courseFee = null;
		if (s.contains("courseFee=")) {
			String[] courseDetails = s.split("courseFee=");
			courseFee = courseDetails[1];
		}

		String discount = request.getParameter("dropDown2").toString();
		float discountValue = 0;
		if (!discount.equals("select")) {
			discountValue = Float.parseFloat(discount);
		}
		float fee = (Float.parseFloat(courseFee)) * (1 - (discountValue) / 100);
		request.setAttribute("courseFee", Float.toString(fee));
		RequestDispatcher rd = request.getRequestDispatcher("paymentDetails.jsp");
		rd.forward(request, response);
	}
}
