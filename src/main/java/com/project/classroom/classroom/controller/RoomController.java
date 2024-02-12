package com.project.classroom.classroom.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Optional;

import org.apache.catalina.connector.Response;
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
import com.project.classroom.classroom.model.Assignment_Room_Student;
import com.project.classroom.classroom.model.Assignment_Room_StudentInterface;
import com.project.classroom.classroom.model.Room;
import com.project.classroom.classroom.model.RoomInterface;
import com.project.classroom.classroom.model.Room_Student;
import com.project.classroom.classroom.model.Room_StudentInterface;
import com.project.classroom.classroom.model.Student;
import com.project.classroom.classroom.model.StudentInterface;
import com.project.classroom.classroom.model.TeacherInterface;



@Controller
@RequestMapping("/roomTeacher")
public class RoomController {

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
	
	
	public static String covertToThaiTime(Date date) {
	    SimpleDateFormat thaitime = new SimpleDateFormat("MM/dd/yyyy", new Locale("th", "TH"));
	    String formattedDate = thaitime.format(date);
	    String thaiString;
	    String[] arrOfStr = formattedDate.split("/");
	    switch (arrOfStr[1]) {
	        case "01": {
	            thaiString = arrOfStr[0] + " มกราคม " + arrOfStr[2];
	            break;
	        }
	        case "02": {
	            thaiString = arrOfStr[0] + " กุมภาพันธ์ " + arrOfStr[2];
	            break;
	        }
	        case "03": {
	            thaiString = arrOfStr[0] + " มีนาคม " + arrOfStr[2];
	            break;
	        }
	        case "04": {
	            thaiString = arrOfStr[0] + " เมษายน " + arrOfStr[2];
	            break;
	        }
	        case "05": {
	            thaiString = arrOfStr[0] + " พฤษภาคม " + arrOfStr[2];
	            break;
	        }
	        case "06": {
	            thaiString = arrOfStr[0] + " มิถุนายน " + arrOfStr[2];
	            break;
	        }
	        case "07": {
	            thaiString = arrOfStr[0] + " กรกฎาคม " + arrOfStr[2];
	            break;
	        }
	        case "08": {
	            thaiString = arrOfStr[0] + " สิงหาคม " + arrOfStr[2];
	            break;
	        }
	        case "09": {
	            thaiString = arrOfStr[0] + " กันยายน " + arrOfStr[2];
	            break;
	        }
	        case "10": {
	            thaiString = arrOfStr[0] + " ตุลาคม " + arrOfStr[2];
	            break;
	        }
	        case "11": {
	            thaiString = arrOfStr[0] + " พฤศจิกายน " + arrOfStr[2];
	            break;
	        }
	        case "12": {
	            thaiString = arrOfStr[0] + " ธันวาคม " + arrOfStr[2];
	            break;
	        }
	        default:
	            thaiString = formattedDate;
	    }
	    return thaiString;
	}

	
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

	        return uniqueFileName;
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
	        newAssignment.setFile(upload(file));
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
		Iterable<Assignment_Room_Student> allListAssignment = assignment_Room_Student.getRelationByIdAssKey(idAss);	
		Iterable<Assignment> assignment = assignmentInterface.getListByPrimaryKey(idAss);
		Iterable<Student> student = studentinterface.findAll(); 
		model.addAttribute("assignment",assignment);
		model.addAttribute("allListAssignment",allListAssignment);
		model.addAttribute("student",student);
		return "teacherAssignment";
	}
}


