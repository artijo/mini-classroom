<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <div class="shadow dark:bg-gray-800 dark:border-gray-700w border-indigo-600 p-6 w-2/4 h-[500px] rounded-lg">
            <h1 class="text-lg">${asscontent[0].title}</h1>
            <p>${roomcontent[0].teacher.fname} ${roomcontent[0].teacher.lname} : ${asscontent[0].createdAt }</p>
            <div class="flex gap-[75%] my-[20px]"><p>100 คะแนน</p> <p>  due: ${asscontent[0].dueDate}</p></div>
            <hr>
        </div>
        <!-- Right side -->
        <div class="shadow dark:bg-gray-800 dark:border-gray-700w p-6 w-2/4 relative h-[500px] rounded-lg">
            <h1 class="text-lg">งานของคุณ</h1>
            <form action="/insert/Ass_student_room" method="post"  enctype="multipart/form-data">
              <c:choose>
              <c:when test="${empty studentass[0].filePath}">
              <div class="mx-auto w-fit h-1/2" ><input type="file" name="file_ass" class="mb-2 w-full text-black text-sm bg-gray-100 cursor-pointer border-0 py-2 px-4 mr-4 
                    bg-gray-800 hover:bg-gray-700 text-white rounded"></div>
                    <input type="hidden" value= '<c:out value="${std_id.idStudent }"></c:out> '   name="stdid" >
                      <input type="hidden" value= '<c:out value="${roomcontent[0].idRoom}"></c:out> '    name="rooms">
                        <input type="hidden" value= '<c:out value="${asscontent[0].idAssignment}"></c:out> '   name="assignment" >
                        <input type="submit" value="ส่งงาน" class="bg-pink-300 rounded-lg p-[5px] text-white absolute right-5 top-[150px] hover:bg-pink-400">
              </c:when>
              <c:otherwise>
                              <div class="  p-[20px] mx-auto] bg-emerald-400  shadow rounded-lg text-white text-center" id="submit" > คุณส่งงานแล้ว  </div>
                                 <a href="/del/assignment_student_ass/${ std_id.idStudent }/room/${roomcontent[0].idRoom}/assignment/${asscontent[0].idAssignment}" class="bg-red-500 rounded-lg p-[5px] text-white absolute right-[100px] top-[150px] hover:bg-red-600" onclick="deletefunction(event)">ยกเลิก</a>
              </c:otherwise>
              </c:choose>
            </form>
           
        </div>
        
    </div>
    <a href="/room/${roomcontent[0].idRoom}/submit" class="bg-green-400 rounded-lg p-[5px] text-white hover:bg-green-600 ml-[10px]">ย้อนกลับ</a>
 
    
</body>
</html>