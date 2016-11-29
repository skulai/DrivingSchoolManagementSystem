package com.dsms.servlet;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Get Request");
		response.setContentType("text/plain");

		Enumeration<String> parameterNames = request.getParameterNames();

		while (parameterNames.hasMoreElements()) {

			String paramName = parameterNames.nextElement();
			System.out.println(paramName);
			System.out.println("n");

			String[] paramValues = request.getParameterValues(paramName);
			for (int i = 0; i < paramValues.length; i++) {
				String paramValue = paramValues[i];
				System.out.println("t" + paramValue);
				System.out.println("n");
			}

		}
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(name);
		System.out.println(password);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Post Request");
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(name);
		System.out.println(password);

		StringBuilder sb = new StringBuilder();
		BufferedReader br = request.getReader();
		String str = null;
		while ((str = br.readLine()) != null) {
			sb.append(str);
		}
		System.out.println(sb.toString());
		JSONParser parser = new JSONParser();
		JSONObject json;
		try {
			json = (JSONObject) parser.parse(sb.toString());
			name = (String) json.get("username");
			password =  (String) json.get("password");
			System.out.println(name);
			try {
				Class.forName("com.mysql.jdbc.Driver");
				//creating connection with the database 


				Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement("Select a_name,a_password from admin where a_name=? and a_password=?");
				//PreparedStatement pst = con.prepareStatement("Select * from admin");
				pst.setString(1, name);
				pst.setString(2, password);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("userType", "admin");
					System.out.println("Valid!!");

					//response.setCharacterEncoding("UTF-8");
					response.getWriter().write("{\"statusCode\" : \"100\"}");


				}
				else {
					response.setContentType("application/json");
					//response.setCharacterEncoding("UTF-8");
					response.getWriter().write("{\"statusCode\" : \"401\"}");
					System.out.println("Invalid");
					
				}

				
				JSONArray jsonArray = new JSONArray();
				while (rs.next()) {
					int total_rows = rs.getMetaData().getColumnCount();
					JSONObject obj = new JSONObject();
					for (int i = 0; i < total_rows; i++) {

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), rs.getObject(i + 1));

					}
					jsonArray.add(obj);
				}
				System.out.println(jsonArray.toJSONString());
				con.close();


			}
			catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		//response.setContentType("text/plain");
		//response.setCharacterEncoding("UTF-8");
		//response.getWriter().write("hello from java. you entered : " + sb.toString());


		//doGet(request, response);
	}

}
