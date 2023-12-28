package com.prj.mypharm.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.NoticeDTO;

public interface NoticeMapper {
	// 공지사항 목록
	List<NoticeDTO> noticeSelect(Criteria cri) throws SQLException;
	
	// 공지사항 총 게시글 
	int noticeTotalRows() throws SQLException;
	
	// 게시글 상세보기 
	NoticeDTO noticeSelectOne(@Param("seq") int seq) throws SQLException;
	
	// 게시글 수정 
	NoticeDTO noticeUpdate(@Param("seq") int seq, @Param("userid") String userid) throws SQLException;
}
