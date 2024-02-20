package com.project.classroom.classroom.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.project.classroom.classroom.model.StudentInterface;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import com.project.classroom.classroom.uploadservice.*;



@Controller
@RequestMapping("/roomTeacher")
public class RoomController {

	@PersistenceContext
	private EntityManager entityManager;
	
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
	
	private boolean checkTeacher(String teacher,Integer idRoom) {
		if(roomInterface.qq(idRoom, teacher).size() != 0) {
			System.out.println("ture");
			return true;
		}else {
			System.out.println("false");
			return false;
		}
	}
	
	
	public static String covertToThaiTime(Date date) {
	    SimpleDateFormat thaitime = new SimpleDateFormat("dd/MM/yyyy HH:mm", new Locale("th", "TH"));
	    String formattedDate = thaitime.format(date);
	    String[] arrOfStr = formattedDate.split(" ");
	    String[] dateArr = arrOfStr[0].split("/");
	    String thaiDateString;
	    String thaiTimeString = arrOfStr[1];
	    switch (dateArr[1]) {
	        case "01": {
	            thaiDateString = dateArr[0] + " มกราคม " + dateArr[2];
	            break;
	        }
	        case "02": {
	            thaiDateString = dateArr[0] + " กุมภาพันธ์ " + dateArr[2];
	            break;
	        }
	        case "03": {
	            thaiDateString = dateArr[0] + " มีนาคม " + dateArr[2];
	            break;
	        }
	        case "04": {
	            thaiDateString = dateArr[0] + " เมษายน " + dateArr[2];
	            break;
	        }
	        case "05": {
	            thaiDateString = dateArr[0] + " พฤษภาคม " + dateArr[2];
	            break;
	        }
	        case "06": {
	            thaiDateString = dateArr[0] + " มิถุนายน " + dateArr[2];
	            break;
	        }
	        case "07": {
	            thaiDateString = dateArr[0] + " กรกฎาคม " + dateArr[2];
	            break;
	        }
	        case "08": {
	            thaiDateString = dateArr[0] + " สิงหาคม " + dateArr[2];
	            break;
	        }
	        case "09": {
	            thaiDateString = dateArr[0] + " กันยายน " + dateArr[2];
	            break;
	        }
	        case "10": {
	            thaiDateString = dateArr[0] + " ตุลาคม " + dateArr[2];
	            break;
	        }
	        case "11": {
	            thaiDateString = dateArr[0] + " พฤศจิกายน " + dateArr[2];
	            break;
	        }
	        case "12": {
	            thaiDateString = dateArr[0] + " ธันวาคม " + dateArr[2];
	            break;
	        }
	        default:
	            thaiDateString = arrOfStr[0];
	    }
	    
	    return thaiDateString + " " + thaiTimeString;
	}


	
//	GetRoom after click
	@GetMapping("/room/{idRoom}")
	public String getRoom(@PathVariable("idRoom") Integer idRoom, Model model, jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) {
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
		if(!checkTeacher(userId,idRoom)) {
			return "redirect:/indexteacher";
		}
		Iterable<Room> room = roomInterface.findByIdRoom(idRoom);
		Iterable<Assignment> assignment = assignmentInterface.getAssignmentOnRoom(idRoom);
		model.addAttribute("room", room);
		model.addAttribute("assignment", assignment);
		return "teacherRoom";
	}
	

//	Route to Insert Page
	@GetMapping("/insert/{idRoom}")
	public String insertPage(@PathVariable("idRoom") Integer idRoom, Model model, jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) {
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
		if(!checkTeacher(userId,idRoom)) {
			return "redirect:/indexteacher";
		}
		model.addAttribute("idRoom",idRoom);
		return "teacherInsert";
	}
	

	
	@PostMapping("/insertToDatabase")
	public String insertAssignment(
	        @RequestParam("idRoom") Integer idRoom,
	        @RequestParam("title") String title,
	        @RequestParam("detail") String detail,
	        @RequestParam("dueDate") String dueDate,
	        @RequestParam("fullScore") Integer fullScore,
	        @RequestParam("file") MultipartFile file,
	        Model model, HttpServletRequest request) throws Exception {
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
		if(!checkTeacher(userId,idRoom)) {
			return "redirect:/indexteacher";
		}
		
//		Room Object
	    Room roomId = new Room();
	    roomId.setIdRoom(idRoom);
//	    Assignment Object
	    Assignment newAssignment = new Assignment();
//	    Upload service
	    UploadService service = new UploadService();
//	    Check file is Empty
	    if (!file.isEmpty()) {
	        newAssignment.setFile(service.upload(file));
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

	@GetMapping("/assignment/{idAssignment}/{roomId}")
	public String getAssignment(@PathVariable("idAssignment") Integer idAss,@PathVariable("roomId") Integer roomId, Model model, jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) {
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
		if(!checkTeacher(userId,roomId)) {
			return "redirect:/indexteacher";
		}
		Iterable<Assignment_Room_Student> allListAssignment = assignment_Room_Student.getRelationByIdAssKey(idAss);	
		Iterable<Assignment> assignment = assignmentInterface.getListByPrimaryKey(idAss);
		Iterable<Room_Student> student = room_studentInterface.findByRoomId(roomId.toString());
		model.addAttribute("assignment",assignment);
		model.addAttribute("allListAssignment",allListAssignment);
		model.addAttribute("student",student);
		return "teacherAssignment";
	}
	
	
	
	@Transactional
	@PostMapping("/insertScore/{assId}/{roomId}")
	public String updateScore(
			@PathVariable("assId") Integer idAss,
			@PathVariable("roomId") Integer idRoom,
			@RequestParam("studentId") Integer idStu,
			@RequestParam("score") Integer score,
			Model model) 
	{
		String updateNative = "UPDATE Assignment_Room_Student a SET a.score = ? WHERE a.assignment_id = ? AND a.student_id = ?";
    	entityManager.createNativeQuery(updateNative)
	    	.setParameter(1, score)
	    	.setParameter(2, idAss)
	    	.setParameter(3, idStu).executeUpdate();
		return "redirect:/roomTeacher/assignment/"+idAss+"/"+idRoom;
	}
	
	@GetMapping("/delete/assignment/{idAss}/room/{idRoom}")
	public String deleteAss(@PathVariable("idAss") Integer idAss,@PathVariable("idRoom") Integer idRoom) {
		Iterable<Assignment> ass = assignmentInterface.getListByPrimaryKey(idAss);
		Iterable<Assignment_Room_Student> allListAssignment = assignment_Room_Student.getRelationByIdAssKey(idAss);
		if(allListAssignment != null) {
			assignment_Room_Student.deleteAll(allListAssignment);
		}
		for(Assignment assItem : ass) {
			assignmentInterface.delete(assItem);
			break;
		}
		return "redirect:/roomTeacher/room/"+idRoom;
	}
}


