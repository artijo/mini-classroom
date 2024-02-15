package com.project.classroom.classroom.model;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface Room_StudentInterface extends CrudRepository<Room_Student, Integer> {
	
	String query = "SELECT * FROM room_student WHERE room_id = ?";
	@Query(value = query, nativeQuery = true)
	List<Room_Student> findByRoomId(String roomId);
	
	String query2 = "SELECT * FROM room_student WHERE student_id = ? ";
	@Query(value = query2, nativeQuery = true)
	List<Room_Student> findByStudentId(String studentId);
	
	
}
