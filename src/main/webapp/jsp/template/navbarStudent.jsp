<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<nav class="mb-10 bg-[#474F7A] w-full px-5">
		<div class="topnav h-24 flex gap-10">
			<div class="logo h-full">
				<a href="/indexteacher">
					<img src="http://localhost:8899/image/logo.png" class="h-full object-cover" alt="logo" >
				</a>
				
			</div>
			<ul class="h-full flex items-center gap-10">
				<li class="text-xl w-fit font-semibold tracking-widest text-white relative">
					<a href="/indexstudent">
						หน้าแรก	
					</a>
					<div class="absolute w-full mt-1 rounded-xl h-1 line nav-line"></div>
				</li>
				<li class="text-xl w-fit font-semibold tracking-widest text-white relative">
					<a href="/room/${rooms.idRoom}/people">
						บุคคล
					</a>
					<div class="absolute w-full mt-1 h-1 line rounded-xl nav-line"></div>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>