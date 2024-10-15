package com.customercaresystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<Customer> validate(String userName, String password) {
		
		ArrayList<Customer> cus = new ArrayList<>();

		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM customer WHERE username = '" + userName + "' AND password = '" + password + "'";
			rs = stmt.executeQuery(sql);		
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String userU = rs.getString(5);
				String passU = rs.getString(6);
				
				Customer c = new Customer(id, name, email, phone, userU, passU);
				cus.add(c);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cus;
	}
	
	public static boolean insertFeedback(int stars, String feedback, int cusid) {
		
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "INSERT INTO feedback VALUES (0, '" + feedback + "', '" + stars + "', " + cusid + ")";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	public static List<Feedback> getFeedback(int cusid) {
		
		ArrayList<Feedback> fb = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM feedback WHERE cusid = " + cusid;
			rs = stmt.executeQuery(sql);		
			
			if(rs.next()) {
				
				int feid = rs.getInt(1);
				String feedback = rs.getString(2);
				int stars = rs.getInt(3);
				int cusId = rs.getInt(4);
				
				Feedback f = new Feedback(feid, stars, feedback, cusId);
				fb.add(f);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return fb;
	}
	
	public static boolean updateFeedback(int stars, String feedbackText, int cusid) {
		
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE feedback SET stars = '" + stars + "', feedback = '" + feedbackText +"' WHERE cusid = " + cusid;
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}
