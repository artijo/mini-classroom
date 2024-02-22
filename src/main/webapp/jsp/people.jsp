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
<div class="container w-[50%] mx-auto mt-[20px] bg-orange-50 p-[10px]  rounded-lg shadow-md h-auto">
<div class="mx-auto w-fit h-auto">
 <h2 class="text-lg my-[10px]">ผู้สอน</h2>
   	<div class="bg-yellow-50  w-[500px] p-[10px] mt-[10px] rounded-lg shadow-md shadow-yellow-200 mb-[10px]" >
   		<c:out value="${room.teacher.fname}"></c:out>
        <c:out value="${room.teacher.lname}"></c:out>
   	</div>
   	 <h2 class="text-lg my-[10px]">นักศึกษา</h2>
   	   	<c:forEach var="std" items="${students}">
   	   	<div class="bg-yellow-50  w-[500px] p-[10px] mt-[10px] rounded-lg shadow-md shadow-yellow-200 mb-[10px]" >
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