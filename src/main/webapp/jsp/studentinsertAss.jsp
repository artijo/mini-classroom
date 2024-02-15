<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>งานในชัั้นเรียน</title>
</head>
<body>
<div class="container">
                    <div>
                    	<form action="/students/insert" method="post" >
                    	<input type="text" value="แนบไฟล์" name="sentass" >
                    	<input type="submit" value="ส่งงาน">
                    	<input type="hidden" value='<c:out value="${std_id.studentId }"></c:out>' name="stdid">
                    	     	<input type="hidden" value='<c:out value="${room}"></c:out>' name="idRoom">
                    	<input type="hidden" value='<c:out value="${idAssignments.idAssignment}"></c:out>' name="assignment">
                    	</form>
                    </div>
</div>
             
           

</body>
</html>