<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.classroom.classroom.controller.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>งานของนักศึกษา</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<main>
		<div class="container max-w-screen-xl mx-auto">
		<h1 class="text-2xl text-white bg-gray-600 p-2 w-fit text-start font-semibold rounded-tl-lg rounded-br-lg mb-5">คำสั่ง</h1>
			<div class="content flex gap-5">
				<div class="rside w-2/4 border">
					<div class="rside-content">
						<c:forEach items="${assignment}" var="ass">
							<div class="rtop p-9 border-b-2">
						 		<h1 class="text-3xl font-bold text-pink-300">${ass.title}</h1>
						 		<div class="flex justify-between">
						 			<p class="text-semibold text-slate-500 text-sm">${ass.room.teacher.fname} ${ass.room.teacher.lname }</p>
						 			<p class="text-semibold text-slate-500 text-sm">กำหนด  ${RoomController.covertToThaiTime(ass.dueDate)}</p>
						 		</div>
						 	</div>
						 	<div class="rbot p-9 border-b-2">
						 		<h1 class="text-bold text-m">คำชี้แจง</h1>
						 		<p class="detail my-5">
						 			<c:choose>
									    <c:when test="${empty ass.detail}">
									        <p class="text-center text-base"> ไม่มีคำชี้แจง</p>
									    </c:when>
									    <c:otherwise>
									    	<p class="text-start text-base">${ass.detail}</p>
									    </c:otherwise>
									</c:choose>
						 		</p>
						 		<div class="fileAss my-5">
						 			<a href="http://localhost:8899/file/${ass.file}" class="block flex items-center rounded-lg gap-5 shadow-[0px_0px_0px_1px_rgba(0,0,0,0.06),0px_1px_1px_-0.5px_rgba(0,0,0,0.06),0px_3px_3px_-1.5px_rgba(0,0,0,0.06),_0px_6px_6px_-3px_rgba(0,0,0,0.06),0px_12px_12px_-6px_rgba(0,0,0,0.06),0px_24px_24px_-12px_rgba(0,0,0,0.06)]" download>
						 				<span class="inline-block w-32 h-32">
						 					<img src="http://localhost:8899/image/Cute-Anime-Wallpaper.png" class="w-full h-full object-cover" alt="file photo${ass.file}">
						 				</span>
						 				<span class="inline block">
						 					${ass.file}
						 				</span>
						 			</a>
						 		</div>
						 	</div>
						 </c:forEach> 
					</div>
				</div>
				<div class="lside w-2/4 border">
				
				
				</div>
				
			</div>
		</div>
	
	
	</main>
	<footer>
		<div class="border p-5 m-5">
		<c:forEach items="${assignment}" var="ass">
			ชื่อ: ${ass.title}<br>
			คุณครู: ${ass.room.teacher.fname} ${ass.room.teacher.lname}<br>
			กำหนดส่ง:${RoomController.covertToThaiTime(ass.dueDate)}<br>
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
	
	
	</footer>
	
</body>
</html>