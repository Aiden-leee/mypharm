package com.prj.mypharm.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.ReplyDTO;
import com.prj.mypharm.domain.ReplyPageDTO;
import com.prj.mypharm.mapper.NoticeReplyMapper;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {

	@Autowired
	private NoticeReplyMapper noticeReplyMapper; 
	
	@Override
	public ReplyPageDTO noticeReplyList(Criteria cri, Long seq) throws SQLException {
		return new ReplyPageDTO(this.noticeReplyMapper.noticeReplySelect(cri, seq), this.noticeReplyMapper.noticeReplyTotal(seq), null);
	}

	@Override
	public int noticeReplyTotalCount(long seq) throws SQLException {
		return noticeReplyMapper.noticeReplyTotal(seq);
	}

	@Override
	public int noticeReplyAdd(ReplyDTO dto) throws SQLException {
		return noticeReplyMapper.noticeReplyInsert(dto);
	}

	@Override
	public Boolean noticeReplyModify(ReplyDTO dto) throws SQLException {
		return noticeReplyMapper.noticeReplyUpdate(dto) == 1;
	}

}
