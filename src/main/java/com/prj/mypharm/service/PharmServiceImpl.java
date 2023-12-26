package com.prj.mypharm.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.domain.PharmDTO;
import com.prj.mypharm.mapper.PharmMapper;

@Service
public class PharmServiceImpl implements PharmService {
	
	@Autowired
	private PharmMapper pharmMapper;
	
	@Override
	public ArrayList<PharmDTO> getAllPharmList() throws SQLException {
		return this.pharmMapper.selectAllPharm();
	}

	@Override
	public ArrayList<PharmDTO> getDongPharmList(String si, String gu, String dong, int pageNo, int numberPerPage)
			throws SQLException {
		return this.pharmMapper.getDongPharmList(si, gu, dong, pageNo, numberPerPage);
	}

	@Override
	public ArrayList<PharmDTO> getBoundPharmList(double lat, double lng) throws SQLException {
		return this.pharmMapper.getBoundPharmList(lat,lng);
	}

}
