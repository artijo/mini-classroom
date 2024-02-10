package com.project.classroom.classroom.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;

import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
//	GetRoom after click
	@GetMapping("/room/{idRoom}")
	public String getRoom(@PathVariable("idRoom") Integer idRoom, Model model) {
		Iterable<Room> room = roomInterface.findByIdRoom(idRoom);
		Iterable<Assignment> assignment = assignmentInterface.getAssignmentOnRoom(idRoom);
		model.addAttribute("room", room);
		model.addAttribute("assignment", assignment);
		return "teacherRoom";
	}
	
//	Route to Insert Page
	@GetMapping("/insert/{idRoom}")
	public String insertPage(@PathVariable("idRoom") Integer idRoom, Model model) {
		model.addAttribute("idRoom",idRoom);
		return "teacherInsert";
		
	}
	
	public String upload(MultipartFile file) {
	    try {
	        String originalFilename = file.getOriginalFilename();
	        String uniqueFileName = System.currentTimeMillis() + "_" + originalFilename;
	        String uploadDirectory = "D:" + File.separator + "Twachi web" + File.separator + "classroom" + File.separator +
	                                 "src" + File.separator + "main" + File.separator + "resources" + File.separator + "static" + File.separator + "file";
	        File directory = new File(uploadDirectory);
	        if (!directory.exists()) {
	            directory.mkdirs();
	        }
	        file.transferTo(new File(directory, uniqueFileName));

	        return "Upload successful";
	    } catch (IOException e) {
	        e.printStackTrace(); 
	        return "Upload unsuccessful";
	    }
	}

	@PostMapping("/insertToDatabase")
	public String insertAssignment(
	        @RequestParam("idRoom") Integer idRoom,
	        @RequestParam("title") String title,
	        @RequestParam("detail") String detail,
	        @RequestParam("dueDate") String dueDate,
	        @RequestParam("fullScore") Integer fullScore,
	        @RequestParam("file") MultipartFile file,
	        Model model) throws Exception {
	    Room roomId = new Room();
	    roomId.setIdRoom(idRoom);
	    Assignment newAssignment = new Assignment();

	    if (!file.isEmpty()) {
	        String callUpload = upload(file);
	        System.out.println(callUpload);
	        newAssignment.setFile(file.getOriginalFilename());
	    } else {
	        newAssignment.setFile(null);
	    }
	    newAssignment.setTitle(title);
	    newAssignment.setDueDate(dueDate);
	    newAssignment.setDetail(detail);
	    newAssignment.setFullScore(fullScore);
	    newAssignment.setRoom(roomId);
	    newAssignment.setCreatedAt(new Date());
	    assignmentInterface.save(newAssignment);
	    return "redirect:/roomTeacher/room/" + idRoom;
	}
	
	@GetMapping("/assignment/{idAssignment}")
	public String getAssignment(@PathVariable("idAssignment") Integer idAss, Model model) {
		return "teacherAssignment";
	}

}


