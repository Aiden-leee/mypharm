package com.prj.mypharm.medicine.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mypharm.mapper.MedicineMapper;
import com.prj.mypharm.medicine.domain.MedicineDTO;
import com.prj.mypharm.utils.Criteria;

@Service
public class MedicineServiceImpl implements MedicineService {

	@Autowired
	private MedicineMapper medicineMapper;
	
	@Override
	public List<MedicineDTO> getMedicineList(Criteria cri) throws SQLException {
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		int offset = 0;
		offset = (pageNum-1) * amount;
		return medicineMapper.selectMedicineList(cri, offset);
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
