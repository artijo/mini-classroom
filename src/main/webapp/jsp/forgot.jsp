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
	<form action="/reset" method="post">
	<label>คุณเป็น: </label>
	    <input type="radio" id="student" name="role" value="student" required>
	    <label for="student">นักเรียน</label>
	    <input type="radio" id="teacher" name="role" value="teacher" required>
	    <label for="teacher">ครู</label><br>
	            <br>
		<label for="email">Email:</label> <input type="email" id="email"
			name="email" required><br>
			<label for="password">รหัสผ่านใหม่</label>
			<input type="password" id="password" name="password" required><br>
			<label for="passwordcf">ยืนยันรหัสผ่าน</label>
			<input type="password" id="passwordcf" name="passwordcf" required><br>
			<c:if test="${not empty error}">
			    <c:out value="${error}"></c:out>
			  </c:if>
		<br> <input type="submit" value="Submit">
	</form>
	<br>
	<a href="login">Back to Login</a>
</body>
</html>