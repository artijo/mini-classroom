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
			<div class="content flex gap-5 relative">
				<h1 class="absolute text-2xl text-white bg-gray-600 py-2 px-3 w-fit text-start font-semibold rounded-tl-lg rounded-br-lg mb-5">คำสั่ง</h1>
				<div class="rside h-fit w-2/4 border rounded-lg relative pt-5 shadow-[rgba(50,_50,_105,_0.15)_0px_2px_5px_0px,_rgba(0,_0,_0,_0.05)_0px_1px_1px_0px]">
					<div class="rside-content">
						<c:forEach items="${assignment}" var="ass">
							<div class="rtop p-9 border-b-2">
						 		<h1 class="text-3xl font-bold text-pink-300">${ass.title}</h1>
						 		<div class="flex justify-between">
						 			<p class="text-semibold text-slate-500 text-sm">${ass.room.teacher.fname} ${ass.room.teacher.lname }</p>
						 			<p class="text-semibold text-slate-500 text-sm">กำหนด  ${RoomController.covertToThaiTime(ass.dueDate)}</p>
						 		</div>
						 	</div>
						 	<div class="rbot p-9">
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
						 		<c:choose>
						 			<c:when test="${empty ass.file }">
						 				<div></div>
						 			</c:when>
						 			<c:otherwise>
						 				<div class="fileAss my-5">
								 			<a href="http://localhost:8899/file/${ass.file}" target="_blank" class="block flex items-center rounded-lg gap-5 shadow-[0px_0px_0px_1px_rgba(0,0,0,0.06),0px_1px_1px_-0.5px_rgba(0,0,0,0.06),0px_3px_3px_-1.5px_rgba(0,0,0,0.06),_0px_6px_6px_-3px_rgba(0,0,0,0.06),0px_12px_12px_-6px_rgba(0,0,0,0.06),0px_24px_24px_-12px_rgba(0,0,0,0.06)]" download>
								 				<span class="inline-block w-32 h-32">
								 					<img id="filePhoto" src="" class="w-full h-full object-cover p-3" alt="file photo${ass.file}">
								 				</span>
								 				<span>
								 					<span id="fileName" class="inline block line-clamp-1 w-56">
								 						${ass.file} 
								 					</span>
								 					<span id="typeFile" class=" block text-slate-400"></span>
								 				</span>
								 			</a>
								 		</div>
						 			</c:otherwise>
						 		</c:choose>
						 	</div>
						 </c:forEach> 
					</div>
				</div>
				<div class="lside w-2/4 border relative rounded-lg shadow-[rgba(50,_50,_105,_0.15)_0px_2px_5px_0px,_rgba(0,_0,_0,_0.05)_0px_1px_1px_0px] ">
					<h1 class="absolute text-2xl text-white bg-gray-600 py-2 px-3 w-fit text-start font-semibold rounded-tl-lg rounded-br-lg mb-5">งานของนักศึกษา</h1>
					<div class="scoreAss relative mt-20 mx-5">
						<div class="overflow-y-auto h-[500px] border-2">
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
					
					</div>
				</div>
				
			</div>
		</div>
	
	
	</main>
	<script type="text/javascript">
		const fileName = document.getElementById("fileName");
		const fileType = document.getElementById("typeFile");
		const fileImage = document.getElementById("filePhoto");
		const splitList =  fileName.innerText.split(".");
		const name = splitList[0].split("&");
		fileName.innerText = name[1];
		fileType.innerText = splitList[1];
		switch(splitList[1]){
			case "pdf":
				fileImage.setAttribute("src","http://localhost:8899/icon/pdf.png")
				break;
			case "zip":
				fileImage.setAttribute("src","http://localhost:8899/icon/zipfile.png")
				break;
			default:
				fileImage.setAttribute("src","http://localhost:8899/icon/unknowfile.png")
		}
		
		
		
	</script>
</body>
</html>