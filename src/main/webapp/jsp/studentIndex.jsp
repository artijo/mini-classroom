<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class Room</title>
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

    </script>
</head>
<body>
<nav>
        <img src="image/logo.png" alt="โลโก้">
        <a href="" class="logout">ออกจากระบบ</a>
    </nav>
    <div class="container">
     <c:if test="${empty roomList}">
        <h1>คุณยังไม่ได้เข้าร่วมชั้นเรียนชั้นเรียน</h1>
    </c:if>

    <c:forEach var="room" items="${roomList}">
        
        <div class="item">
            <div class="poster">
                <a href="">
                    <img src="${room.thumbnail}" alt="รูปโปสเตอร์" id="posterImage">
                </a>
            </div>
            <h4>${room.nameRoom}</h4>
            <a href="">
                <img src="image/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div>
    </c:forEach>
    
    <div class="popup" id="addRoomPopup" style="display: none;">
        <div class="popup-content">
            <h2>เข้าร่วมชั้นเรียน</h2>
           
            <form id="roomForm" action="{{ route('indexStudent.addRoom') }}" method="POST">
                @csrf
                <p class="titel">รหัสชั้นเรียน (ขอรหัสจากผู้สอน แล้วป้อนรหัสที่นี่)</p>
                <input type="text" name="idRoom" id="idRoom" placeholder="กรุณากรอกรหัสชั้นเรียน" required>
                <div class="btn">
                    <input type="button" id="close-popup" value="ยกเลิก" onclick="window.location.href='indexStudent'">
                    <input type="submit" id="submitButton" value="ยืนยัน" onclick="checkAndSubmit()">
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>