package com.prj.mypharm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freeboard/*")
public class FreeboardController {
	
	@GetMapping("list")
	public String freeboardList() {
		return "base/freeboard/list.tiles";
	}
}
