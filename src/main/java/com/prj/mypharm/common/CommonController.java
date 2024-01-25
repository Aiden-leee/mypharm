package com.prj.mypharm.common;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@Log4j
public class CommonController {
	
	@GetMapping("/accessError")
	public String commonAccessError(Model model, Authentication auth) {
		log.info("> commonAccessError.. " + auth );
		model.addAttribute("msg", "Access Denied");
		return "common/accessError";
	}
}
