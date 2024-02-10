package com.project.classroom.classroom.controller;

import java.util.ArrayList;
import java.util.Optional;

import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.classroom.classroom.model.Assignment;
import com.project.classroom.classroom.model.AssignmentInterface;
import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.TeacherInterface;

@Controller
@RequestMapping("/roomTeacher")
public class RoomController {

	@Autowired
	RoomInterface roomInterface;
	@Autowired
	AssignmentInterface assignmentInterface;
	
	@GetMapping("/room/{idRoom}")
	public String getRoom(@PathVariable("idRoom") Integer idRoom,Model model) {
		Iterable<Room> room = roomInterface.findByIdRoom(idRoom);
		Iterable<Assignment> assignment = assignmentInterface.getAssignmentOnRoom(idRoom);
		model.addAttribute("room", room);
		model.addAttribute("assignment", assignment);
		return "teacherRoom";
	}
	
}


