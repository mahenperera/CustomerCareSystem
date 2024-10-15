<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<c:if test="${not empty loginError}">
        <div style="color: red;">${loginError}</div>
    </c:if>
		
	<form action="LoginServlet" method="post">
		User Name: <input type="text" name="uid"><br>
		Password: <input type="password" name="pass"><br>
		<input type="submit" name="submit" value="Login">
	</form>
</body>
</html>