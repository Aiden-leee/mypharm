package com.prj.mypharm.service;

import java.sql.SQLException;
import java.util.List;

import com.prj.mypharm.domain.PharmDongVO;

public interface AddrService {
	
	// 시 조회 
	//List<String> getSiList(String si) throws SQLException;
	
	// 구 조회 
	List<String> getGuList(String si) throws SQLException;
	
	// 동 조회 
	List<PharmDongVO> getDongList(String si, String gu) throws SQLException;
	
}
