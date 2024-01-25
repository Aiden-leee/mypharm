package com.prj.mypharm.notice.service;

import java.sql.SQLException;
import java.util.List;

import com.prj.mypharm.notice.domain.NoticeDTO;
import com.prj.mypharm.utils.Criteria;

public interface NoticeService {
	// 공지사항 목록
	List<NoticeDTO> noticeSelect(Criteria cri) throws SQLException;
	
	// 공지사항 총 게시글 
	int noticeTotal() throws SQLException;
	
	// 게시글 쓰기
	Boolean noticeWrite(NoticeDTO dto) throws SQLException;
	
	// 게시글 상세보기 
	NoticeDTO noticeRead(long seq) throws SQLException;
	
	// 게시글 수정하기 
	Boolean noticeModify(NoticeDTO dto) throws SQLException;
	
	// 게시글 삭제하기 
	Boolean noticeRemove(long seq, String userid) throws SQLException;
}
