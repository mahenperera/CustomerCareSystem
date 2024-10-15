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
	            session.setAttribute("cusid", loggedInCustomer.getId());
	        }
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
		dis.forward(request, response);
		
	}

}
