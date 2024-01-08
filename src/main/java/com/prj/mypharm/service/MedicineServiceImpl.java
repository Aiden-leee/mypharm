package com.prj.mypharm.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.domain.Criteria;
import com.prj.mypharm.domain.MedicineDTO;
import com.prj.mypharm.mapper.MedicineMapper;

@Service
public class MedicineServiceImpl implements MedicineService {

	@Autowired
	private MedicineMapper medicineMapper;
	
	@Override
	public List<MedicineDTO> getMedicineList(Criteria cri) throws SQLException {
		return medicineMapper.selectMedicineList(cri);
	}

	@Override
	public MedicineDTO detailMedicine(int no) throws SQLException {
		return medicineMapper.selectMedicineOne(no);
	}

	@Override
	public int getTotalMedicine(Criteria cri) throws SQLException {
		return medicineMapper.totalMedicine(cri);
	}

}
