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

	<h1>Edit Feedback</h1>
	<h4>Edit your feedback</h4>
	
	<form action="FeedbackUpdateCompleted" method="post">
	     <div class="stars" onclick="selectStars(1)"></div>
	     <div class="stars" onclick="selectStars(2)"></div>
	     <div class="stars" onclick="selectStars(3)"></div>
	     <div class="stars" onclick="selectStars(4)"></div>
	     <div class="stars" onclick="selectStars(5)"></div>
	     <input type="hidden" name="stars" id="starsInput" value="">
	     <div class="fbText">
	         <textarea name="feedback" id="fb_note" rows="6" cols="50">${fb.feedback}</textarea>
	     </div>
	     <button type="submit" name="fb-submit">Apply Changes</button>
	     <input type="hidden" name="cusid" value="${fb.cusid}">
	 </form>
	 
	 <script src="feedback.js"></script>
	 
	 <script>
        let initialStars = parseInt("${fb.stars}");
        selectStars(initialStars);
    </script>

	</c:forEach>

</body>
</html>