/**
 * 
 */
package com.dsms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.dsms.entity.InstructorVO;
import com.dsms.entity.LearnerAvailableCoursesVO;
import com.dsms.entity.LearnerCourseScheduleVO;
import com.dsms.entity.LearnerPaymentDetailsVO;
import com.dsms.entity.OffersVO;
import com.dsms.entity.TransactionVO;

/**
 * @author Rahul
 *
 */
public class DatabaseOperations {
	public static Connection createDbConnection() throws SQLException, ClassNotFoundException {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(UtilConstants.URL, UtilConstants.USER, UtilConstants.PASS);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getStackTrace());
		} catch (SQLException e) {
			System.out.println("Connection Failed!:\n" + e.getMessage());
		}
		return connection;
	}

	public List<InstructorVO> getInstructorNames() throws ClassNotFoundException, SQLException {
		List<InstructorVO> instructorNames = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		Connection dbConnection = DriverManager.getConnection(UtilConstants.URL, UtilConstants.USER,
				UtilConstants.PASS);
		Statement stmt = dbConnection.createStatement();
		String query = "select i_name from instructor;";
		ResultSet result = stmt.executeQuery(query);
		while (result.next()) {
			InstructorVO inst = new InstructorVO();
			inst.setiName(result.getString("i_name"));
			instructorNames.add(inst);
		}
		return instructorNames;
	}

	public List<LearnerAvailableCoursesVO> getCourseDetails(int learnerId) throws ClassNotFoundException, SQLException {
		List<LearnerAvailableCoursesVO> coursesList = new ArrayList<>();
		Connection dbConnection = createDbConnection();
		Statement stmt = dbConnection.createStatement();
		String query = "select c_name, i_name, c_duration, c_fees, s_start_date, s_time from courses join teaches on "
				+ "courses.c_id = teaches.c_id join instructor on "
				+ "teaches.i_id=instructor.i_id join schedule on courses.c_id=schedule.c_id "
				+ "where courses.c_id not in (select c_id from learner where l_id="+learnerId+" and l_status='enr'); ";
		ResultSet result = stmt.executeQuery(query);
		while (result.next()) {
			LearnerAvailableCoursesVO course = new LearnerAvailableCoursesVO();
			course.setCourseName(result.getString("c_name"));
			course.setInstructorName(result.getString("i_name"));
			course.setStartDate(convertDatetoString(result.getDate("s_start_date")));
			course.setCourseDuration(Integer.toString(result.getInt("c_duration")));
			course.setCourseFee((result.getBigDecimal("c_fees")).toString());
			course.setSlot(result.getString("s_time"));
			String endDate = calucateEndDate(result.getDate("s_start_date"));
			course.setEndDate(endDate);
			coursesList.add(course);
		}
		return coursesList;
	}

	public List<LearnerCourseScheduleVO> getCourseSchedule(int learnerId) throws ClassNotFoundException, SQLException {
		List<LearnerCourseScheduleVO> schedule = new ArrayList<>();
		Connection dbConnection = createDbConnection();
		Statement stmt = dbConnection.createStatement();
		String query = "select courses.c_id, courses.c_name, i_name, s_start_date, courses.c_duration, s_time, l_grade "
				+ "from schedule join learner on schedule.s_id=learner.s_id join courses on schedule.c_id=courses.c_id "
				+ "join instructor on schedule.i_id=instructor.i_id where l_id="+learnerId+";";
		ResultSet result = stmt.executeQuery(query);
		while (result.next()) {
			LearnerCourseScheduleVO course = new LearnerCourseScheduleVO();
			course.setCourseId(result.getString("c_id"));
			course.setCourseName(result.getString("c_name"));
			course.setInstructorName(result.getString("i_name"));
			course.setStartDate(convertDatetoString(result.getDate("s_start_date")));
			course.setScheduleTime(result.getString("s_time"));
			String endDate = calucateEndDate(result.getDate("s_start_date"));
			course.setEndDate(endDate);
			course.setGrade(result.getString("l_grade"));
			schedule.add(course);
		}
		return schedule;
	}

	public boolean insertCardDetails(LearnerPaymentDetailsVO paymentDetails, TransactionVO transVo)
			throws SQLException {
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement1 = null;
		PreparedStatement preparedStatementUpdate = null;
		boolean status = false;
		Savepoint savepoint1 = null;
		Connection dbConnection = null;
		try {
			dbConnection = createDbConnection();
			dbConnection.setAutoCommit(false);
			savepoint1 = dbConnection.setSavepoint("Savepoint1");

			String payeeDetailsQuery = "insert into learner_payment_details values (?,?,?,?,?,?,?,?,?)";
			preparedStatement = dbConnection.prepareStatement(payeeDetailsQuery);
			preparedStatement.setInt(1, paymentDetails.getLearnerId());
			preparedStatement.setString(2, paymentDetails.getPayeeFirstName());
			preparedStatement.setString(3, paymentDetails.getPayeeLastName());
			preparedStatement.setString(4, paymentDetails.getPayeeAddress());
			preparedStatement.setString(5, paymentDetails.getPayeeZip());
			preparedStatement.setString(6, paymentDetails.getCardDetails());
			preparedStatement.setString(7, paymentDetails.getCvc());
			preparedStatement.setString(8, paymentDetails.getValidity());
			preparedStatement.setString(9, paymentDetails.getEmail());
			preparedStatement.executeUpdate();

			String transcationCreateQuery = "insert into transactions (tx_id, l_id, tx_card, tx_amt,tx_status) values (?,?,?,?,?)";
			preparedStatement1 = dbConnection.prepareStatement(transcationCreateQuery);
			preparedStatement1.setString(1, transVo.getTransactionId());
			preparedStatement1.setInt(2, transVo.getLearnerId());
			preparedStatement1.setString(3, transVo.getCardNumber());
			preparedStatement1.setString(4, transVo.getAmount());
			preparedStatement1.setString(5, transVo.getTransactionStatus());
			preparedStatement1.executeUpdate();

			if (Double.parseDouble(transVo.getAmount()) > UtilConstants.getBalance()) {
				throw new Exception();
			}
			UtilConstants.setBalance(UtilConstants.getBalance() - Double.parseDouble(transVo.getAmount()));
			
			String transcationUpdateQuery = "update transactions set tx_status=?"+ " where tx_id=?";
			preparedStatementUpdate = dbConnection.prepareStatement(transcationUpdateQuery);
			preparedStatementUpdate.setString(1, "Completed");
			preparedStatementUpdate.setString(2, transVo.getTransactionId());
			preparedStatementUpdate.executeUpdate();
			
			dbConnection.commit();
			status = true;
		} catch (Exception e) {
			status = false;
			dbConnection.rollback(savepoint1);
			e.printStackTrace();
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (dbConnection != null) {
				dbConnection.close();
			}
		}
		return status;
	}

	public List<OffersVO> getOffers() throws ClassNotFoundException, SQLException {
		List<OffersVO> offersList = new ArrayList<>();
		Connection dbConnection = createDbConnection();
		Statement stmt = dbConnection.createStatement();
		String query = "select o_discount from offers where o_status='A';";
		ResultSet result = stmt.executeQuery(query);
		while (result.next()) {
			OffersVO offers = new OffersVO();
			offers.setOfferValue(result.getInt("o_discount"));
			offersList.add(offers);
		}
		return offersList;
	}

	public int getLearnerId(String username) throws ClassNotFoundException, SQLException{
		int learnerId = 0;
		Connection dbConnection = createDbConnection();
		Statement stmt = dbConnection.createStatement();
		String query = "select l_id from learner where l_username="+"'"+username+"'"+";";
		ResultSet result = stmt.executeQuery(query);
		while (result.next()) {
			learnerId = result.getInt("l_id");
		}
		return learnerId;
	}
	
	private static String calucateEndDate(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE,30);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String endDate = sdf.format(c.getTime());
		return endDate;
	}
	private static String convertDatetoString(Date date) {
		DateFormat dFormat = new SimpleDateFormat("MM/dd/yyyy");
		return dFormat.format(date);
	}
}
