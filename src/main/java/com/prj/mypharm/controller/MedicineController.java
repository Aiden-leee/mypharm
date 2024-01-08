package com.prj.mypharm.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.MedicineDTO;
import com.prj.mypharm.domain.PageDTO;
import com.prj.mypharm.service.MedicineService;

@Controller
@RequestMapping("/medicine/*")
public class MedicineController {
	
	@Autowired
	private MedicineService medicineService;
	
	@GetMapping("/list")
	public String getMedicine(Model model, Criteria cri) {
		
		cri.setAmount(50);
		List<MedicineDTO> list = null;
		PageDTO pageMaker = null;
		int total = 0;
		try {
			list = medicineService.getMedicineList(cri);
			total = medicineService.getTotalMedicine(cri); 
			pageMaker = new PageDTO(cri, 10, total);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "base/medicine/list.tiles";
	}
	
	@GetMapping("{no}")
	public String detailMedicine(@PathVariable("no") int no, Model model) {
		
		MedicineDTO dto = null;
		try {
			dto = medicineService.detailMedicine(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto",dto);
		
		return "base/medicine/detail.tiles";
	}
}
