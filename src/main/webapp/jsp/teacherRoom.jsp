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
	<%
	
	
	%>
	 <div class="main container">
        <div class="content max-w-5xl mx-auto my-5">
            <div class="Thumbnail mb-5 relative h-80 bg-white border  border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700w">
                <!-- Thumnnail src from database here -->
                <img src="http://localhost:8899/image/wallpaper-test.webp" alt="Thumbnail //name//" class="rounded-lg w-full h-full object-fill"> 
                <span class="absolute line-clamp-1 bottom-0 p-5 text-3xl font-medium antialiased text-white">
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
                <div class="right-side w-3/4 grid grid-cols-1 gap-5">
                	<div class="addgroup hover:cursor-pointer active:bg-gray-100 flex items-center gap-2 profile w-full border py-3 px-10 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700w">
	                     <div class="profile w-12 h-12">
	                         <img src="http://localhost:8899/image/Cute-Anime-Wallpaper.png" alt="Cute anime" class="w-full h-full object-cover rounded-full">
	                     </div>
	                     <a href="/roomTeacher/insert/${room[0].idRoom}">
	                        <span class="text-sm font-thin text-gray-400">เพิ่มงานในชั้นเรียน</span>
	                     </a>
                    </div>
                	<c:forEach items="${assignment}" var="ass">
                		<div class="assgroup hover:cursor-pointer active:bg-gray-100 flex items-center gap-2 profile w-full border py-3 px-10 rounded-lg">
                            <div class="icon-ass w-12 h-12">
                                <img src="http://localhost:8899/icon/Assignment.png" alt="Assignment" class="text-center w-full h-full object-cover rounded-full bg-blue-400 p-2">
                            </div>
                            <div class="info w-3/4">
                                <h5 class="line-clamp-1 font-medium text-sm">
                                    <a href="/roomTeacher/assignment/${ass.idAssignment}">${ass.title}</a>
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
</body>
</html>