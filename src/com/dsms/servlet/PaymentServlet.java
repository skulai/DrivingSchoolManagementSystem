/**
 * 
 */
package com.dsms.servlet;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dsms.entity.LearnerPaymentDetailsVO;
import com.dsms.entity.TransactionVO;
import com.dsms.util.DatabaseOperations;
import com.dsms.util.UtilConstants;

/**
 * @author Rahul
 *
 */
public class PaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cardNumber = request.getParameter("CCNo");
			String cardLastFour = cardNumber.substring(cardNumber.length()-4);
			DatabaseOperations dbOper = new DatabaseOperations();
			LearnerPaymentDetailsVO paymentDetails = new LearnerPaymentDetailsVO();
			paymentDetails.setLearnerId(UtilConstants.getLearnerId());
			paymentDetails.setPayeeFirstName(request.getParameter("firstName"));
			paymentDetails.setPayeeLastName(request.getParameter("lastName"));
			paymentDetails.setPayeeAddress(request.getParameter("address"));
			paymentDetails.setPayeeZip(request.getParameter("zip"));
			paymentDetails.setCardDetails(cardLastFour);
			paymentDetails.setCvc(request.getParameter("CVC"));
			paymentDetails.setValidity(request.getParameter("CCExpiresMonth")+"-"+request.getParameter("CCExpiresYear"));
			paymentDetails.setEmail(request.getParameter("contactEmail"));
			
			TransactionVO transVo = new TransactionVO();
			String transId = UUID.randomUUID().toString();
			transVo.setTransactionId(transId);
			//transVo.setTransactionId("Tx009");
			transVo.setLearnerId(UtilConstants.getLearnerId());
			transVo.setTransactionStatus("Processing");
			transVo.setCardNumber(cardLastFour);
			transVo.setAmount(request.getParameter("courseFee"));
			
			boolean insertStatus = dbOper.insertCardDetails(paymentDetails, transVo);
			boolean insertLearnerStatus = dbOper.insertLearnerDataAfterPayment(Float.parseFloat(transVo.getAmount()));
			
			if(insertStatus && insertLearnerStatus){
				RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("failure.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
