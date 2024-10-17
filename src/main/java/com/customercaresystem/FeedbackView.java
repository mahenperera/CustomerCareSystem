package com.customercaresystem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class FeedbackView extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FeedbackDBUtilInterface fbCtrl = new CustomerDBUtil();
		
		List<Feedback> fbDetailsAll = fbCtrl.getAllFeedbacks();
		request.setAttribute("fbDetailsAll", fbDetailsAll);

		RequestDispatcher dis = request.getRequestDispatcher("all_feedbacks_wo_current.jsp");
		dis.forward(request, response);
	}

}
