package com.customercaresystem;

import java.util.List;

public interface FeedbackDBUtilInterface {
	public List<Customer> validate(String userName, String password);
	
	public boolean insertFeedback(int stars, String feedback, int cusid);
	
	public List<Feedback> getFeedback(int cusid);
	
	public List<Feedback> getAllFeedbacks();
	
	public boolean updateFeedback(int stars, String feedbackText, int cusid);
	
	public boolean deleteFeedback(int cusid);
}
