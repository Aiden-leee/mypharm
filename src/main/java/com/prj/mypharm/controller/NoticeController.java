package com.prj.mypharm.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.NoticeDTO;
import com.prj.mypharm.domain.PageDTO;
import com.prj.mypharm.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 목록보기
	@GetMapping("/list")
	public String noticeList(Criteria cri, Model model) {
		log.info("> noticeList...");
		
		List<NoticeDTO> list = null;
		int total = 0;
		PageDTO pageMaker = null;
		try {
			System.out.println(cri);
			list = this.noticeService.noticeSelect(cri);
			total = this.noticeService.noticeTotal();
			pageMaker = new PageDTO(cri,total);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "base/notice/list.tiles";
	}
	
	// 상세보기 
	@GetMapping("/detail/{seq}")
	public String noticeRead(@PathVariable("seq") int seq, Model model) {
		log.info("> noticeRead.." );
		
		NoticeDTO dto = null;
		
		try {
			dto = noticeService.noticeRead(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		
		return "base/notice/detail.tiles";
	}
	
}
