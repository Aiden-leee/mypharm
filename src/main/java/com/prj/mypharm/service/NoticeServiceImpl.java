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
		return this.noticeMapper.noticeSelect(cri);
	}

	@Override
	public int noticeTotal() throws SQLException {
		return this.noticeMapper.noticeTotalRows();
	}

	@Override
	public NoticeDTO noticeRead(int seq) throws SQLException {
		return this.noticeMapper.noticeSelectOne(seq);
	}

	@Override
	public NoticeDTO noticeModify(int seq, String userid) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}
