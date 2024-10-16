<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Feedback</title>
	<link rel="stylesheet" href="feedback_styles.css">
</head>
<body>
    <c:forEach var="fb" items="${feedbackForUpdate}">

	<div class="container">
		<div class="feedback-form">
			<div class="feedback-form-headings">
				<h1>Edit Feedback</h1>
				<h4>Edit your feedback below and apply changes...</h4>
			</div>
			<form action="FeedbackUpdateCompleted" method="post">
				<div class="star-section">
					<div class="stars" onclick="selectStars(1)"></div>
					<div class="stars" onclick="selectStars(2)"></div>
					<div class="stars" onclick="selectStars(3)"></div>
					<div class="stars" onclick="selectStars(4)"></div>
					<div class="stars" onclick="selectStars(5)"></div>
				</div>
				<input type="hidden" name="stars" id="starsInput" value="">
				<div class="feedback-form-bottom-section">
					<div class="fbText">
						<textarea name="feedback" id="fb_note" rows="6" cols="50">${fb.feedback}</textarea>
					</div>
					<button type="submit" name="fb-submit">Apply Changes</button>
				</div>
				<input type="hidden" name="cusid" value="${fb.cusid}">
			</form>
		</div>

		<div class="feedback-list">
    		<h2>Other User Feedbacks</h2>
       		<c:forEach var="fb1" items="${fbDetailsAll}">
           		<c:if test="${fb1.cusid != sessionScope.cusid}">
               		<div class="card">
               			<h3>${fb1.cusname}</h3>
						   <div class="stars-container">
							<c:forEach var="i" begin="1" end="${fb1.stars}">
								<span class="gold-star">&#9733;</span>
							</c:forEach>
						</div>
                   		<p class="p-stars-count"><em>${fb1.stars} Stars</em></p>
                   		<p class="p-feedback">${fb1.feedback}</p>
               		</div>
           		</c:if>
       		</c:forEach>
    	</div>
		
		<script src="feedback.js"></script>
		
		<script>
			let initialStars = parseInt("${fb.stars}");
			selectStars(initialStars);
		</script>

		</c:forEach>
	</div>
</body>
</html>