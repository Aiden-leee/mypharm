package com.prj.mypharm.mapper;

import java.sql.SQLException;
import java.util.ArrayList;

import com.prj.mypharm.healthfood.domain.HealthFoodDTO;

public interface HealthFoodMapper {
	// 건강기능식품 조회 
	ArrayList<HealthFoodDTO> selectHealthFoodList() throws SQLException;
	
	// 상세보기
	HealthFoodDTO selectOneHealthFood(int pno) throws SQLException;
	
	// 목록 총 갯수
	int selectTotalCount() throws SQLException;
}
