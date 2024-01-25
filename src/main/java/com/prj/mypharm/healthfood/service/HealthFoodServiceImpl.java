package com.prj.mypharm.healthfood.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.healthfood.domain.HealthFoodDTO;
import com.prj.mypharm.mapper.HealthFoodMapper;

@Service
public class HealthFoodServiceImpl implements HealthFoodService {

	@Autowired
	private HealthFoodMapper healthFoodMapper;
	
	@Override
	public ArrayList<HealthFoodDTO> getHealthFoodList() throws SQLException {
		return healthFoodMapper.selectHealthFoodList();
	}

	@Override
	public HealthFoodDTO getDetailHealthFood(int pno) throws SQLException {
		return healthFoodMapper.selectOneHealthFood(pno);
	}

	@Override
	public int getTotalCount() throws SQLException {
		return healthFoodMapper.selectTotalCount();
	}

}
