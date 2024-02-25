<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.classroom.classroom.controller.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ส่งงานในชั้นเรียน</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="flex justify-center  gap-[20px] h-auto mx-[10px] my-[10px]">
		<!-- left side -->
		<div
			class="shadow dark:bg-gray-800 dark:border-gray-700w border-indigo-600 p-6 w-2/4 h-[500px] rounded-lg">
			<h1 class="text-lg">หัวข้อ : ${asscontent[0].title}</h1>
			<p>${roomcontent[0].teacher.fname}
				${roomcontent[0].teacher.lname} : ${RoomController.covertToThaiTime( asscontent[0].createdAt)}</p>
			<p>รายละเอียดคำสั่ง : ${asscontent[0].detail}</p>
			<div class="flex gap-[55%] my-[20px]">
				<p>${asscontent[0].fullScore}คะแนน</p>
				<p>due:
					${RoomController.covertToThaiTime(asscontent[0].dueDate)}</p>
			</div>
			<hr>
			<div class="border-2 my-[10px]">
				<c:choose>
					<c:when test="${empty asscontent[0].file}">
						<h2>ไม่มีไฟล์แนบ</h2>
					</c:when>
					<c:otherwise>
						<a href="http://localhost:8899/file/${asscontent[0].file}"
							target="_blank"
							class="block flex items-center rounded-lg gap-5 shadow-[0px_0px_0px_1px_rgba(0,0,0,0.06),0px_1px_1px_-0.5px_rgba(0,0,0,0.06),0px_3px_3px_-1.5px_rgba(0,0,0,0.06),_0px_6px_6px_-3px_rgba(0,0,0,0.06),0px_12px_12px_-6px_rgba(0,0,0,0.06),0px_24px_24px_-12px_rgba(0,0,0,0.06)]"
							download> <span class="inline-block w-32 h-32"> <img
								id="filePhoto" src="" class="w-full h-full object-cover p-3"
								alt="file photo${asscontent[0].file}">
						</span> <span> <span id="fileName"
								class="inline block line-clamp-1 w-56">${asscontent[0].file}
							</span> <span id="typeFile" class=" block text-slate-400"></span>
						</span>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- Right side -->
		<div
			class="shadow dark:bg-gray-800 dark:border-gray-700w p-6 w-2/4 relative h-[500px] rounded-lg">
			<h1 class="text-lg">งานของคุณ</h1>
			<form action="/insert/Ass_student_room" method="post"
				enctype="multipart/form-data">
				<c:choose>
					<c:when test="${empty studentass[0].filePath}">
						<div class="mx-auto w-fit h-1/2">
							<input type="file" name="file_ass"
								class="mb-2 w-full text-black text-sm bg-gray-100 cursor-pointer border-0 py-2 px-4 mr-4 
                    bg-gray-800 hover:bg-gray-700 text-white rounded">
						</div>
						<input type="hidden"
							value='<c:out value="${std_id.idStudent }"></c:out> '
							name="stdid">
						<input type="hidden"
							value='<c:out value="${roomcontent[0].idRoom}"></c:out> '
							name="rooms">
						<input type="hidden"
							value='<c:out value="${asscontent[0].idAssignment}"></c:out> '
							name="assignment">
						<input type="submit" value="ส่งงาน"
							class="bg-pink-300 rounded-lg p-[5px] text-white absolute right-5 top-[150px] hover:bg-pink-400">
					</c:when>
					<c:otherwise>
						<div
							class="  p-[20px] mx-auto] bg-emerald-400  shadow rounded-lg text-white text-center"
							id="submit">คุณส่งงานแล้ว</div>
						<a
							href="/del/assignment_student_ass/${ std_id.idStudent }/room/${roomcontent[0].idRoom}/assignment/${asscontent[0].idAssignment}"
							class="bg-red-500 rounded-lg p-[5px] text-white absolute right-[100px] top-[150px] hover:bg-red-600"
							onclick="deletefunction(event)">ยกเลิก</a>
					</c:otherwise>
				</c:choose>
			</form>

		</div>

	</div>
	<a href="/room/${roomcontent[0].idRoom}/submit"
		class="bg-green-400 rounded-lg p-[5px] text-white hover:bg-green-600 ml-[10px]">ย้อนกลับ</a>
</body>
<script type="text/javascript">
 const fileName = document.getElementById("fileName");
	const fileType = document.getElementById("typeFile");
	const fileImage = document.getElementById("filePhoto");
	if(fileName){
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
		}
 </script>
</html>