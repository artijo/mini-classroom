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
}
