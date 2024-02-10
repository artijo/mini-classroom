<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Teacher Page</title>
</head>
<body>

	
	<a href="/roomTeacher/insert/${room[0].idRoom}">เพิ่มงานในชั่นเรียน </a>
	
	<c:forEach items="${room}" var="rooms">
		<div style="border:solid 1px black; padding:10px;">
			Name : ${rooms.nameRoom}<br>
			Code : ${rooms.codeRoom }<br>
			Teacher : ${rooms.teacher.fname} ${rooms.teacher.lname} 
		</div>
	</c:forEach>
	<h5>Assignment</h5>
	<c:forEach items="${assignment}" var="ass">
		<a href="${ass.idAssignment }">
			<div style="border:solid 1px black; padding:10px; margin-bottom:10px;">
				Assignment Name: ${ass.title}<br>
				Detail: ${ass.detail }
			</div>
		</a>
	</c:forEach>
</body>
</html>