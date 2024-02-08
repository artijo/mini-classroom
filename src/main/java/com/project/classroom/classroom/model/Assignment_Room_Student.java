package com.project.classroom.classroom.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;

@Entity
public class Assignment_Room_Student {
	@EmbeddedId
	AssignmentRoomStudentKey id;
	
	@ManyToOne
	@MapsId("assignmentId")
	@JoinColumn(name = "assignment_id")
	Assignment assignment;
	
	@ManyToOne
	@MapsId("roomId")
	@JoinColumn(name = "room_id")
	Room room;
	
	@ManyToOne
	@MapsId("studentId")
	@JoinColumn(name = "student_id")
	Student student;
	
	private String createdAt;
	private String updatedAt;
	private String deletedAt;
	public AssignmentRoomStudentKey getId() {
		return id;
	}
	public void setId(AssignmentRoomStudentKey id) {
		this.id = id;
	}
	public Assignment getAssignment() {
		return assignment;
	}
	public void setAssignment(Assignment assignment) {
		this.assignment = assignment;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getDeletedAt() {
		return deletedAt;
	}
	public void setDeletedAt(String deletedAt) {
		this.deletedAt = deletedAt;
	}
	
	
}
