package com.project.classroom.classroom.middleware;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.Teacher;
import com.project.classroom.classroom.model.TeacherInterface;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Component
public class Auth {
	@Autowired
	StudentInterface stdInterface;
	@Autowired
	TeacherInterface teacherInterface;
	
	public String isLoginMatch(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String useremail = (String) session.getAttribute("useremail");
		if (useremail == null) {
			return "Unauthorized";
		}
		String userId = "";
		String role = "";
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("user")) {
					userId = c.getValue();
				} else if (c.getName().equals("role")) {
					role = c.getValue();
				}
			}
		}
		if (userId.equals("") || role.equals("")) {
			return "Unauthorized";
		}
		
		if (role.equals("student")) {
			Student std = stdInterface.findById(userId);
			if (std == null || std.getEmail() != useremail) {
				return "Unauthorized";
			}
		} else if (role.equals("teacher")) {
			Teacher tc = teacherInterface.findById(userId);
			System.out.println(tc.getEmail());
			if (tc == null || tc.getEmail().equals(useremail) == false ) {
				return "Unauthorized";
			}
		}
		System.out.println("Heyy");
		return "Auth";
	}

}
