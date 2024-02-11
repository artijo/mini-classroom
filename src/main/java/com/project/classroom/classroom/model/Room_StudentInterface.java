package com.project.classroom.classroom.model;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface Room_StudentInterface extends CrudRepository<Room_Student, Integer> {
	
}
