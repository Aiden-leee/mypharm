package com.prj.mypharm.notice.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.prj.mypharm.notice.domain.ReplyDTO;
import com.prj.mypharm.notice.domain.ReplyPageDTO;
import com.prj.mypharm.notice.service.NoticeReplyService;
import com.prj.mypharm.utils.Criteria;
import com.prj.mypharm.utils.PageDTO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/noticeReplies/*")
@Log4j
public class NoticeReplyController {
	
	@Autowired
	private NoticeReplyService noticeReplyService;
	
	// 댓글 목록 조회 
	@GetMapping(value = "/{seq}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> noticeReplySelect(@PathVariable("seq") Long seq, @PathVariable("page") int page) {
		log.info("> noticeReplySelect.. ");
		
		Criteria cri = new Criteria();
		cri.setPageNum(page);
		ReplyPageDTO list = null;
		
		try {
			list = noticeReplyService.noticeReplyList(cri, seq);
			PageDTO pageMaker = new PageDTO(cri,5, list.getReplyCnt());
			list.setPageMaker(pageMaker);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(">.........");
		System.out.println(list);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 댓글 등록
	@PostMapping(value = "/new", produces = {MediaType.TEXT_PLAIN_VALUE} )
	public ResponseEntity<String> noticeReplyNew(@RequestBody ReplyDTO dto) {
		System.out.println(dto);
		int insertCount = 0;
		try {
			insertCount = noticeReplyService.noticeReplyAdd(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	// 댓글 수정 
	@RequestMapping(value = "/{rno}"
			, consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE}
			, method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> noticeReplyModify(@RequestBody ReplyDTO dto, @PathVariable("rno") Long rno) {
		log.info("> noticeReplyModify...");
		
		System.out.println(dto);
		dto.setRno(rno);
		Boolean isUpdated = false;
		try {
			isUpdated = noticeReplyService.noticeReplyModify(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return isUpdated ? new ResponseEntity<>("updated", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 삭제 
	@DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE} )
	public ResponseEntity<String> noticeReplyRemove(@PathVariable("rno") Long rno){
		log.info("> noticeReplyRemove..");
		
		Boolean isDeleted = false;
		
		try {
			isDeleted = noticeReplyService.noticeReplyRemove(rno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isDeleted ? new ResponseEntity<>("deleted", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
