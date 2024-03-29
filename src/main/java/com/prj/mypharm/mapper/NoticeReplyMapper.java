package com.prj.mypharm.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.prj.mypharm.notice.domain.ReplyDTO;
import com.prj.mypharm.utils.Criteria;

public interface NoticeReplyMapper {
	// 댓글 목록
	List<ReplyDTO> noticeReplySelect(@Param("cri") Criteria cri, @Param("seq") long seq, @Param("offset") int offset) throws SQLException;
	
	// 댓글 갯수 
	int noticeReplyTotal(Long seq) throws SQLException;
	
	// 댓글 생성 
	int noticeReplyInsert(ReplyDTO dto) throws SQLException;
	
	// 댓글 수정
	int noticeReplyUpdate(ReplyDTO dto) throws SQLException;
	
	// 댓글 삭제 
	int noticeReplyDelete(Long rno) throws SQLException;
}
