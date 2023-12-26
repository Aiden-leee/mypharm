package com.prj.mypharm.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.domain.PharmDongVO;
import com.prj.mypharm.mapper.AddrMapper;

@Service
public class AddrServiceImpl implements AddrService{

	@Autowired
	private AddrMapper addrMapper;

	@Override
	public List<String> getGuList(String si) throws SQLException {
		return this.addrMapper.getGuList(si);
	}

	@Override
	public List<PharmDongVO> getDongList(String si, String gu) throws SQLException {
		return this.addrMapper.getDongList(si, gu);
	} 
	

}
