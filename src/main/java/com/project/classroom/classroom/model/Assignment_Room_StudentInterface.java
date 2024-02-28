package com.project.classroom.classroom.model;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface Assignment_Room_StudentInterface extends CrudRepository<Assignment_Room_Student, Integer> {
	
	String sqlByIdassignment = "SELECT * FROM assignment_room_student a WHERE assignment_id = ?";
	@Query(value = sqlByIdassignment,nativeQuery = true)
	List<Assignment_Room_Student> getRelationByIdAssKey(Integer idAss);
	
	String sqlByIdstudent = "SELECT * FROM assignment_room_student a WHERE student_id = ?";
	@Query(value = sqlByIdstudent,nativeQuery = true)
	List<Assignment_Room_Student> getRelationByIdStudKey(Integer idStud);
	
	@Query(value = "SELECT * FROM assignment_room_student a WHERE room_id = ?", nativeQuery = true)
	List<Assignment_Room_Student> getArsByRoom(Integer idRoom);

}
