<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.project.classroom.classroom.controller.*"%>
<!DOCTYPE html>  
<html>
<head>
<meta charset="utf-8">
<title>งานในชัั้นเรียน</title>
 <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<header>
		<jsp:include page="template/navbarStudent.jsp"/>
	</header>
<div class="container max-w-screen-xl mx-auto mb-20 ">
<!--Banner class  -->
 <section class="h-48 mr-auto ml-auto mt-10 rounded-lg content max-w-5xl mx-auto my-5 " >
       <div class="Thumbnail relative mb-5 z-0 relative relative h-80 bg-white border  border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700w"> 
        <img src="http://localhost:8899/image/${rooms.thumbnail}"alt="pic" class="object-cover h-full w-full rounded-lg opacity-2"> 
        <h1 class="absolute bottom-5 left-2 text-4xl  drop-shadow-lg uppercase bg-white text-black rounded-lg	p-[5px]">${rooms.nameRoom}</h1>
        </div>
    </section>        
</div>
   <!-- Content -->
    <div class=" container w-[67%] ml-auto mr-auto mt-[10%]" >
        <div class=" flex gap-[20px] h-20">
            <div class=" shadow-sm shadow-gray-500 rounded-lg  p-[10px] w-1/4 my-auto h-full">
                <p class="w-fit ">รหัสห้อง:${rooms.codeRoom}</p>
                </div>
                <c:forEach items="${idAssignments }" var="content" >
                <div class="shadow-sm shadow-gray-500 w-3/4 relative p-[5px] rounded-lg">
                <p class="text-semibold text-white text-sm bg-[#334155] w-fit absolute right-[0px] p-[5px]  rounded-lg top-[0px] rounded-b-none rounded-s-none text-wrap">
						 				<c:choose>
						 					<c:when test="${empty content.dueDate }">
						 						ไม่มีกำหนด
						 					
						 					</c:when>
						 					<c:otherwise>
						 							กำหนดส่งวันที่ ${RoomController.covertToThaiTime(content.dueDate)} 
						 					
						 					</c:otherwise>
						 				
						 				</c:choose>
						 		
						 			
						 			</p>
                <h3 class="font-bold">หัวข้อ : ${content.title}</h3>
                <p class="text-base font-light">รายละเอียด : ${content.detail}</p> 
                 <a href="/room/${room}/assignment/${content.idAssignment}/student/${std_id.idStudent}/insert/Ass_student_room" class="bg-pink-300 p-[4px] rounded-lg text-white block w-fit absolute right-[5px]
      bottom-1 hover:bg-pink-400">ส่งงาน</a>
                </div>
                </c:forEach>
          
        </div>
    </div>

</body>
</html>