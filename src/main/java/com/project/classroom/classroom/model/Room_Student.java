package com.project.classroom.classroom.model;

import java.util.Date;

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
	
	private Date createdAt;
	private Date updatedAt;
	private Date deletedAt;
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
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Date getDeletedAt() {
		return deletedAt;
	}
	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}
	
}
