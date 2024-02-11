package com.project.classroom.classroom.controller;

import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.Teacher;
import com.project.classroom.classroom.model.TeacherInterface;

import at.favre.lib.crypto.bcrypt.BCrypt;


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
	public String loginPost(@RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("role") String role) {
		if (role.equals("student")) {
			Student std = studentInterface.findByEmail(email);
			if (std != null) {
				BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), std.getPassword());
				System.out.println(password);
				System.out.println(std.getPassword());
				System.out.println(result.verified);
				if (result.verified) {
					System.out.println("verified");
					return "redirect:/";
				}
			}
		} else {
			Teacher teacher = teacherInterface.findByEmail(email);
			if (teacher != null) {
				if (BCrypt.verifyer().verify(password.toCharArray(), teacher.getPassword()).verified) {
					return "redirect:/";
				}
			}
		}
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
}
