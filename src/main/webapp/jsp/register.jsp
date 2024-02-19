<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="w-screen h-screen flex justify-center items-center bg-[url('http://localhost:8899/image/Cute-Anime-Wallpaper.png')] bg-cover bg-no-repeat bg-center"> 
		<form action="/register" method="post" class="bg-[#313338] bg-opacity-90 w-96 h-fit rounded-lg">
			<h1 class="text-center text-xl pt-5 text-white">สมัครสมาชิก</h1>
			<div class="flex flex-col pb-5 px-5">
				<div class="flex mx-auto my-2 w-fit gap-3">
					<input type="radio" id="teacher" name="role" value="teacher">อาจารย์
					<input type="radio" id="student" name="role" value="student">นักเรียน
				</div>
				<div class="grid gap-1" id="std-box">
					<label for="studentid" class="text-sm text-white mb-1">รหัสนักศึกษา<span class="text-orange-600">*</span></label>
					<input type="text" id="studentid" name="studentid" class="bg-[#313338] w-full rounded-xl px-2 h-8 text-white" >
				</div>
				<div class="grid gap-1">
					<label for="fname" class="text-sm text-white mb-1">ชื่อ<span class="text-orange-600">*</span></label> 
					<input type="text" id="fname" name="fname" class="bg-[#313338] w-full rounded-xl px-2 h-8 text-white" required>
				</div>
				<div class="grid gap-1">
					<label for="lname" class="text-sm text-white mb-1">นามสกุล<span class="text-orange-600">*</span></label>
					<input type="text" id="lname" name="lname" class="bg-[#313338] w-full rounded-xl px-2 h-8 text-white" required>
				</div>
				<div class="grid gap-1">
					<label for="email" class="text-sm text-white mb-1">อีเมล<span class="text-orange-600">*</span></label>
					<input type="email" id="email" name="email" class="bg-[#313338] w-full rounded-xl px-2 h-8 text-white" required>
				</div>
				<div class="grid gap-1">
					<label for="password" class="text-sm text-white mb-1">รหัสผ่าน<span class="text-orange-600">*</span></label>
					<input type="password" id="password" name="password" class="bg-[#313338] w-full rounded-xl px-2 h-8 text-white" required>
				</div>
				<div class="grid gap-1">
					<label for="passwordconfirme" class="text-sm text-white mb-1">ยืนยันรหัสผ่าน<span class="text-orange-600">*</span></label>
					<input type="password" id="passwordconfirme" name="passwordconfirme" class="bg-[#313338] w-full rounded-xl px-2 h-8 text-white" required>
				</div>
				<div class="grid gap-1 mt-3">
					<input type="submit" value="ลงทะเบียน" class="bg-pink-500 py-2 rounded-xl text-white font-bold hover:bg-pink-600 cursor-pointer">
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	 const stdBox = document.getElementById("std-box");
	    const teacherRadio = document.getElementById("teacher");
	    const studentRadio = document.getElementById("student");
	    function toggleStudentFields() {
	        stdBox.classList.toggle("hidden", teacherRadio.checked);
	    }

	    toggleStudentFields();
	    teacherRadio.addEventListener("change", toggleStudentFields);
	    studentRadio.addEventListener("change", toggleStudentFields);
	
	
	</script>
</body>
</html>