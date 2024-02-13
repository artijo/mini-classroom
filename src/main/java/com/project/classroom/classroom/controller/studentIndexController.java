package com.project.classroom.classroom.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Room_StudentInterface;

public class studentIndexController {
	@Autowired
	Room_StudentInterface roomStdInterface;
	
	@GetMapping("/indexstudent")
    public String index(Model model) {
        Iterable<Room_Student> roomlist = roomStdInterface.findAll();
        model.addAttribute("roomList", roomlist); 
        return "teacherIndex";
    }

	    @PostMapping("/addRoom")
	    public String addRoomTeacher(
	            @RequestParam("codeRoom") String codeRoom,
	            @RequestParam("nameRoom") String nameRoom,
	            Model model) throws Exception {

	        Room newRoom = new Room();
	        newRoom.setCodeRoom(codeRoom);
	        newRoom.setNameRoom(nameRoom);
	        newRoom.setCreatedAt(new Date());
	        newRoom.setThumbnail("image/default_poster.png");
	        roomStdInterface.save(newRoom);
	     
	        return "redirect:/indexteach";
	    }
}
