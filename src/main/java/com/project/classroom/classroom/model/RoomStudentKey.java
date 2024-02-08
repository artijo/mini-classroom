package com.project.classroom.classroom.model;

import java.io.Serializable;

import jakarta.persistence.Column;

public class RoomStudentKey implements Serializable {
	@Column(name = "room_id")
	private int roomId;
	
	@Column(name = "student_id")
	private int studentId;
}
