package com.project.classroom.classroom.model;

import java.io.Serializable;

import jakarta.persistence.Column;

public class AssignmentRoomStudentKey implements Serializable {
	@Column(name = "assignment_id")
	private int assignmentId;

	@Column(name = "room_id")
	private int roomId;

	@Column(name = "student_id")
	private int studentId;
}
