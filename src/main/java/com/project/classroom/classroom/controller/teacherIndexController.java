package com.project.classroom.classroom.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.project.classroom.classroom.model.Assignment;
import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.Teacher;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.TeacherInterface;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class teacherIndexController {
	@Autowired
	RoomInterface roomInterface;
	
	@Autowired
	TeacherInterface TeacherInterface;

<<<<<<< Updated upstream
	@GetMapping("/indexteach")
    public String index(Model model, jakarta.servlet.http.HttpServletRequest request) {
=======
	@GetMapping("/indexteacher")
    public String index(HttpServletRequest request, HttpServletResponse response,Model model) {
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
		if (userId.equals("") || role.equals("")) {
			return "redirect:/login";
		}
        Iterable<Room> roomlist = roomInterface.findAll();
        model.addAttribute("roomList", roomlist); // แก้ไขตรงนี้
=======
		
		List<Room> rooms = roomInterface.findByTeacherId(userId);
		
	
        model.addAttribute("roomList", rooms); 
>>>>>>> Stashed changes
        return "teacherIndex";
    }

	 	
	    @PostMapping("/addRoom")
	    public String addRoomTeacher(
	            @RequestParam("codeRoom") String codeRoom,
	            @RequestParam("nameRoom") String nameRoom,
<<<<<<< Updated upstream
	            Model model, HttpServletRequest request) throws Exception {
	    	String userId = "";
=======
	            HttpServletRequest request, HttpServletResponse response,
	            Model model) throws Exception {
	 		String userId = "";
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
			if (userId.equals("") || role.equals("")) {
				return "redirect:/login";
			}

=======
			
			Teacher findTeacherId = TeacherInterface.findById(userId);
			
>>>>>>> Stashed changes
	        Room newRoom = new Room();
	        newRoom.setCodeRoom(codeRoom);
	        newRoom.setNameRoom(nameRoom);
	        newRoom.setCreatedAt(new Date());
	        newRoom.setThumbnail("default_poster.png");
	        newRoom.setTeacher(findTeacherId);
	        roomInterface.save(newRoom);
	     
	        return "redirect:/indexteacher";
	    }
	    

	    
}
