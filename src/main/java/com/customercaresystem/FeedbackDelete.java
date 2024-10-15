package com.customercaresystem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class FeedbackDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        
        boolean isDeleted = CustomerDBUtil.deleteFeedback(cusid);
        
        if (isDeleted) {
            // If feedback is successfully deleted, redirect to allfeedbacks.jsp
            response.sendRedirect("feedback.jsp");
        } else {
            request.getRequestDispatcher("allfeedbacks.jsp").forward(request, response);
        }
	}

}
