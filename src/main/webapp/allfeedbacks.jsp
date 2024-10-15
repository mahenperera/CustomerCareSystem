<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>All Feedbacks</title>
	
	<style>
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin: 10px 0;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
        }
        .user-feedback {
            background-color: #f0f8ff; /* Light blue background for logged user's feedback */
        }
        .feedback-list {
            margin-top: 20px;
        }
    </style>
</head>
<body>
	<h1>All Feedbacks</h1>

    <c:set var="loggedUserFeedback" value="false" />
    
    <c:forEach var="fb" items="${fbDetailsAll}">
        <c:if test="${fb.cusid == sessionScope.cusid}">
            <div class="card user-feedback">
                <h2>${fb.cusname} (You)</h2>
                <p><strong>Feedback ID:</strong> ${fb.feid}</p>
                <p><strong>Stars:</strong> ${fb.stars}</p>
                <p><strong>Feedback:</strong> ${fb.feedback}</p>
                <p><strong>CusID:</strong> ${fb.cusid}</p>
                
                <form action="FeedbackUpdate" method="post">
                	<input type="hidden" name="cusid" value="${fb.cusid}">
        			<button type="submit">Edit</button>
    			</form>
    			
    			<form action="FeedbackDelete" method="post" onsubmit="return confirm('Are you sure you want to delete this feedback?');">
            		<input type="hidden" name="cusid" value="${fb.cusid}">
            		<button type="submit">Delete</button>
               </form>
               
            </div>
            <c:set var="loggedUserFeedback" value="true" />
        </c:if>
    </c:forEach>
    <div class="feedback-list">
        <c:forEach var="fb" items="${fbDetailsAll}">
            <c:if test="${fb.cusid != sessionScope.cusid}">
                <div class="card">
                <h2>Feedback from User Name: ${fb.cusname}</h2>
                    <h2>Feedback from User ID: ${fb.cusid}</h2>
                    <p><strong>Feedback ID:</strong> ${fb.feid}</p>
                    <p><strong>Stars:</strong> ${fb.stars}</p>
                    <p><strong>Feedback:</strong> ${fb.feedback}</p>
                </div>
            </c:if>
        </c:forEach>
    </div>
</body>
</html>