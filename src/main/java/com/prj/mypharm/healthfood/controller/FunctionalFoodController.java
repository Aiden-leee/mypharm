package com.prj.mypharm.healthfood.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.mypharm.healthfood.domain.HealthFoodDTO;
import com.prj.mypharm.healthfood.service.HealthFoodService;

@Controller
@RequestMapping("/health/*")
public class FunctionalFoodController {
	
	@Autowired
	private HealthFoodService healthFoodService;
	
	
	@GetMapping("/list")
	public String healthFoodList(Model model) {
		
		List<HealthFoodDTO> list = null;
		int total = 0;
		try {
			list = healthFoodService.getHealthFoodList();
			total = healthFoodService.getTotalCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return "base/healthfood/list.tiles";
	}
	
	@GetMapping("/detail/{pno}")
	public String healthFoodDetail(@PathVariable("pno") int pno, Model model) {
		HealthFoodDTO dto = null;
		try {
			dto = healthFoodService.getDetailHealthFood(pno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		
		return "base/healthfood/detail.tiles";
	}
}
