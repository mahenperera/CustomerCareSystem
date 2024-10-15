package com.customercaresystem;

public class Feedback {
	private int feid;
	private int stars;
	private String feedback;
	private int cusid;
	private String cusname;
	
	public Feedback(int feid, int stars, String feedback, int cusid, String cusname) {
		this.feid = feid;
		this.stars = stars;
		this.feedback = feedback;
		this.cusid = cusid;
		this.cusname = cusname;
	}

	public int getFeid() {
		return feid;
	}

	public int getStars() {
		return stars;
	}

	public String getFeedback() {
		return feedback;
	}

	public int getCusid() {
		return cusid;
	}
	
	public String getCusname() {
		return cusname;
	}
}
