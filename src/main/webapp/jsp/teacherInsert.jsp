<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>เพิ่มงานในชั้นเรียน</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<header>
		<div class="topNav bg-[#474F7A] h-24 mb-10 pl-10 flex items-center gap-5">
			<div class="icon">
				<a href="/roomTeacher/room/${idRoom}" class="h-full">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-20 h-20 text-white">
					  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
					</svg>
				</a>
			</div>
			<h1 class="text-xl font-semibold text-white">เพิ่มงานในชั้นเรียน</h1>
		</div>
	</header>


	<div class="container max-w-5xl mx-auto mb-20">
		<div>
			<form action="/roomTeacher/insertToDatabase" method="post" enctype="multipart/form-data" class="flex gap-5">
			    <input name="idRoom" value="${idRoom}" hidden="hidden" >
			    <div class="leftside  border rounded-lg mx-auto p-8 w-3/4 ">
			        <div class="mb-5">
			            <label class="block mb-2 text-sm font-medium text-gray-900">หัวข้อ</label>
			            <input type="text" name="title" required="required" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
			            focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
			        </div>
			        
			        <div class="mb-5">
			            <label class="block mb-2 text-sm font-medium text-gray-900">รายระเอียด</label>
			            <textarea name="detail" rows="4" class="block resize-none p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 h-56"></textarea>
			        </div>
			        <div class="mb-5">
			        	<label class="block mb-2 text-sm font-medium text-gray-900">อัพโหลดไฟล์</label>
			        	<input name="file" 
			        	  class="w-full text-black text-sm bg-gray-100 file:cursor-pointer cursor-pointer file:border-0 file:py-2 file:px-4 file:mr-4 file:bg-gray-800 file:hover:bg-gray-700 file:text-white rounded"  type="file">
			        </div>
			        <div class="flex justify-end">
			        	<button type="submit" class="bg-pink-300 text-white shadow-[rgba(0,_0,_0,_0.24)_0px_3px_8px]  rounded-lg px-6 py-2 hover:bg-pink-400">โพสต์</button>
			        </div>
			        
			    </div>
			    
			    <div class="rightside border rounded-lg mx-auto p-8 h-fit">
			        <div class="mb-5">
			            <label class="block mb-2 text-sm font-medium text-gray-900">ครบกำหนด</label>
			            <input id="datepicker" type="datetime-local" name="dueDate" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
			            focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
			        </div>
			        <div class="mb-5">
			            <label class="block mb-2 text-sm font-medium text-gray-900">คะแนนเต็ม</label>
			            <input type="number" name="fullScore" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
			            focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
			        </div>
			    </div>
			</form>
		</div>
	
	</div>
	
	<script type="text/javascript">

	  const datePicker = document.getElementById('datepicker');

	  datePicker.addEventListener('change', function () {
	 
	    const selectedDate = new Date(datePicker.value);

	 
	    const currentDate = new Date();


	    if (selectedDate < currentDate) {
	  
	      const currentDateString = currentDate.toISOString().slice(0, 16);
	      datePicker.value = currentDateString;
	    }
	  });
	
	
	</script>

</body>
</html>