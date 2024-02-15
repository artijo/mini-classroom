<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class Room</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="indexstd.css">
    <link rel="stylesheet" href="navIndex.css">

 <script>

        function togglePopup() {
            var addRoomPopup = document.getElementById('addRoomPopup');

            if (addRoomPopup.style.display === 'none' || addRoomPopup.style.display === '') {
                addRoomPopup.style.display = 'block';
            } else {
                addRoomPopup.style.display = 'none';
            }
        }

        function checkAndSubmit() {
            var idRoomInput = document.getElementById('idRoom');
            
            if (idRoomInput.value === '') {
                alert('กรุณากรอกรหัสชั้นเรียน');
                togglePopup();
            } else {
                
                var form = document.getElementById('roomForm');
                form.submit();
            }
        }
        function cancelAndReturn() {
            togglePopup();
            window.location.href = '/indexteacher'; 
        }
    </script>
</head>
<body>
<nav>
	<img src="image/logo.png" alt="โลโก้">
    <a href="/logout" class="logout">ออกจากระบบ</a>
    </nav>
    <div class="container">
     <c:if test="${empty roomList}">
        <h1>คุณยังไม่ได้เข้าร่วมชั้นเรียนชั้นเรียน</h1>
    </c:if>

    <c:forEach var="room" items="${roomList}">
        
        <div class="item">
            <div class="poster">
                <a href="/roomStudent/room/${room.idRoom}">
                    <img src="http://localhost:8899/image/${room.room.thumbnail}" alt="รูปโปสเตอร์" id="posterImage">
                </a>
            </div>
            <h4>${room.room.nameRoom}</h4>
          
        </div>
    </c:forEach>
      <img src="image/addRoom.png" alt="เพิ่มห้องเรียน" class="iconAddRoom" onclick="togglePopup()">
     </div>
     
    <div class="popup" id="addRoomPopup" style="display: none;">
        <div class="popup-content">
            <h2>เข้าร่วมชั้นเรียน</h2>
           
            <form id="roomForm" action="/joinRoom" method="POST">
                <p class="titel">รหัสชั้นเรียน (ขอรหัสจากผู้สอน แล้วป้อนรหัสที่นี่)</p>
                <input type="text" name="idRoom" id="idRoom" placeholder="กรุณากรอกรหัสชั้นเรียน" required>
                <div class="btn">
                    <input type="button" id="close-popup" value="ยกเลิก" onclick="cancelAndReturn()">
                    <input type="submit" id="submitButton" value="ยืนยัน" onclick="">
                </div>
            </form>
        </div>
    </div> 
    
</body>
</html>