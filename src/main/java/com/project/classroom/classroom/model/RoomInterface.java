package com.project.classroom.classroom.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface RoomInterface extends CrudRepository<Room, Integer> {

	Iterable<Room> findAll();
	List<Room> findByIdRoom(Integer idRoom); 
}
