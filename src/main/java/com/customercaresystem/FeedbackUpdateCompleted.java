package com.customercaresystem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class FeedbackUpdateCompleted extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Handle POST request to update feedback
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        int stars = Integer.parseInt(request.getParameter("stars"));
        String feedbackText = request.getParameter("feedback");

        // Update feedback in the database using cusid
        boolean isUpdated = CustomerDBUtil.updateFeedback(stars, feedbackText, cusid);
        
        List<Feedback> fbDetails = CustomerDBUtil.getFeedback(cusid);
		request.setAttribute("fbDetails", fbDetails);
		
		List<Feedback> fbDetailsAll = CustomerDBUtil.getAllFeedbacks();
		request.setAttribute("fbDetailsAll", fbDetailsAll);

        // Redirect to allfeedbacks.jsp page after update
        if (isUpdated) {
            RequestDispatcher dis = request.getRequestDispatcher("allfeedbacks.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
	}

}
