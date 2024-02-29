<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>People</title>
 <script src="https://cdn.tailwindcss.com"></script>
</head>
<body >
<c:choose>
<c:when test="${role == 'student'}">
<a href="/room/${room.idRoom }/submit"
		class="bg-amber-300 rounded-lg p-[10px] text-white hover:bg-amber-400 ml-[1px] ">ย้อนกลับ</a>
</c:when>
<c:otherwise>
<a href="/roomTeacher/room/${room.idRoom }"
		class="bg-amber-300 rounded-lg p-[10px] text-white hover:bg-amber-400 ml-[1px] ">ย้อนกลับ</a>
</c:otherwise>
</c:choose>


<div class="container w-[50%] mx-auto mt-[20px] p-[10px]  rounded-lg  h-auto">
<h1 class="mt-[20px] text-center text-lg font-bold" >รายชื่อในห้องเรียน</h1>
<div class="mx-auto w-fit h-auto">
 <h2 class="text-lg my-[10px] ">ผู้สอน</h2>
   	<div class="bg-[#e5e7eb]  w-[500px] p-[10px] mt-[10px] rounded-lg shadow-md mb-[10px] " >
   		<c:out value="${room.teacher.fname}"></c:out>
        <c:out value="${room.teacher.lname}"></c:out>
   	</div>
   	 <h2 class="text-lg my-[10px] ">นักศึกษา</h2>
   	   	<c:forEach var="std" items="${students}">
   	   	<div class="bg-[#e5e7eb] w-[500px] p-[10px] mt-[10px] rounded-lg shadow-md mb-[10px]  relative" >
   	   	<c:out value="${std.student.fname}"></c:out>
		<c:out value="${std.student.lname}"></c:out>
   	   	</div>
		<c:if test="${role == 'teacher'}">
		    <a href="/room/${room.idRoom }/people/${std.student.idStudent}/delete" class="bg-red-500 rounded-lg text-white p-[5px] hover:bg-red-600 absolute left-[62.5%]">Remove</a>
		</c:if>
			<br>
			<br>
	</c:forEach>
</div>
</div>
</body>
</html>