<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="feedback_styles.css">
</head>
<body>
	 <c:forEach var="cus" items="${cusDetails}">
	
	${cus.id}
	${cus.name}
	${cus.email}
	${cus.phone}
	${cus.userName}
	${cus.password}
	
	</c:forEach> 
	
	<h1>Feedback</h1>
	<h4>Provide your valuable feedback for us</h4>
	<form action="FeedbackInsert" method="post">
	     <div class="stars" onclick="selectStars(1)"></div>
	     <div class="stars" onclick="selectStars(2)"></div>
	     <div class="stars" onclick="selectStars(3)"></div>
	     <div class="stars" onclick="selectStars(4)"></div>
	     <div class="stars" onclick="selectStars(5)"></div>
	     <input type="hidden" name="stars" id="starsInput">
	     <div class="fbText">
	         <textarea name="feedback" id="fb_note" rows="6" cols="50"></textarea>
	     </div>
	     <button type="submit" name="fb-submit">Submit</button>
	 </form>
	 
	<script src="feedback.js"></script>
</body>
</html>