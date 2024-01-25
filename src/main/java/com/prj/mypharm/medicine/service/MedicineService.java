package com.prj.mypharm.medicine.service;

import java.sql.SQLException;
import java.util.List;

import com.prj.mypharm.medicine.domain.MedicineDTO;
import com.prj.mypharm.utils.Criteria;

public interface MedicineService {
	// 약품 조회 및 검색 
	List<MedicineDTO> getMedicineList(Criteria cri) throws SQLException;
	
	// 약품 상세 보기 
	MedicineDTO detailMedicine(int no) throws SQLException;
	
	// 약품 갯수 
	int getTotalMedicine(Criteria cri) throws SQLException;
}
