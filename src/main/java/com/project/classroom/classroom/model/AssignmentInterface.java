package com.project.classroom.classroom.model;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface AssignmentInterface extends CrudRepository<Assignment, Integer> {
	
	
	<S extends Assignment> S save(S entity);
	
	
	String sqlByIdRoom = "SELECT * FROM assignment a WHERE id_room = ?";
	@Query(value = sqlByIdRoom,nativeQuery = true)
	List<Assignment> getAssignmentOnRoom(Integer idRoom);
	

}
