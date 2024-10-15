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


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("uid");
		String password = request.getParameter("pass");
		
		try {
			List<Customer> cusDetails = CustomerDBUtil.validate(username, password);
			request.setAttribute("cusDetails", cusDetails);
			
			if (!cusDetails.isEmpty()) {
	            HttpSession session = request.getSession();
	            Customer loggedInCustomer = cusDetails.get(0);
	            int cusid = loggedInCustomer.getId();
	            session.setAttribute("cusid", cusid);
	            
	         // Check if the user has already submitted feedback
                List<Feedback> fbDetails = CustomerDBUtil.getFeedback(cusid);
                request.setAttribute("fbDetails", fbDetails);
                
                List<Feedback> fbDetailsAll = CustomerDBUtil.getAllFeedbacks();
        		request.setAttribute("fbDetailsAll", fbDetailsAll);
                
                if (fbDetails != null && !fbDetails.isEmpty()) {
                    // User has already submitted feedback, redirect to all feedbacks page
                	
                	//List<Feedback> fbDetails = CustomerDBUtil.getFeedback(cusid);
            		
            		
            		
                	
                    //response.sendRedirect("allfeedbacks.jsp");
                    
                    RequestDispatcher dis = request.getRequestDispatcher("allfeedbacks.jsp");
    	    		dis.forward(request, response);
                    
                    return; // Ensure no further code execution
                } else {
                    // No feedback found, show the feedback form
                	RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
    	    		dis.forward(request, response);
                }
	            
	            
	        } else {
	        	// Handle case where login fails (invalid username/password)
                request.setAttribute("loginError", "Invalid username or password.");
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp"); // Adjust based on your login page
                dis.forward(request, response);
	        }
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
