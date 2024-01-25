package com.prj.mypharm.notice.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.mapper.NoticeReplyMapper;
import com.prj.mypharm.notice.domain.ReplyDTO;
import com.prj.mypharm.notice.domain.ReplyPageDTO;
import com.prj.mypharm.utils.Criteria;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {

	@Autowired
	private NoticeReplyMapper noticeReplyMapper; 
	
	@Override
	public ReplyPageDTO noticeReplyList(Criteria cri, Long seq) throws SQLException {
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		int offset = 0;
		offset = (pageNum-1) * amount;
		return new ReplyPageDTO(this.noticeReplyMapper.noticeReplySelect(cri, seq, offset), this.noticeReplyMapper.noticeReplyTotal(seq), null);
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

	@Override
	public Boolean noticeReplyRemove(Long rno) throws SQLException {
		return noticeReplyMapper.noticeReplyDelete(rno) == 1;
	}

}
