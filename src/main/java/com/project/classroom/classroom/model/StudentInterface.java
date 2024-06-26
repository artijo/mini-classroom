package com.project.classroom.classroom.model;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface StudentInterface extends CrudRepository<Student, Integer> {
	
	// find by email
	String sqlByEmail = "SELECT * FROM student WHERE email = ?";
	@Query(value = sqlByEmail, nativeQuery = true)
	Student findByEmail(String email);
	
	String sqlById = "SELECT * FROM student WHERE student_id = ?";
	@Query(value =sqlById  , nativeQuery = true)
	List<Student> findByIdStudent(String studentId);
	
	String sqlByStdId = "SELECT * FROM student WHERE student_id = ?";
	@Query(value = sqlByStdId, nativeQuery = true)
	Student findById(String student_id);
	
	String sqlByIdstudent = "SELECT * FROM student WHERE id_student = ?";
	@Query(value = sqlByIdstudent,nativeQuery = true)
	Student getinfoByID(String id_student);
}
