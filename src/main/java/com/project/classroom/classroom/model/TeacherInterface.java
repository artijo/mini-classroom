package com.project.classroom.classroom.model;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface TeacherInterface extends CrudRepository<Teacher, Integer>{
	
	// find by email
	String sqlByEmail = "SELECT * FROM teacher WHERE email = ?";
	@Query(value = sqlByEmail, nativeQuery = true)
	Teacher findByEmail(String email);

}
