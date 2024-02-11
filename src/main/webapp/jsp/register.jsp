<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
<h1>ลงทะเบียน</h1>
	<form action="/register" method="post">
		<label>คุณเป็น: </label>
		<input type="radio" id="student" name="role" value="student">นักเรียน/นักศึกษา
		<input type="radio" id="teacher" name="role" value="teacher">ครู/อาจารย์ <br><br>
		<label for="studentid">รหัสนักศึกษา</label>
		<input type="text" id="studentid" name="studentid" required><br><br>
		<label for="fname">ชื่อ</label> 
		<input type="text" id="fname" name="fname" required><br><br>
		<label for="lname">นามสกุล</label>
		<input type="text" id="lname" name="lname" required><br><br>
		<label for="email">อีเมล</label>
		<input type="email" id="email" name="email" required><br><br>
		<label for="password">รหัสผ่าน</label>
		<input type="password" id="password" name="password" required><br><br>
		<label for="passwordconfirme">ยืนยันรหัสผ่าน</label>
		<input type="password" id="passwordconfirme" name="passwordconfirme" required><br><br>
		<input type="submit" value="ลงทะเบียน">
	</form>
</body>
</html>