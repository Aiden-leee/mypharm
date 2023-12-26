package com.prj.mypharm.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.xml.sax.SAXException;

import com.prj.mypharm.domain.PharmAddr;
import com.prj.mypharm.domain.PharmDTO;
import com.prj.mypharm.service.PharmService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/api/pharm/*")
@Log4j
public class PharmController {
	
	@Autowired
	private PharmService pharmService;
	
	// 초기 약국 조회 
	@PostMapping(value = "pharmacy")
	public ResponseEntity<List<PharmDTO>> pharm(@RequestBody HashMap<String, Double> latlng ) {
		log.info("> pharm.. ");
		System.out.println(latlng);
		double lat = latlng.get("lat");
		double lng = latlng.get("lng");
		
		ArrayList<PharmDTO> list = null;
		try {
			list = this.pharmService.getBoundPharmList(lat,lng);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println(list);
		
		
		return list != null ? new ResponseEntity<List<PharmDTO>>(list, HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@PostMapping("dongPharm")
	@ResponseBody
	public ResponseEntity<List<PharmDTO>> dongPharm(@RequestBody PharmAddr addr) throws IOException, ParserConfigurationException, SAXException {
		System.out.println(">>>>>>>-------- " + addr.getSi());
		System.out.println(">>>>>>>-------- " + addr.getGu());
		System.out.println(">>>>>>>-------- " + addr.getDong());
		
		ArrayList<PharmDTO> list = null;
		try {
			list = pharmService.getDongPharmList(addr.getSi(), addr.getGu(), addr.getDong(), 1, 10);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<List<PharmDTO>>(list, HttpStatus.OK); 
	}
}
