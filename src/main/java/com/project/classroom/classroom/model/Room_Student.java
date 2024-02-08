package com.project.classroom.classroom.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;

@Entity
public class Room_Student {
	@EmbeddedId
	RoomStudentKey id;
	
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
	public RoomStudentKey getId() {
		return id;
	}
	public void setId(RoomStudentKey id) {
		this.id = id;
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
