package com.prj.mypharm.pharmacy.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.prj.mypharm.pharmacy.domain.PharmDTO;

public interface PharmService {
	// 약국 전체 조회 
	ArrayList<PharmDTO> getAllPharmList() throws SQLException;
	
	// 영역 약국 조회 
	ArrayList<PharmDTO> getBoundPharmList(double lat, double lng) throws SQLException;
	
	// 동네 약국 
	ArrayList<PharmDTO> getDongPharmList(String si, String gu, String dong, int pageNo, int numberPerPage) throws SQLException;
}
