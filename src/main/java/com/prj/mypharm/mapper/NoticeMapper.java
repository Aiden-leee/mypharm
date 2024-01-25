package com.prj.mypharm.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.prj.mypharm.notice.domain.NoticeDTO;
import com.prj.mypharm.utils.Criteria;

public interface NoticeMapper {
	// 공지사항 목록
	List<NoticeDTO> noticeSelect(@Param("cri") Criteria cri, @Param("offset") int offset) throws SQLException;
	
	// 공지사항 총 게시글 
	int noticeTotalRows() throws SQLException;
	
	// 게시글 쓰기
	int noticeInsert(NoticeDTO dto) throws SQLException;
	
	// 게시글 상세보기 
	NoticeDTO noticeSelectOne(@Param("seq") long seq) throws SQLException;
	
	// 게시글 수정 
	int noticeUpdate(NoticeDTO dto) throws SQLException;
	
	// 게시글 삭제 
	int noticeDelete(@Param("seq") long seq, @Param("userid") String userid) throws SQLException;
}
