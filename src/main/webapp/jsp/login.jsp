<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="./login.css">
</head>
<body>
   <!--  <h1>เข้าสู่ระบบ</h1>
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
	</form> -->
	
	<div class="container">
        <div class="content">
            <h1>เข้าสู่ระบบ</h1>
	<form action="/login" method="post">
		<label for="role" class="titel">คุณเป็น: </label>
		<input type="radio" id="role" name="role" value="student" required>นักเรียน/นักศึกษา
		<input type="radio" id="role" name="role" value="teacher" required>ครู/อาจารย์
		<br>
			<label for="email" class="titel" >Email :</label>
			<input type="email" id="email" name="email" required>
		<br>
			<br>
			<label for="password" class="titel">Password:</label>
			<input type="password" id="password" name="password" required>
		<br>
		<c:if test="${not empty error}">
		    <p class="error">${error}</p>
		 </c:if>
			<br>
			<input type="submit" value="Login">
	</form>
            <br>
            <p class="titelregis">ยังไม่มีบัญชีผู้ใช้ ? <a href="/register">สมัครสมาชิก</a></p>
        </div>
    </div>
</body>

</html>