package com.project.classroom.classroom.model;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.yaml.snakeyaml.events.Event.ID;

public interface AssignmentInterface extends CrudRepository<Assignment, Integer> {
	
	
	<S extends Assignment> S save(S entity);
	
	
	
	String sqlByPrimary = "SELECT * FROM assignment a WHERE id_assignment = ?";
	@Query(value = sqlByPrimary,nativeQuery = true)
	List<Assignment> getListByPrimaryKey(Integer id_assignment);

	
	
	String sqlByIdRoom = "SELECT * FROM assignment a WHERE id_room = ? ORDER BY created_at DESC";
	@Query(value = sqlByIdRoom,nativeQuery = true)
	List<Assignment> getAssignmentOnRoom(Integer idRoom);
	
	


}
