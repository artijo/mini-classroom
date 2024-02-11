<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
    <h1>เข้าสู่ระบบ</h1>
	<form action="/login" method="post">
		<label for="role">คุณเป็น: </label>
		<input type="radio" id="role" name="role" value="student" required>นักเรียน/นักศึกษา
		<input type="radio" id="role" name="role" value="teacher" required>ครู/อาจารย์
		<br>
			<label for="email">Email :</label>
			<input type="text" id="email" name="email" required>
		<br>
			<br>
			<label for="password">Password:</label>
			<input type="password" id="password" name="password" required>
		<br>
			<br>
			<input type="submit" value="Login">
	</form>
</body>
</html>