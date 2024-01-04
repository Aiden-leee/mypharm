package com.prj.mypharm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/error/")
@Log4j
public class ErrorController {
	
	@GetMapping("{status}")
	public String errorPage(@PathVariable("status") String status) {
		log.info("> error..." + status);
		return "error/" + status;
	}
}
