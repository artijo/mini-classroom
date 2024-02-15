<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>
	<h1>Forgot Password</h1>
	<form action="/forgot" method="post">
	<label>คุณเป็น: </label>
	    <input type="radio" id="student" name="role" value="student" required>
	    <label for="student">นักเรียน</label>
	    <input type="radio" id="teacher" name="role" value="teacher" required>
	    <label for="teacher">ครู</label><br>
	            <br>
		<label for="email">Email:</label> <input type="email" id="email"
			name="email" required><br>
		<center>
			<c:if test="${not empty error}">
				<span style="color: red">${error}</span>
				<br>
				</c:if>
				<input type="submit" value="Submit">
	</form>
	<br>
	<a href="login">Back to Login</a>
</body>
</html>