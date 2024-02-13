package com.project.classroom.classroom.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Assignment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idAssignment;
	private String title;
	@Column(columnDefinition = "TEXT")
	private String detail;
	private Date dueDate;
	private String file;
	private int fullScore;
	@ManyToOne
	@JoinColumn(name = "idRoom")
	private Room room;
	private Date createdAt;
	private Date updatedAt;
	private Date deletedAt;
	public int getIdAssignment() {
		return idAssignment;
	}
	public void setIdAssignment(int idAssignment) {
		this.idAssignment = idAssignment;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		if(detail.equals("") || detail == null) {
			this.detail = null;
		}else {
			this.detail = detail;
		}
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) throws Exception {
		if(dueDate == null || dueDate.equals("")) {
			this.dueDate = null;
		}else {
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			Date date = inputFormat.parse(dueDate);
			this.dueDate = date;
		}
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getFullScore() {
		return fullScore;
	}
	public void setFullScore(int fullScore) {
		this.fullScore = fullScore;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
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
