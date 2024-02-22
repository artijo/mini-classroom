package com.project.classroom.classroom.controller;

import java.io.File;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.classroom.classroom.middleware.Auth;
import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.RoomStudentKey;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Room_StudentInterface;
import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class studentIndexController {
	
	@Autowired
	Room_StudentInterface roomStdInterface;
	
	@Autowired
	RoomInterface roomInterface;
	
	@Autowired
	StudentInterface StdInterface;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private Auth auth;
	
	@GetMapping("/indexstudent")
    public String indexstd(HttpServletRequest request, HttpServletResponse response,Model model) {
		String authcheck = auth.isLoginMatch(request);
		if (authcheck.equals("Auth") == false) {
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
			Student findStdId = StdInterface.findById(userId);
			int stdId = findStdId.getIdStudent();
			System.out.println(stdId);
	        Iterable<Room_Student> roomlist = roomStdInterface.findByStudentId(stdId);
	        model.addAttribute("roomList", roomlist);    
	        
	        return "studentIndex";
    	}
	
		@Transactional
	    @PostMapping("/joinRoom")
	    public String addRoomStudent(
	            @RequestParam("idRoom") String code_id,
	            HttpServletRequest request, HttpServletResponse response,
	            Model model) throws Exception {
			String authcheck = auth.isLoginMatch(request);
			if (authcheck.equals("Auth") == false) {
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
			
			Room findCodeId = roomInterface.findByCodeId(code_id);
	    	Student findStdId = StdInterface.findById(userId);
	    	Room_Student newRoomStudent = new Room_Student();
	    	
	    	String insetNative = "INSERT INTO room_student (room_id,student_id,created_at) VALUES (?,?,?)";
	    
	    	entityManager.createNativeQuery(insetNative)
		    	.setParameter(1, findCodeId.getIdRoom())
		    	.setParameter(2, findStdId.getIdStudent())
		    	.setParameter(3, new Date()).executeUpdate();
//	    	
//	    	newRoomStudent.setRoom(findCodeId);
//	    	newRoomStudent.setStudent(findStdId);
//	    	newRoomStudent.setCreatedAt(new Date());
//	    	roomStdInterface.save(newRoomStudent);
	     
	        return "redirect:/indexstudent";
	    }
	    
}