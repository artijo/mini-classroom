package com.project.classroom.classroom.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.Teacher;
import com.project.classroom.classroom.model.TeacherInterface;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {
	@Autowired
	StudentInterface studentInterface;
	@Autowired
	TeacherInterface teacherInterface;
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@PostMapping("/login")
	public String loginPost(HttpServletResponse res, HttpServletRequest req,@RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("role") String role) {
		if (role.equals("student")) {
			Student std = studentInterface.findByEmail(email);
			if (std != null) {
				BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), std.getPassword());
				if (result.verified) {
					Cookie cookie = new Cookie("user", std.getStudentId());
					cookie.setMaxAge(60 * 60 * 24 * 30);
					res.addCookie(cookie);
					Cookie cookie2 = new Cookie("role", "student");
					cookie2.setMaxAge(60 * 60 * 24 * 30);
					res.addCookie(cookie2);
					HttpSession session = req.getSession();
					session.setAttribute("useremail", std.getEmail());
					return "redirect:/";
				}
			}
		} else {
			Teacher teacher = teacherInterface.findByEmail(email);
			if (teacher != null) {
				if (BCrypt.verifyer().verify(password.toCharArray(), teacher.getPassword()).verified) {
					Cookie cookie = new Cookie("user", teacher.getIdTeacher()+"");
					cookie.setMaxAge(60 * 60 * 24 * 30);
					res.addCookie(cookie);
					Cookie cookie2 = new Cookie("role", "teacher");
					cookie2.setMaxAge(60 * 60 * 24 * 30);
					res.addCookie(cookie2);
					HttpSession session = req.getSession();
					session.setAttribute("useremail", teacher.getEmail());
					return "redirect:/";
				}
			}
		}
		return "redirect:/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletResponse res, HttpServletRequest req) {
		Cookie cookie = new Cookie("user", "");
		cookie.setMaxAge(0);
		res.addCookie(cookie);
		Cookie cookie2 = new Cookie("role", "");
		cookie2.setMaxAge(0);
		res.addCookie(cookie2);
		HttpSession session = req.getSession();
		session.removeAttribute("useremail");
		return "redirect:/login";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	@PostMapping("/register")
	public String registerPost(@RequestParam("studentid") String stdid ,@RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("fname") String fname, @RequestParam("lname") String lname ,@RequestParam("role") String role) {
		String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());
		System.out.println(bcryptHashString);
		System.out.println(password);
		if(role.equals("student")) {
	        //student
			Student student = new Student();
			student.setStudentId(stdid);
			student.setEmail(email);
			student.setFname(fname);
			student.setLname(lname);
			student.setPassword(bcryptHashString);
			student.setCreatedAt(new Date());
			student.setUpdatedAt(new Date());
			studentInterface.save(student);
		}
		else {
			//teacher
			Teacher teacher = new Teacher();
			teacher.setEmail(email);
			teacher.setFname(fname);
			teacher.setLname(lname);
			teacher.setPassword(bcryptHashString);
			teacher.setCreatedAt(new Date());
			teacher.setUpdatedAt(new Date());
			teacherInterface.save(teacher);
		}
        return "redirect:/login";
    }
	
	@GetMapping("/forgot")
	public String forgot() {
		return "forgot";
	}
	@PostMapping("/forgot")
	public String forgotPost(@RequestParam("email") String email, @RequestParam("role") String role, Model model) {
		Student std = studentInterface.findByEmail(email);
		Teacher teacher = teacherInterface.findByEmail(email);
		if (std != null || teacher != null) {
			model.addAttribute("email", email);
			model.addAttribute("role", role);
			return "reset";
		} else {
			model.addAttribute("error", "Email not found");
			return "forgot";
		}
	}
	
	
	@PostMapping("/reset")
	public String resetPost(@RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("role") String role, @RequestParam("confirmPassword") String passwordcf,@RequestParam("fname")String fname,@RequestParam("lname") String lname ,Model model) {
		
		if(!password.equals(passwordcf)) {
			model.addAttribute("error", "Password and Confirm Password not match");
		                return "forgot";
		}
        if (role.equals("student")) {
            Student std = studentInterface.findByEmail(email);
            if (std != null) {
				if (std.getFname().equals(fname) && std.getLname().equals(lname)) {
					std.setPassword(BCrypt.withDefaults().hashToString(12, password.toCharArray()));
					studentInterface.save(std);
				}else {
					model.addAttribute("error", "Name not match");
                    return "reset";
                }
				}
        } else {
            Teacher teacher = teacherInterface.findByEmail(email);
            if (teacher != null) {
                if(teacher.getFname().equals(fname) && teacher.getLname().equals(lname)){
                    teacher.setPassword(BCrypt.withDefaults().hashToString(12, password.toCharArray()));
                    teacherInterface.save(teacher);
                    }else {
                    	                        model.addAttribute("error", "Name not match");
                        return "reset";
                    }
            }
        }
        return "redirect:/login";
    }
}