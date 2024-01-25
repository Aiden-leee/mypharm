package com.prj.mypharm.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@GetMapping("/details")
	public String orderDetails() {
		
		return "base/order/details.tiles";
	}
}
