package com.project.classroom.classroom.controller;


import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.project.classroom.classroom.model.Assignment;
import com.project.classroom.classroom.model.AssignmentInterface;
import com.project.classroom.classroom.model.Assignment_Room_StudentInterface;
import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Room_StudentInterface;
import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.TeacherInterface;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.Cookie;

@Controller
public class StudentController {

	@Autowired
	StudentInterface studentInterface;
	@Autowired
	TeacherInterface teacherInterface;
	@Autowired
	RoomInterface roomInterface;
	@Autowired
	AssignmentInterface assignmentInterface;
	@Autowired
	Assignment_Room_StudentInterface assignment_Room_Student;
	@Autowired
	Room_StudentInterface room_studentInterface;
	@Autowired
	StudentInterface studentinterface;
	@PersistenceContext
	EntityManager  entityManager;
	
//	get all people
	@GetMapping("/room/{roomId}/people")
	public String people(@PathVariable("roomId") String roomId,Model model, jakarta.servlet.http.HttpServletRequest request) {
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
		List<Room_Student> room_student = room_studentInterface.findByRoomId(roomId);
		
		Room room = roomInterface.findByIdRoom(Integer.parseInt(roomId)).get(0);
		model.addAttribute("room", room);
		
		System.out.println(room.getTeacher().getFname());
		
        model.addAttribute("students", room_student);
        model.addAttribute("role", role);
        return "people";
	}
	
	@Transactional
	@GetMapping("/insert/Ass_student_room")
	public String test() {
		String insetNative = "INSERT INTO assignment_room_student (student_id,room_id,score,file_path,created_at,assignment_id) VALUES (?,?,?,?,?,?)";
		entityManager.createNativeQuery(insetNative)
			.setParameter(1, 2)
			.setParameter(2, 1)
			.setParameter(3, 10)
			.setParameter(4, "logo.png")
			.setParameter(5, new Date())
			.setParameter(6, 1)
			.executeUpdate();
		return "";
	}

	
	@GetMapping("/room/{idRoom}/{idAssignment}/submit")
	public String submit (@PathVariable("idRoom") String idRoom,@PathVariable("idAssignment") String idAssignment,Model m,HttpServletRequest request,HttpServletResponse response) {
	String userId =" ";
	Cookie [] cookie = request.getCookies();
	if(cookie!=null) {
		for(Cookie c : cookie) {
			if(c.getName().equals("user")) {
				userId = c.getValue();
			}
		}
	}
	System.out.println(idRoom);
	m.addAttribute("room", idRoom);
	Assignment id_ass = assignmentInterface.getAssignmentOnRoom(Integer.parseInt(idAssignment)).get(0);
	m.addAttribute("idAssignments", id_ass);
	Student std_id = studentinterface.findByIdStudent(userId).get(0);
	m.addAttribute("std_id", std_id);
	return "studentinsertAss";
	
}
}




