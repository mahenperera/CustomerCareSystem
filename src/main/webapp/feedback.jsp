<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Feedback</title>
	<link rel="stylesheet" href="feedback_styles.css">
	<style>
        
    </style>
</head>
<body>
	
	<div class="container">
		<div class="feedback-form">
			<div class="feedback-form-headings">
				<h1>Feedback</h1>
				<h4>Provide your valuable feedback for us...</h4>
			</div>
			<form action="FeedbackInsert" method="post">
				<div class="star-section">
					<div class="stars" onclick="selectStars(1)"></div>
					<div class="stars" onclick="selectStars(2)"></div>
					<div class="stars" onclick="selectStars(3)"></div>
					<div class="stars" onclick="selectStars(4)"></div>
					<div class="stars" onclick="selectStars(5)"></div>
				</div>
	     		<input type="hidden" name="stars" id="starsInput">
				<div class="feedback-form-bottom-section">
					<div class="fbText">
						<textarea name="feedback" id="fb_note" rows="6" cols="50"></textarea>
					</div>
					<button type="submit" name="fb-submit">Submit</button>
				</div>
	 		</form>
		</div>
	
    	<div class="feedback-list">
    		<h2>All Other Feedbacks</h2>
       		<c:forEach var="fb" items="${fbDetailsAll}">
           		<c:if test="${fb.cusid != sessionScope.cusid}">
               		<div class="card">
               			<h3>${fb.cusname}</h3>
						   <div class="stars-container">
							<c:forEach var="i" begin="1" end="${fb.stars}">
								<span class="gold-star">&#9733;</span>
							</c:forEach>
						</div>
                   		<p class="p-stars-count"><em>${fb.stars} Stars</em></p>
                   		<p class="p-feedback">${fb.feedback}</p>
               		</div>
           		</c:if>
       		</c:forEach>
    	</div>
	</div>
	
	 
	<script src="feedback.js"></script>
</body>
</html>