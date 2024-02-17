<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.classroom.classroom.controller.*"%>
<link rel="stylesheet" href="http://localhost:8899/css/nav.css">
<header>
	<nav class="mb-10 bg-[#474F7A] w-full px-5">
		<div class="topnav h-24 flex gap-10">
			<div class="logo h-full">
				<img src="http://localhost:8899/image/logo.png" class="h-full object-cover" alt="logo" >
			</div>
			<ul class="h-full flex items-center gap-10">
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