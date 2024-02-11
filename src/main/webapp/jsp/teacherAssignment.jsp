<%@page import="com.project.classroom.classroom.model.Assignment_Room_Student"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>งานของนักศึกษา</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="border p-5 m-5">
		<c:forEach items="${assignment}" var="ass">
			ชื่อ: ${ass.title}<br>
			คุณครู: ${ass.room.teacher.fname} ${ass.room.teacher.lname}<br>
			กำหนดส่ง: ${ass.dueDate} <br>
			รายละเอียด<br>
			<c:choose>
			    <c:when test="${empty ass.detail}">
			        ไม่มีข้อมูล
			    </c:when>
			    <c:otherwise>
			    	    
			    </c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div class="border p-5 m-5">
		<h2>งานของนักศึกษา</h2>
		<c:forEach items="${student}" var="item">
			<c:choose>
			    <c:when test="${empty allListAssignment}">
			    	<div class="mx-auto m-2 p-2">
						ไม่มีใครส่ง
					</div>
			    </c:when>
			    <c:otherwise>
			    	<c:forEach items="${allListAssignment}" var="list">
			    		<c:choose>
				    		<c:when test="${item.studentId == list.student.studentId}">
				    			<div class="m-2 p-2 border">
				       				name: ${item.fname} ${item.lname}<br>
				       				student-id: ${item.studentId}<br>
				       				สถานะ: ส่งแล้ว
				       			</div>
				    		</c:when>
							<c:otherwise>
								<div class="border m-2 p-2">
				       				name: ${item.fname} ${item.lname}<br>
				       				student-id: ${item.studentId}<br>
				       				สถานะ: ยังไม่ส่ง
				       			</div>
							
							</c:otherwise>			    	
				    	</c:choose>
			    	
			    	
			    	</c:forEach>
			    	
			    </c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>