<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>People</title>
</head>
<body>
    <h1>People</h1>
    <h3>Teachers</h3>
    <hr>
        <c:out value="${room.teacher.fname}"></c:out>
        <c:out value="${room.teacher.lname}"></c:out>
    <h3>Students</h3>
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