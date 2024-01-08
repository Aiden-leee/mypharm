package com.prj.mypharm.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.MedicineDTO;

public interface MedicineMapper {
	// 약품 조회, 검색
	List<MedicineDTO> selectMedicineList(@Param("cri") Criteria cri) throws SQLException;
	
	// 약품 상세 보기 
	MedicineDTO selectMedicineOne(int no) throws SQLException;
	
	// 약품 총 갯수 
	int totalMedicine(@Param("cri") Criteria cri) throws SQLException;
}
