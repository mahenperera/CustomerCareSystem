<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>All Feedbacks</title>
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

	<h2 class="all-fb-heading">All Feedbacks</h2>

    <div class="container-afb">
        <div class="outer-current-user-fb">
            <div class="user-feedback-afb">
                <c:forEach var="fb" items="${fbDetailsAll}">
                <c:if test="${fb.cusid == sessionScope.cusid}">
                        <div class="card current-user-fb">
                            <h3>${fb.cusname} (You)</h3>
                            <div class="stars-container">
                                    <c:forEach var="i" begin="1" end="${fb.stars}">
                                        <span class="gold-star">&#9733;</span>
                                    </c:forEach>
                                </div>
                            <p class="p-stars-count"><em>${fb.stars} Stars</em></p>
                            <p class="p-feedback">${fb.feedback}</p> 
                        </div> 
                        <div class="button-container">
                            <form action="FeedbackUpdate" method="post" onsubmit="return confirm('Are you sure you want to edit your feedback?');">
                                <input type="hidden" name="cusid" value="${fb.cusid}">
                                <button type="submit" class="edit-button">Edit</button>  
                            </form>
                            
                            <form action="FeedbackDelete" method="post" onsubmit="return confirm('Are you sure you want to delete your feedback?');">
                                <input type="hidden" name="cusid" value="${fb.cusid}">
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        </div>
                </c:if>
                </c:forEach>
            </div>
        </div>
        
        <h2 class="all-other-fb-heading">Other User Feedbacks</h2>
        <div class="feedback-list-afb">
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
    
    <script>
        // Check if the server passed a success message
        const insertSuccessMessage = "${insertSuccessMessage}";
        if (insertSuccessMessage) {
            alert(insertSuccessMessage);
        }
        
        const updateSuccessMessage = "${updateSuccessMessage}";
        if (updateSuccessMessage) {
            alert(updateSuccessMessage);
        }
    </script>
    
</body>
</html>