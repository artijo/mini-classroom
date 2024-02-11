package com.project.classroom.classroom.model;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface StudentInterface extends CrudRepository<Student, Integer> {
	
	// find by email
	String sqlByEmail = "SELECT * FROM student WHERE email = ?";
	@Query(value = sqlByEmail, nativeQuery = true)
	Student findByEmail(String email);
}
