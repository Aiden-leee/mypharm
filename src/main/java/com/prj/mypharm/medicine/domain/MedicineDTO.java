package com.prj.mypharm.medicine.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MedicineDTO {
	/*
	NAME      NOT NULL VARCHAR2(100) 
	ENAME              VARCHAR2(100) 
	CATE_NO   NOT NULL NUMBER        
	CATE_NAME          VARCHAR2(100) 
	OTC_NAME           VARCHAR2(50)  
	FORMUL             VARCHAR2(50)  
	COMPANY            VARCHAR2(50)  
	IMG                VARCHAR2(100) 
	CHART              VARCHAR2(100) 
	SHAPE              VARCHAR2(10)  
	COLOR1             VARCHAR2(10)  
	COLOR2             VARCHAR2(10) 
	 */
	private long no;
	private String name;
	private String ename;
	private int cate_no;
	private String cate_name;
	private String otc_name;
	private String formul;
	private String company;
	private String img;
	private String chart;
	private String shape;
	private String color1;
	private String color2;
	
	@Override
	public String toString() {
		return "[no=" + no + ", name=" + name + ", ename=" + ename + ", cate_no=" + cate_no + ", cate_name="
				+ cate_name + ", otc_name=" + otc_name + ", formul=" + formul + ", company=" + company + ", img=" + img
				+ ", chart=" + chart + ", shape=" + shape + ", color1=" + color1 + ", color2=" + color2 + "]\n";
	}
}
