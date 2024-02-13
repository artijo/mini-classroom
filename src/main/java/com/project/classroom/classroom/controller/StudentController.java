package com.project.classroom.classroom.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.project.classroom.classroom.model.AssignmentInterface;
import com.project.classroom.classroom.model.Assignment_Room_StudentInterface;
import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Room_StudentInterface;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.TeacherInterface;

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
	
	@GetMapping("/room/{roomId}/people")
	public String people(@PathVariable("roomId") String roomId,Model model) {
		List<Room_Student> room_student = room_studentInterface.findByRoomId(roomId);
		
		Room room = roomInterface.findByIdRoom(Integer.parseInt(roomId)).get(0);
		model.addAttribute("room", room);
		
		System.out.println(room.getTeacher().getFname());
		
        model.addAttribute("students", room_student);
        return "people";
	}
}
