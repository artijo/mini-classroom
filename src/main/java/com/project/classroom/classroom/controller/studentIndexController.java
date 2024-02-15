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

import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.RoomStudentKey;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Room_StudentInterface;
import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class studentIndexController {
	@Autowired
	Room_StudentInterface roomStdInterface;
	
	@Autowired
	RoomInterface roomInterface;
	
	@Autowired
	StudentInterface StdInterface;
	
	@GetMapping("/indexstudent")
    public String indexstd(HttpServletRequest request, HttpServletResponse response,Model model) {
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
		
        Iterable<Room_Student> roomlist = roomStdInterface.findByStudentId(stdId);
        model.addAttribute("roomList", roomlist);    
        return "studentIndex";
    	}
	

	    @PostMapping("/joinRoom")
	    public String addRoomStudent(
	            @RequestParam("idRoom") String code_id,
	            HttpServletRequest request, HttpServletResponse response,
	            Model model) throws Exception {
<<<<<<< HEAD
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
	    	    newRoomStudent.setRoom(findCodeId);
	    	    newRoomStudent.setStudent(findStdId);
	    	    newRoomStudent.setCreatedAt(new Date());
	    	roomStdInterface.save(newRoomStudent);
	     
	        return "";
//	        eturn "redirect:/indexstudent";
=======

	        Room newRoom = new Room();
	        newRoom.setCodeRoom(codeRoom);
	        newRoom.setNameRoom(nameRoom);
	        newRoom.setCreatedAt(new Date());
	        newRoom.setThumbnail("image/default_poster.png");
	        roomStdInterface.save(newRoom);	     
	        return "redirect:/indexteach";
>>>>>>> 9d52a6dc27e8ec45a50c9bf579a3cefea3e358ab
	    }
	    
}
