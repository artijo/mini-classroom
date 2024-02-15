<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="/img/default_profile.png">
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="addRoomTeacher.css">
    <link rel="stylesheet" href="navIndex.css">
<title>Insert title here</title>
<script>
        function generateRandomCode() {
            var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var code = '';

            while (code.length < 12) {
                var randomIndex = Math.floor(Math.random() * characters.length);
                var character = characters.charAt(randomIndex);

                if (code.indexOf(character) === -1) {
                    code += character;
                }
            }

            var idRoomInput = document.getElementById('codeRoom');
            idRoomInput.value = code;
        }

        function togglePopup() {
            var addRoomPopup = document.getElementById('addRoomPopup');

            if (addRoomPopup.style.display === 'none' || addRoomPopup.style.display === '') {
                addRoomPopup.style.display = 'block';
            } else {
                addRoomPopup.style.display = 'none';
            }
        }


        function checkAndSubmit() {
            var idRoomInput = document.getElementById('codeRoom');
            var nameRoominput = document.getElementById('nameRoom');

            if (nameRoominput.value === '') {
                alert('กรุณากรอกชื่อชั้นเรียน');
                togglePopup();
                event.preventDefault();
                return;

            } else {

                var form = document.getElementById('roomForm');
                form.submit();
            }

            if (idRoomInput.value === '') {
                alert('กรุณากดสุ่มรหัสชั้นเรียน');
                togglePopup();
                event.preventDefault();
                return;

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
        <h1>คุณยังไม่ได้สร้างชั้นเรียน</h1>
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
        <!-- 
        <div class="item">
            <div class="poster">
                <a href="">
                    <img src="image/default_poster.png" alt="รูปโปสเตอร์" id="posterImage">
                </a>

            </div>
            <h4>SC363204 Java Web Application Development</h4>

            <a href="">
                <img src="image/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div>
        
                <div class="item">
            <div class="poster">
                <a href="{{ route('postTeacher', ['id' => $room->id]) }}">
                    <img src="{{ asset($room->photoRoom) }}" alt="รูปโปสเตอร์" id="posterImage">
                </a>
                
            </div>
            <h4>{{ $room->nameRoom }} </h4>
            
            <a href="/indexTeacher/addRoom/delete/{{$room->id}}" >
                <img src="img/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div>
    @empty
        <h1>คุณยังไม่ได้สร้างชั้นเรียน</h1>
    @endforelse
    
    
        <div class="item">
            <div class="poster">
                <a href="">
                    <img src="image/default_poster.png" alt="รูปโปสเตอร์" id="posterImage">
                </a>

            </div>
            <h4>SC363204 Java Web Application Development</h4>

            <a href="">
                <img src="image/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div>
        <div class="item">
            <div class="poster">
                <a href="">
                    <img src="image/default_poster.png" alt="รูปโปสเตอร์" id="posterImage">
                </a>

            </div>
            <h4>SC363204 Java Web Application Development</h4>

            <a href="">
                <img src="image/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div>
        <div class="item">
            <div class="poster">
                <a href="">
                    <img src="image/default_poster.png" alt="รูปโปสเตอร์" id="posterImage">
                </a>

            </div>
            <h4>SC363204 Java Web Application Development</h4>

            <a href="">
                <img src="image/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div>
        <div class="item">
            <div class="poster">
                <a href="">
                    <img src="image/default_poster.png" alt="รูปโปสเตอร์" id="posterImage">
                </a>

            </div>
            <h4>SC363204 Java Web Application Development</h4>

            <a href="">
                <img src="image/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div>
        <div class="item">
            <div class="poster">
                <a href="">
                    <img src="image/default_poster.png" alt="รูปโปสเตอร์" id="posterImage">
                </a>

            </div>
            <h4>SC363204 Java Web Application Development</h4>

            <a href="">
                <img src="image/deleteicon.png" alt="iconถังขยะ" id="deleteicon" onclick="return confirm('คุณต้องการลบห้องเรียนนี้ใช่หรือไม่?')">
            </a>
            <img src="" alt="">
        </div> -->

        <img src="image/addRoom.png" alt="เพิ่มห้องเรียน" class="iconAddRoom" onclick="togglePopup()">
    </div>

    <div class="popup" id="addRoomPopup" style="display: none;">
        <div class="popup-content">
            <h2>สร้างชั้นเรียน</h2>
            <form id="roomForm" action="/addRoom" method="post">

                <p class="titel">ชื่อชั้นเรียน</p>
                <input type="text" name="nameRoom" id="nameRoom" placeholder="กรุณากรอกชื่อชั้นเรียน">
                <p class="titel">รหัสชั้นเรียน</p>
                <input type="text" name="codeRoom" id="codeRoom" placeholder="กรุณากดสุ่มรหัส" readonly>
                <input type="button" id="randomCode" value="สุ่มรหัส" onclick="generateRandomCode()">
                <div class="btn">
                    <input type="button" id="close-popup" value="ยกเลิก" onclick="">
                    <input type="submit" id="submitButton" value="ยืนยัน" onclick="">
                </div>
            </form>
        </div>
    </div>
</body>
</html>