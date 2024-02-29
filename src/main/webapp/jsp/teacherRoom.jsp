<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.classroom.classroom.controller.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>หน้าหลัก - Teacher</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

	<header>
		<jsp:include page="template/navbarTeacher.jsp"/>
	</header>


	<div class="overlay fixed top-0 left-0 w-screen h-screen bg-opacity-50 bg-black hidden z-20">
		<div class="continer form absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-">
	    	<form action="#" class=" w-96 max-w-xl border rounded-lg p-5 relative mx-auto bg-white"  enctype="multipart/form-data" method="post">
		        <h1 class="text-l text-white bg-gray-600 p-2 w-fit absolute top-0 left-0 font-semibold rounded-tl-lg rounded-br-lg ">ปรับแต่งชั้นเรียน</h1>
		        <div class="relative mt-10">
		            <div>
		                <input type="file" name="file"  class="mb-2 w-full text-black text-sm bg-gray-100 cursor-pointer border-0 py-2 px-4 mr-4 bg-gray-800 hover:bg-gray-700 text-white rounded" required="required">
		                <div class="btn-group">
			                <button type="submit" class="py-2 px-3 rounded-lg text-white bg-pink-300 hover:bg-pink-400 border text-xs">อัพโหลดไฟล์</button>
			                <button id="cancelbtn" type="button" class="py-2 px-3 rounded-lg text-black bg-gray-100 hover:bg-gray-200 border text-xs">ยกเลิก</button>
		                </div>
		            </div>
		        </div>
		    </form>
		</div>
	</div>
	
	<main>
		<div class="container max-w-screen-xl mx-auto mb-20">
	        <div class="content">
	            <div class="Thumbnail relative mb-5 z-0 relative h-80 bg-white border  border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700w">
	                <img src="http://localhost:8899/image/${room[0].thumbnail}" alt="Thumbnail" class="rounded-lg w-full h-full object-cover"> 
	                <span class="absolute line-clamp-1 bottom-0 m-5 p-2 text-3xl font-medium antialiased  rounded-lg  bg-white text-black">
	                    ${room[0].nameRoom}
	                </span>
	            </div>
	            <div class="main-content flex">
	                <!-- Left -->
	                <div class="left-side grid grid-cols-1 h-fit w-1/4 mr-5">
	                    <div class="code-box p-5 border rounded-lg ">
	                        <h5>รหัสชั้นเรียน:</h5>
	                        <span>${room[0].codeRoom}</span>
	                    </div>
	                </div>
	                <!-- Right -->
	                 <a href="/roomTeacher/insert/${room[0].idRoom}">
	                <div class="right-side w-3/4 grid grid-cols-1 gap-5">
	                	<div class="addgroup hover:cursor-pointer active:bg-gray-100 flex items-center gap-2 profile w-full h-[90px] border py-3 px-10 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700w">
		                     <div class="profile w-12 h-12">
		                         <img src="http://localhost:8899/image/logo_crop.png" alt="Cute anime" class="w-full h-full object-cover rounded-full">
		                     </div>
		                    
		                        <span class="text-sm font-thin text-gray-400">เพิ่มงานในชั้นเรียน</span>
		                    
	                    </div>
	                     </a>
	                	<c:forEach items="${assignment}" var="ass">
	                		<div class="assgroup hover:cursor-pointer active:bg-gray-100 flex items-center gap-2 profile w-full border py-3 px-10 rounded-lg">
	                            <div class="icon-ass w-12 h-12">
	                                <img src="http://localhost:8899/icon/Assignment.png" alt="Assignment" class="text-center w-full h-full object-cover rounded-full bg-blue-400 p-2">
	                            </div>
	                            <div class="info w-3/4">
	                                <h5 class="line-clamp-1 font-medium text-sm">
	                                    <a href="/roomTeacher/assignment/${ass.idAssignment}/${room[0].idRoom}">${ass.title}</a>
	                                </h5>
	                                <p class="text-xs text-gray">
	                                	${RoomController.covertToThaiTime(ass.createdAt)}
	                                </p>
	                            </div>
	                     	</div>
	                	</c:forEach>
	                </div>
	            </div>
	        </div>
	    </div>
	</main>
	 
    <script type="text/javascript">  
	    document.addEventListener('DOMContentLoaded', function() {
	        const editIcon = document.getElementById('editIcon');
	        const cancel = document.getElementById('cancelbtn');
	        const formContainer = document.querySelector('.overlay');
			const array = [editIcon,cancel];
			cancel.addEventListener('click', function() {
	            formContainer.classList.toggle('hidden');
	        });
	        editIcon.addEventListener('click', function() {
	            formContainer.classList.toggle('hidden');
	        });
	    });
    </script>
</body>
</html>