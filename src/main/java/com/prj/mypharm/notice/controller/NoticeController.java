package com.prj.mypharm.notice.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prj.mypharm.notice.domain.NoticeDTO;
import com.prj.mypharm.notice.service.NoticeService;
import com.prj.mypharm.utils.Criteria;
import com.prj.mypharm.utils.PageDTO;

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
		//cri.setAmount(3);
		List<NoticeDTO> list = null;
		int total = 0;
		PageDTO pageMaker = null;
		try {
			System.out.println(cri);
			list = this.noticeService.noticeSelect(cri);
			total = this.noticeService.noticeTotal();
			pageMaker = new PageDTO(cri,5,total);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "base/notice/list.tiles";
	}
	
	// 글쓰기
	@GetMapping("/notice/write")
	public String noticeWrite() {
		log.info("> noticeWrite..");
		return "base/notice/write.tiles";
	}
	@PostMapping("/notice/write")
	public String noticeWritePost(NoticeDTO dto, RedirectAttributes rttr) {
		log.info("> noticeWritePost..");
		
		try {
			if( noticeService.noticeWrite(dto) ) {
				rttr.addFlashAttribute("writed", true);
				return "redirect:/notice/list";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			rttr.addFlashAttribute("writed", false);
			
		return "redirect:/notice/write";
	}
	
	// 상세보기 
	@GetMapping("/detail/{seq}")
	public String noticeRead(@PathVariable("seq") long seq, Model model) {
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
	
	// 수정 
	@GetMapping("modify/{seq}")
	public String noticeModify(@PathVariable("seq") long seq, Model model) {
		log.info("> noticeModify...");
		NoticeDTO dto = null;
		try {
			dto = noticeService.noticeRead(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto",dto);
		
		return "base/notice/modify.tiles";
	}
	@PostMapping("modify")
	public String noticeModifyPost(NoticeDTO dto, Principal principal, RedirectAttributes rttr) {
		log.info("> noticeModifyPost...");
		
		long seq = dto.getSeq();
		try {
			if(	noticeService.noticeModify(dto) ) {
				rttr.addFlashAttribute("updated", true);
				return "redirect:/notice/detail/" + seq;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		rttr.addFlashAttribute("updated",false);
		
		return "redirect:/notice/modify/" + seq;
	}
	
	@PostMapping("/delete")
	public String noticeRemove(@RequestParam("seq") long seq, Principal principal, RedirectAttributes rttr) {
		log.info("> noticeRemove...");
		System.out.println(">>>> -----" +principal);
		try {
			if( noticeService.noticeRemove(seq, principal.getName()) ) {
				rttr.addFlashAttribute("deleted", true);
				return "redirect:/notice/list";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("deleted", false);
		
		return "redirect:/notice/detail/" + seq;
	}
}
