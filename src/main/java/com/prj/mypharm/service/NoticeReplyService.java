package com.prj.mypharm.service;

import java.sql.SQLException;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.ReplyDTO;
import com.prj.mypharm.domain.ReplyPageDTO;

public interface NoticeReplyService {
	// 댓글 목록 
	ReplyPageDTO noticeReplyList(Criteria cri, Long seq) throws SQLException;
	
	// 댓글 갯수 
	int noticeReplyTotalCount(long seq) throws SQLException;
	
	// 댓글 생성
	int noticeReplyAdd(ReplyDTO dto) throws SQLException;
	
	// 댓글 수정 
	Boolean noticeReplyModify(ReplyDTO dto) throws SQLException;
	
	// 댓글 삭제 
	Boolean noticeReplyRemove(Long rno) throws SQLException;
}
