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

	public int getAssignmentId() {
		return assignmentId;
	}

	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
	
	
}
