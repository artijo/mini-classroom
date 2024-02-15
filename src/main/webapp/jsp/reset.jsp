<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>
	<h1>Reset Password</h1>
	<form action="/reset" method="post">
		<input type="hidden" id="email"
			name="email" value='<c:out value="${email}"></c:out>' required>
			<input type="hidden" id="role"
			name="role" value='<c:out value="${role}"></c:out>' required>
			<input type="text" id="fname" name="fname" placeholder="First Name" required><br>
			<input type="text" id="lname" name="lname" placeholder="Last Name" required><br>
			<input type="password" id="password" name="password" placeholder="Password" required><br>
			<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required><br>
			<c:if test="${not empty error}">
				<span style="color: red">${error}</span>
				<br>
				</c:if>
		<br> <input type="submit" value="Reset Password">
		</form>
</body>
</html>