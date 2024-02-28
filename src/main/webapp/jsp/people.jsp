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
<body class="ml-[10px] mt-[10px]">
<c:choose>
<c:when test="${role == 'student'}">
<a href="/room/${room.idRoom }/submit"
		class="bg-amber-200 rounded-lg p-[10px] text-white hover:bg-amber-400 ml-[10px] ">ย้อนกลับ</a>
</c:when>
<c:otherwise>
<a href="/roomTeacher/room/${room.idRoom }"
		class="bg-amber-200 rounded-lg p-[10px] text-white hover:bg-amber-400 ml-[10px] ">ย้อนกลับ</a>
</c:otherwise>
</c:choose>
<div class="container w-[50%] mx-auto mt-[20px] bg-[#474F7A] p-[10px]  rounded-lg shadow-md h-auto">
<div class="mx-auto w-fit h-auto">
 <h2 class="text-lg my-[10px] text-white">ผู้สอน</h2>
   	<div class="bg-[#fda4af]  w-[500px] p-[10px] mt-[10px] rounded-lg shadow-md mb-[10px] text-white" >
   		<c:out value="${room.teacher.fname}"></c:out>
        <c:out value="${room.teacher.lname}"></c:out>
   	</div>
   	 <h2 class="text-lg my-[10px] text-white">นักศึกษา</h2>
   	   	<c:forEach var="std" items="${students}">
   	   	<div class="bg-[#fda4af] w-[500px] p-[10px] mt-[10px] rounded-lg shadow-md mb-[10px] text-white" >
   	   	<c:out value="${std.student.fname}"></c:out>
		<c:out value="${std.student.lname}"></c:out>
   	   	</div>
		<c:if test="${role == 'teacher'}">
		    <a href="/room/${room.idRoom }/people/${std.student.idStudent}/delete">Remove</a>
		</c:if>
			<br>
			<br>
	</c:forEach>
</div>
</div>
</body>
</html>