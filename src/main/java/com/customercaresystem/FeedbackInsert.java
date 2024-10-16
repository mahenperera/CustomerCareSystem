package com.customercaresystem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


public class FeedbackInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stars = Integer.parseInt(request.getParameter("stars"));
		String feedback = request.getParameter("feedback");

		boolean isTrue;
		
		HttpSession session = request.getSession();
	    Integer cusid = (Integer) session.getAttribute("cusid");
		
	    if (cusid == null) {
	        System.out.println("Error");
	    }
		
		isTrue = CustomerDBUtil.insertFeedback(stars, feedback, cusid);
		
		List<Feedback> fbDetails = CustomerDBUtil.getFeedback(cusid);
		request.setAttribute("fbDetails", fbDetails);
		
		List<Feedback> fbDetailsAll = CustomerDBUtil.getAllFeedbacks();
		request.setAttribute("fbDetailsAll", fbDetailsAll);
		
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("allfeedbacks.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
