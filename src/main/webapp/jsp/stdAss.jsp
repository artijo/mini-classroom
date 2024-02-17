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
        <div class="relative h-20">
            <div class="absolute bottom-1 left-0  border border-solid border-gray-400 rounded-lg   p-6">
                <p>รหัสห้อง:${rooms.codeRoom}</p></div>
                
            <div class="absolute bottom-1 left-1/4 border border-solid border-gray-400 rounded-lg w-9/12  p-6">
                    <img src="http://localhost:8899/icon/account.svg" alt="account" class="h-7 w-50 left-2 bottom-1/3 absolute">
                
                <p class="ml-5 ">Announce something to your class</p></div>
        </div>
    </div>
    <c:forEach items="${idAssignments }" var="content">
     <div class="w-[580px] border border-solid border-gray-400  p-4  grid-cols-1 place-content-center  mx-[576px] rounded-lg  my-[10px] relative ">
     <h3 class="font-bold">${content.title}</h3>
     <p class="text-base font-light">รายละเอียด:${content.detail}</p> 
     <a href="/room/${room}/assignment/${content.idAssignment}/student/${std_id.idStudent}/insert/Ass_student_room" class="bg-pink-300 p-[4px] rounded-lg text-white block w-fit absolute right-[5px]
      bottom-1 hover:bg-pink-400">ส่งงาน</a>
     <div>
     </div>           	
</div>
    </c:forEach>

</body>
</html>