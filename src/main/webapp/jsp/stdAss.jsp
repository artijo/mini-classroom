<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>งานในชัั้นเรียน</title>
 <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<div class="container mx-auto">

<!--Banner class  -->
 <section class="w-1/2 h-48 mr-auto ml-auto mt-10 rounded-lg content max-w-5xl mx-auto my-5" >
       <div class="relative"> 
        <img src="http://localhost:8899/image/${rooms.thumbnail}"alt="pic" class="object-cover h-48 w-full rounded-lg"> 
        <h1 class="absolute bottom-5 left-2 text-4xl text-white">${rooms.nameRoom}</h1>
        </div>
    </section>        
</div>
   <!-- Content -->
    <div class="w-1/2 ml-auto mr-auto mt-5" >
        <div class=" flex gap-[20px] h-20">
            <div class=" shadow-sm shadow-gray-500 rounded-lg  p-[10px] w-1/4 my-auto h-full">
                <p class="w-fit ">รหัสห้อง:${rooms.codeRoom}</p>
                </div>
                <c:forEach items="${idAssignments }" var="content" >
                <div class="shadow-sm shadow-gray-500 w-3/4 relative p-[5px] rounded-lg">
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