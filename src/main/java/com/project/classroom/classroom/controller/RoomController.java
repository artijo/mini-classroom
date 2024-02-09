package com.project.classroom.classroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.TeacherInterface;

@Controller
@RequestMapping("/roomTeacher")
public class RoomController {

	@Autowired
	RoomInterface roomInterface;
	
	@GetMapping("/room/{idRoom}")
	public String getRoom(@PathVariable Integer idRoom) {
		roomInterface.findByIdRoom(idRoom);
		return "teacherAssignment";
	}
}


