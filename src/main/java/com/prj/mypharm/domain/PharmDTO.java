package com.prj.mypharm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PharmDTO {
	private int rnum; // 일련번호 
	private String dutyAddr;
	private String dutyName;
	private String dutyEtc; // 개국일 등..
	private String dutyTel1;// 02-742-1145 대표전화 
	private int dutyTime1s; //>0830 진료 시작 
	private int dutyTime1c;	// 1930	진료시간(월요일)C
	private int dutyTime2s; //>0830
	private int dutyTime2c; //>1930 진료시간(화요일)C
	private int dutyTime3s; //>0830
	private int dutyTime3c; //>1930	진료시간(수요일)C
	private int dutyTime4s; //>0830
	private int dutyTime4c; //>1930 진료시간(목요일)C
	private int dutyTime5s; //>0830
	private int dutyTime5c; //>1930 진료시간(금요일)C
	private int dutyTime6s; //>0830
	private int dutyTime6c; //>1800 진료시간(토요일)C
	private int dutyTime7s; //>0830
	private int dutyTime7c; //>0830 진료시간(일요일)C
	private int dutyTime8s; //>0830
	private int dutyTime8c; //>0830 진료시간(공휴일)C
	private String hpid;	// A0030236	기관ID
	private String postCdn1; 	// 110 우편번호1
	private String postCdn2; 	// 480 우편번호2
	
	private double wgs84Lat;	// 37.573708333333336
	private double wgs84Lon;	// 127.003722222222223
	private double distance;
	
}
