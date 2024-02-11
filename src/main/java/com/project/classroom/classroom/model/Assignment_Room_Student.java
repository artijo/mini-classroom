package com.project.classroom.classroom.model;

import java.util.Date;

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
	
	private int score;
	private String filePath;
	private Date createdAt;
	private Date updatedAt;
	private Date deletedAt;
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	
}
