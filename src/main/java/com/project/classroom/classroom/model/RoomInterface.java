package com.project.classroom.classroom.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface RoomInterface extends CrudRepository<Room, Integer> {
	
	List<Room> findByIdRoom(Integer idRoom);
	
	
}
