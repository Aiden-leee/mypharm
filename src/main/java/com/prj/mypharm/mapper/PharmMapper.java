package com.prj.mypharm.mapper;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.prj.mypharm.pharmacy.domain.PharmDTO;

public interface PharmMapper {
	// 약국 전체 조회 
	ArrayList<PharmDTO> selectAllPharm() throws SQLException;
	
	// 영역 약국 조회 
	ArrayList<PharmDTO> getBoundPharmList(@Param("lat") double lat, @Param("lng") double lng) throws SQLException;
	
	// 동네 약국 
	ArrayList<PharmDTO> getDongPharmList(String si, String gu, String dong, int pageNo, int numberPerPage) throws SQLException;
}
