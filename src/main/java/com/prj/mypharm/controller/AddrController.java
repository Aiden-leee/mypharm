package com.prj.mypharm.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prj.mypharm.domain.PharmDongVO;
import com.prj.mypharm.service.AddrService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/addr/*")
@Log4j
public class AddrController {

	@Autowired
	private AddrService addrService;

	@GetMapping("/{si}")
	public ResponseEntity<List<String>> getGuList(
			@PathVariable("si") String si) {
		log.info("> getGuList.. ");

		System.out.println(">>>>> si : " + si);

		List<String> list = null;
		try {
			list = addrService.getGuList(si);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);

		return list != null ? new ResponseEntity<List<String>>(list, HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	@GetMapping("/{si}/{gu}")
	public ResponseEntity<List<PharmDongVO>> getDongList(
			@PathVariable("si") String si
			, @PathVariable("gu") String gu) {
		log.info("> getDongList.. ");

		System.out.println(">>>>> si : " + si);
		System.out.println(">>>>> gu : " + gu);

		List<PharmDongVO> list = null;
		try {
			list = addrService.getDongList(si, gu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);

		return list != null ? new ResponseEntity<List<PharmDongVO>>(list, HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	@GetMapping("/{si}/{gu}/{dong}")
	public void getRiList(
			@PathVariable("si") String si
			, @PathVariable("gu") String gu
			, @PathVariable("dong") String dong) {
		log.info("> getRiList.. ");

		System.out.println(">>>>> si : " + si);
		System.out.println(">>>>> gu : " + gu);
		System.out.println(">>>>> dong : " + dong );

	}


}
