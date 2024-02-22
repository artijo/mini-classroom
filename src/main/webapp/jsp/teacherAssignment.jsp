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
	<jsp:include page="template/navbarTeacher.jsp"/>

	<div class="overlay fixed top-0 left-0 w-screen h-screen bg-opacity-50 bg-black hidden z-20">
		<div class="continer form absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-">
	    	<form action="/roomTeacher/insertScore/${assignment[0].idAssignment}/${assignment[0].room.idRoom}" class=" w-96 max-w-xl border rounded-lg p-5 relative mx-auto bg-white"  method="post">
		        <h1 class="text-l text-white bg-gray-600 p-2 w-fit absolute top-0 left-0 font-semibold rounded-tl-lg rounded-br-lg ">ปรับแต่งชั้นเรียน</h1>
		        <div class="relative mt-10">
		            <div>
		                <div class="my-5 flex justify-center items-center">
		                	<input type="number" name="score" required="required" class="w-12 h-12 border" min="0" max="${assignment[0].fullScore}">
		                	<input type="number" name="studentId" id="stuId" hidden>
		                	<h1 class="text-4xl ml-5">/ ${assignment[0].fullScore}</h1>
		                </div>
		                <div class="btn-group">
			                <button type="submit" class="py-2 px-3 rounded-lg text-white bg-pink-300 hover:bg-pink-400 border text-xs">เพิ่มคะแนน</button>
			                <button id="cancelbtn" type="button" class="py-2 px-3 rounded-lg text-black bg-gray-100 hover:bg-gray-200 border text-xs" onClick="cancel()">ยกเลิก</button>
		                </div>
		            </div>
		        </div>
		    </form>
		</div>
	</div>

	<main>
		<div class="container max-w-screen-xl mx-auto mb-20">
			<div class="content flex gap-5 relative">
				<h1 class="absolute text-2xl text-white bg-gray-600 py-2 px-3 w-fit text-start font-semibold rounded-tl-lg rounded-br-lg mb-5">คำสั่ง</h1>
				
				<div class="rside h-fit w-2/4 border rounded-lg relative pt-5 shadow-[rgba(50,_50,_105,_0.15)_0px_2px_5px_0px,_rgba(0,_0,_0,_0.05)_0px_1px_1px_0px]">
					<div class="absolute top-0 right-0 m-2 grid grid-cols-2 gap-2 ">
						<a href="/roomTeacher/delete/assignment/${assignment[0].idAssignment}/room/${assignment[0].room.idRoom}" class="delete-button flex bg-red-500 rounded-2xl hover:bg-red-400">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 text-white p-0.5">
							  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
							</svg>
						</a>
						<!-- edit -->
						<a href="/roomTeacher/editAss/${assignment[0].idAssignment}" class="edit-button flex bg-yellow-300 rounded-2xl hover:bg-yellow-400">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 text-white p-0.5">
							  <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
							</svg>
						</a>
						
					</div>
					
					<div class="rside-content">
						<c:forEach items="${assignment}" var="ass">
							<div class="rtop p-9 border-b-2">
						 		<h1 class="text-3xl font-bold text-pink-300">${ass.title}</h1>
						 		<div class="flex justify-between">
						 			<p class="text-semibold text-slate-500 text-sm">${ass.room.teacher.fname} ${ass.room.teacher.lname }</p>
						 			<p class="text-semibold text-slate-500 text-sm">
						 				<c:choose>
						 					<c:when test="${empty ass.dueDate }">
						 						ไม่มีกำหนด
						 					
						 					</c:when>
						 					<c:otherwise>
						 							กำหนดส่งวันที่ ${RoomController.covertToThaiTime(ass.dueDate)} 
						 					
						 					</c:otherwise>
						 				
						 				</c:choose>
						 		
						 			
						 			</p>
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
					<div class="scoreAss relative mt-20 mx-1">
						<div class="overflow-y-auto h-[300px]">
							<c:choose>
								<c:when test="${empty allListAssignment}">
									<div class="mx-auto  text-center">
										ไม่มีคนส่ง
									</div>
								</c:when>
								<c:otherwise>
									<table class="w-full text-sm text-gray-500 dark:text-gray-400">
										<thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
								            <tr class="text-center">
								                <th scope="col" class="px-6 py-3">
								                    ชื่อ
								                </th>
								                <th scope="col" class="px-6 py-3">
								                    สถานะ
								                </th>
								                <th scope="col" class="px-6 py-3">
								                    ไฟล์
								                </th>
								                <th scope="col" class="px-6 py-3">
								                    คะแนน
								                </th>
								            </tr>
								        </thead>
								        <tbody>
								        	<c:forEach items="${allListAssignment}" var="assItem" >
												<c:forEach items="${student}" var="stuItem">
													<c:choose>
														<c:when test="${stuItem.student.idStudent.equals(assItem.student.idStudent)}">						
															<tr class="text-center border-b">
																<td class="py-5">
																	<span class="text-l text-black font-bold h-fit line-clamp-1">${stuItem.student.fname} ${stuItem.student.lname}</span>
																</td>
																<td class="py-5" >
																	<span class="text-l font-bold text-pink-500">ส่งแล้ว</span>
																</td>
																<td class="py-5 flex justify-center item-center">
																	<img alt="" src="./image/icon_edit.png" onclick="editPostPopup()">
															
																	<a class="w-10  line-clamp-1 text-bold underline h-fit file" href="http://localhost:8899/image/logo_crop.png">${assItem.filePath}</a>
																</td>
																<td class="py-5 cursor-pointer hover:bg-pink-500 editIcon " title="เพิ่มคะแนนของ ${stuItem.student.studentId}" onclick="student(${stuItem.student.idStudent})">
																		<span  class="cursor-pointer text-l font-bold text-black"> ${assItem.score} </span>
																</td>
															</tr>		
														</c:when>
														<c:otherwise></c:otherwise>
													</c:choose>
												</c:forEach>
											</c:forEach>
								        </tbody>
									
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>		
			</div>
		</div>
	 <div class="popup-editpost" id="editPost" style="display: none;">
        <div class="popup-editpost-content">
            <h3>แก้ไขงานที่มอบหมาย</h3>
            <div class="boxpost">
                <form method="post" action="{{ route('editPost', ['id' => $room->id, 'selectedId' => $selectedAss->id]) }}" enctype="multipart/form-data">
                   
                    <p class="name">ชื่อ</p>
                    <input type="text" id="nameja" name="nameAss" value="{{ $selectedAss->nameAss }}" required> 
                    <p class="detail" >รายละเอียด</p>
                    <textarea id="detailja" rows="5" cols="20" name="detailAss">{{ $selectedAss->detailAss }}</textarea>
                    
                    <div class="scoreanddeadline">
                        <p class="editscoreass">คะแนนของงานที่มอบหมาย</p>
                        <p class="editdeadline">ครบกำหนด</p>
                    </div>
                    
                    <div class="inputscoreanddeadline">
                        <input type="number" min="0" max="100" step="1" id="editscoreass" name="scoreass" value="{{ $selectedAss->fullScoreAss }}">
                        <input type="datetime-local" id="editdeadlinetime" name="deadline" value="{{ $selectedAss->deadline }}">
                    </div>
                    
                    <div class="btn">
                        <input type="button" id="close-popup" value="ยกเลิก" onclick="cancelAndReturn()">
                        <input type="submit" id="submitButton" value="ยืนยัน">
                    </div>
                </form>
                
            </div>
        </div>
    </div>
	
	</main>
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
		
		
		
		const formContainer = document.querySelector('.overlay');
		const idValue = document.getElementById("stuId");
		function student(id){
			formContainer.classList.toggle('hidden');
			idValue.value = id;
		}
		function cancel(){
			formContainer.classList.toggle('hidden');
			idValue.value = "";
		}
		
		
		const deleteBtn = document.getElementsByClassName('delete-button');
		
		var confirmThis = function (e) { 
            if (!confirm('Are you sure?')) e.preventDefault(); 
        };
        
        for (var i = 0, l = deleteBtn.length; i < l; i++) { 
        	deleteBtn[i].addEventListener('click', confirmThis, false); 
        } 
		
		
        function editPostPopup() {
            var editPostPopup = document.getElementById('editPost');

            if (editPostPopup.style.display === 'none' || editPostPopup.style.display === '') {
                editPostPopup.style.display = 'block';
            } else {
                editPostPopup.style.display = 'none';
            }
        }
        function cancelAndReturn() {
            togglePopup();
            window.location.href = '/indexteacher'; 
        }
	</script>
</body>
</html>