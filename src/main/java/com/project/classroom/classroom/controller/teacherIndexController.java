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

@Controller
public class teacherIndexController {
	@Autowired
	RoomInterface roomInterface;

	@GetMapping("/indexteach")
    public String index(Model model) {
        Iterable<Room> roomlist = roomInterface.findAll();
        model.addAttribute("roomList", roomlist); // แก้ไขตรงนี้
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
	        roomInterface.save(newRoom);
	     
	        return "redirect:/indexteach";
	    }
	
    
}
