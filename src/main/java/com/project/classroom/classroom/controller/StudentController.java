package com.project.classroom.classroom.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.classroom.classroom.middleware.Auth;
import com.project.classroom.classroom.model.Assignment;
import com.project.classroom.classroom.model.AssignmentInterface;
import com.project.classroom.classroom.model.AssignmentRoomStudentKey;
import com.project.classroom.classroom.model.Assignment_Room_Student;
import com.project.classroom.classroom.model.Assignment_Room_StudentInterface;
import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Room_StudentInterface;
import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.TeacherInterface;
import com.project.classroom.classroom.uploadservice.UploadService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
	
	@Autowired
	private Auth auth;
	
//	get all people
	@GetMapping("/room/{roomId}/people")
	public String people(@PathVariable("roomId") String roomId,Model model, jakarta.servlet.http.HttpServletRequest request) {
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
//	submit ass
	@Transactional
	@PostMapping("insert/Ass_student_room")
	public String test(
			@RequestParam("file_ass") MultipartFile file_ass,
			@RequestParam("stdid") String stdid,
			@RequestParam("rooms") Integer rooms,
			@RequestParam("assignment") Integer assignment,Model m,
			HttpServletRequest request
			) {
		
		  UploadService service = new UploadService();
		if(file_ass!=null||!file_ass.isEmpty()) {
			String insetNative = "INSERT INTO assignment_room_student (student_id,room_id,score,file_path,created_at,assignment_id) VALUES (?,?,?,?,?,?)";
			entityManager.createNativeQuery(insetNative)
				.setParameter(1, stdid)
				.setParameter(2, rooms)
				.setParameter(3, 0)
				.setParameter(4, service.upload(file_ass))
				.setParameter(5, new Date())
				.setParameter(6, assignment)
				.executeUpdate();
		}
		return "redirect:/room/"+rooms+"/assignment/"+assignment+"/student/"+stdid+"/insert/Ass_student_room";
	}
@GetMapping("room/{idRoom}/assignment/{idAssignment}/student/{idStudent}/insert/Ass_student_room")
public String show(Model model,@PathVariable("idAssignment") String idAssignment,@PathVariable("idRoom") String idRoom,
		@PathVariable("idStudent") String stdid,HttpServletRequest request) {
	String authcheck = auth.isLoginMatch(request);
	if (authcheck.equals("Auth") == false) {
		return "redirect:/login";
	}
	String userId =" ";
	Cookie [] cookie = request.getCookies();
	if(cookie!=null) {
		for(Cookie c : cookie) {
			if(c.getName().equals("user")) {
				userId = c.getValue();
			}
		}
	}
  List<Room > teacherId =roomInterface.findByIdRoom(Integer.parseInt(idRoom));
model.addAttribute("roomcontent", teacherId);

 List<Assignment>  asscontent = assignmentInterface.getAssignmentOnRoom(Integer.parseInt(idRoom));
model.addAttribute("asscontent", asscontent);

Student std_id = studentinterface.findByIdStudent(userId).get(0);
model.addAttribute("std_id", std_id);

List<Assignment_Room_Student> studentass = assignment_Room_Student.getRelationByIdAssKey(Integer.parseInt(idAssignment));
model.addAttribute("studentass", studentass);
	return "submitAss";
}

	@GetMapping("/room/{idRoom}/submit")
	public String submit (@PathVariable("idRoom") String idRoom,Model m,HttpServletRequest request,HttpServletResponse response) {
		String authcheck = auth.isLoginMatch(request);
		if (authcheck.equals("Auth") == false) {
			return "redirect:/login";
		}
	String userId =" ";
	Cookie [] cookie = request.getCookies();
	if(cookie!=null) {
		for(Cookie c : cookie) {
			if(c.getName().equals("user")) {
				userId = c.getValue();
			}
		}
	}
	
	m.addAttribute("room", idRoom);
	Room nameroom = roomInterface.findByIdRoom(Integer.parseInt(idRoom)).get(0);
	m.addAttribute("rooms", nameroom);
	
	List<Assignment> id_ass = assignmentInterface.getAssignmentOnRoom(Integer.parseInt(idRoom));
	m.addAttribute("idAssignments", id_ass);
	
	Student std_id = studentinterface.findByIdStudent(userId).get(0);
	m.addAttribute("std_id",std_id);
	
	return "stdAss";
	
}
// delete Ass for one student
	@GetMapping("/del/assignment_student_ass/{idStudent}/room/{idRoom}/assignment/{idAssignment}")
	public String deleteFileAssignment (@PathVariable("idStudent")  String idStudent,@PathVariable("idRoom") String idroom,@PathVariable("idAssignment") String assID) {
		Assignment_Room_Student assStudentID = assignment_Room_Student.getRelationByIdStudKey(Integer.parseInt(idStudent)).get(0);
		assStudentID.getStudent();
	
		
		if(!assStudentID.getFilePath().isEmpty()) {
			assignment_Room_Student.delete(assStudentID);
		}
		return "redirect:/room/"+idroom+"/assignment/"+assID+"/student/"+idStudent+"/insert/Ass_student_room";
	}
}




