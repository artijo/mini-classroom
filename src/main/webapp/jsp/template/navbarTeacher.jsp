<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.classroom.classroom.controller.*"%>
<link rel="stylesheet" href="http://localhost:8899/css/nav.css">
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lato&family=Mitr&family=Noto+Serif+Thai&display=swap');
* {
    padding: 0;
    margin: 0;
    font-family: 'Mitr', sans-serif;
}
nav {
    display: flex;
    align-items: center;
    padding: 10px 20px;
    background-color: #474F7A;
}
ul {
    list-style-type: none;
}

ul.menu {
    display: flex;
    align-items: center;
}

ul.menu a {
    text-decoration: none;
    display: block;
    padding: 15px 1.5rem;
    color: white;
}

ul.menu li:hover {
    background-color: #FF56D0;
}

ul.menu a:hover {
    color: white;
}

.menu li {
    position: relative;
    margin-left: 20px;
}
img.navAss {
    margin-right: 20px;
    height: 70px;
}
</style>
</head>
<header>
	<nav class="mb-10">
		<div class="topnav flex gap-10">
			<div class="logo h-full">
				<a href="/indexteacher">
					<img src="http://localhost:8899/image/logo.png" class="h-full object-cover navAss" alt="logo" >
				</a>
				
			</div>
			<ul class="flex items-center gap-10">
				<li class="text-xl w-fit font-semibold tracking-widest text-white relative">
					<a href="/indexteacher">
						หน้าแรก	
					</a>
					<div class="absolute w-full mt-1 rounded-xl h-1 line nav-line"></div>
				</li>
				<li class="text-xl w-fit font-semibold tracking-widest text-white relative">
					<a href="/room/${assignment[0].room.idRoom}/people">
						บุคคล
					</a>
					<div class="absolute w-full mt-1 h-1 line rounded-xl nav-line"></div>
				</li>
			</ul>
		</div>
	</nav>
</header>