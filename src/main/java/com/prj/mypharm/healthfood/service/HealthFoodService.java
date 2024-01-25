package com.prj.mypharm.healthfood.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.prj.mypharm.healthfood.domain.HealthFoodDTO;

public interface HealthFoodService {
	// 건강기능식품 조회 
	ArrayList<HealthFoodDTO> getHealthFoodList() throws SQLException;
	
	// 상세보기 
	HealthFoodDTO getDetailHealthFood(int pno) throws SQLException;
	
	// 상품 총 갯수 
	int getTotalCount() throws SQLException;
}
