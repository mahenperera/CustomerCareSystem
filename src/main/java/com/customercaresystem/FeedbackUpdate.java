package com.customercaresystem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class FeedbackUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Handle GET request to load feedback for editing
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        
        System.out.println(cusid);

        FeedbackDBUtilInterface fbCtrl = new CustomerDBUtil();
        
        // Fetch feedback details from the database using customer ID (cusid)
        List<Feedback> feedback = fbCtrl.getFeedback(cusid);
        request.setAttribute("feedbackForUpdate", feedback);
        
        List<Feedback> fbDetailsAll = fbCtrl.getAllFeedbacks();
		request.setAttribute("fbDetailsAll", fbDetailsAll);

        // Forward to updatefeedback.jsp for editing
        RequestDispatcher dis = request.getRequestDispatcher("updatefeedback.jsp");
        dis.forward(request, response);
	}
}
