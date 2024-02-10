<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Classroom</title>
</head>
<body>
	<form action="/roomTeacher/insertToDatabase" method="post" enctype="multipart/form-data">
	    <input name="idRoom" value="${idRoom}" hidden="hidden" >
	    <div class="leftside">
	        <div>
	            <label>หัวข้อ</label>
	            <input type="text" name="title" required="required">
	        </div>
	        
	        <div>
	            <label>รายระเอียด</label>
	            <input type="text" name="detail" required="required">
	        </div>
	        
	        <div>
	        	<label>อัพโหลดไฟล์</label>
	        	<input type="file" name="file">
	        </div>
	    </div>
	    
	    <div class="rightside">
	        <div>
	            <label>ครบกำหนด</label>
	            <input type="datetime-local" name="dueDate">
	        </div>
	        <div>
	            <label>คะแนนเต็ม</label>
	            <input type="number" name="fullScore" min="1" maxlength="10">
	        </div>
	    </div>
	    
	    <button type="submit">โพสต์</button>
	</form>

</body>
</html>