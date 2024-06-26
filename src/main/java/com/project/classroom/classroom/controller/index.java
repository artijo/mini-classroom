package com.project.classroom.classroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.Teacher;
import com.project.classroom.classroom.model.TeacherInterface;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class index {
	@Autowired
	TeacherInterface teacherInterface;
	@Autowired
	StudentInterface studentInterface;
	
	@GetMapping("/")
	public String index(HttpServletRequest request, HttpServletResponse response, Model m) {
		HttpSession session = request.getSession();
		String useremail = (String) session.getAttribute("useremail");
		if (useremail == null) {
			return "redirect:/login";
		}
		
		String userId = "";
		String role = "";
		Cookie[] cookies = request.getCookies();
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
			return "redirect:/login";
		}
		if (role.equals("student")) {
//			Student student = studentInterface.findById(Integer.parseInt(userId)).get();
//			m.addAttribute("student", student);
			return "redirect:/indexstudent";
		} else if (role.equals("teacher")) {
//			Teacher teacher = teacherInterface.findById(Integer.parseInt(userId)).get();
//			m.addAttribute("teacher", teacher);
			return "redirect:/indexteacher";
		}
		return "redirect:/login";
	}

}
