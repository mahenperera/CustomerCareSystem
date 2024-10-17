package com.customercaresystem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class FeedbackDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        
        FeedbackDBUtilInterface fbCtrl = new CustomerDBUtil();
        
        boolean isDeleted = fbCtrl.deleteFeedback(cusid);
        
        List<Feedback> fbDetailsAll = fbCtrl.getAllFeedbacks();
		request.setAttribute("fbDetailsAll", fbDetailsAll);
        
        if (isDeleted) {
        	RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
			dis.forward(request, response);
        } else {
            request.getRequestDispatcher("allfeedbacks.jsp").forward(request, response);
        }
	}

}
