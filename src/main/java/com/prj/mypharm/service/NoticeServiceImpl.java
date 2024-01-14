package com.prj.mypharm.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.NoticeDTO;
import com.prj.mypharm.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public List<NoticeDTO> noticeSelect(Criteria cri) throws SQLException {
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		int offset = 0;
		offset = (pageNum-1) * amount;
		return this.noticeMapper.noticeSelect(cri,offset);
	}

	@Override
	public int noticeTotal() throws SQLException {
		return this.noticeMapper.noticeTotalRows();
	}

	@Override
	public NoticeDTO noticeRead(long seq) throws SQLException {
		return this.noticeMapper.noticeSelectOne(seq);
	}

	@Override
	public Boolean noticeModify(NoticeDTO dto) throws SQLException {
		return this.noticeMapper.noticeUpdate(dto) == 1;
	}

	@Override
	public Boolean noticeWrite(NoticeDTO dto) throws SQLException {
		return this.noticeMapper.noticeInsert(dto) == 1;
	}

	@Override
	public Boolean noticeRemove(long seq, String userid) throws SQLException {
		return this.noticeMapper.noticeDelete(seq, userid) == 1;
	}


}
