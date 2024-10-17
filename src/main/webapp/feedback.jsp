<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Feedback</title>
	<link rel="stylesheet" href="feedback_styles.css">
	<link rel="stylesheet" href="headerfooter.css">
</head>
<body>

	<!-- Header Section -->
    <header>
		<div class="header-container">
			<div class="logo">
				<img src="tmklogo.png" alt="OBC Bank Logo">
			</div>
			<h1>TMK Bank Customer Care System</h1>
			<div class="icons">
				<a href="home.html" class="icon-button home-button" title="Home">
					<i class="fas fa-home"></i>
				</a>
				<a href="profile.html" class="icon-button profile-button" title="User Name">
					<i class="fas fa-user"></i>
				</a>
				<a href="logout.html" class="logout-button">Log Out</a>
			</div>
		</div>
	</header>
	
	<div class="container">
		<div class="feedback-form">
			<div class="feedback-form-headings">
				<h2>Feedback</h2>
				<h4>Provide your valuable feedback for us...</h4>
			</div>
			<form id="feedbackForm" action="FeedbackInsert" method="post" onsubmit="return  validateForm()">
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
						<textarea name="feedback" id="fbMsg" rows="6" cols="50" placeholder="Enter your feedback message here..."></textarea>
						<div class="char-counter" id="charCounter">0/500</div>
					</div>
					<button type="submit" name="fb-submit" class="button-fb">Submit</button>
				</div>
	 		</form>
		</div>
	
    	<div class="feedback-list">
    		<h2>Other User Feedbacks</h2>
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
	
	<!-- Footer Section -->
    <footer>
        <div class="contact-info">
            <p>Contact us : 0112345656</p>
            <p>Email: <a href="mailto:tmkbankcustomercare@gmail.com">tmkbankcustomercare@gmail.com</a></p>
        </div>
        <div class="social-media">
            <button class="b_social" onclick="window.location ='https://www.instagram.com/'"><i class="fa-brands fa-instagram"></i></button>
            <button class="b_social" onclick="window.location ='https://www.facebook.com/'"><i class="fa-brands fa-square-facebook"></i></button>
            <button class="b_social" onclick="window.location ='https://www.messenger.com/'"><i class="fa-brands fa-facebook-messenger"></i></button>
        </div>
    </footer>
	
	<!-- Link to FontAwesome for icons -->
	<script src="https://kit.fontawesome.com/10047d289b.js" crossorigin="anonymous"></script>

	<script src="feedback.js"></script>
</body>
</html>