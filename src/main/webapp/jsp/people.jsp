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
    <h2>ผู้สอน</h2>
    <hr>
   	<div class="bg-[#f3f4f6] w-[500px] p-[10px] mt-[10px]" >
   		<c:out value="${room.teacher.fname}"></c:out>
        <c:out value="${room.teacher.lname}"></c:out>
   	</div>
        
   <h2>นักศึกษา</h2>
    <hr>
	<c:forEach var="std" items="${students}">
		<c:out value="${std.student.fname}"></c:out>
		<c:out value="${std.student.lname}"></c:out>
		<c:if test="${role == 'teacher'}">
		    <a href="/room/${room.idRoom }/people/${std.student.idStudent}/delete">Remove</a>
		</c:if>
			<br>
			<br>
	</c:forEach>
</body>
</html>