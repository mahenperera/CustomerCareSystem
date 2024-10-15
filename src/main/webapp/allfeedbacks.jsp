<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>All Feedbacks</h1>
	
	<c:forEach var="fb" items="${fbDetails}">
	
	feid: ${fb.feid} <br>
	stars: ${fb.stars} <br>
	feedback: ${fb.feedback} <br>
	cusid: ${fb.cusid} <br>
	
	
	
	 <form action="FeedbackUpdate" method="get">
        <input type="text" name="cusid" value="${fb.cusid}">
        <button type="submit">Edit Feedback</button>
    </form>
    
    </c:forEach>

</body>
</html>