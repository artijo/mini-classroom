package com.project.classroom.classroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class index {
	@GetMapping("/")
	public String index() {
		return "index";
	}

}
