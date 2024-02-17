package com.project.classroom.classroom.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface RoomInterface extends CrudRepository<Room, Integer> {

	Iterable<Room> findAll();
	List<Room> findByIdRoom(Integer idRoom); 
	
	String query2 = "SELECT * FROM room WHERE code_room = ?";
	@Query(value = query2, nativeQuery = true)
	Room findByCodeId(String code_id);
	
	String query3 = "SELECT * FROM room WHERE id_teacher = ?";
	@Query(value = query3, nativeQuery = true)
	List<Room> findByTeacherId(String id_teacher);
	
	@Query(value = "SELECT * FROM room WHERE id_room = ?  AND id_teacher = ? ", nativeQuery = true)
	List<Room> qq(Integer idRoom,String id_teacher);
		
}
