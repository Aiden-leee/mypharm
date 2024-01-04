package com.prj.mypharm.security.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	/*
  	MEMBER_NO NOT NULL NUMBER         
	ID        NOT NULL VARCHAR2(20)   
	PWD       NOT NULL VARCHAR2(100)  
	NAME      NOT NULL NVARCHAR2(30)  
	EMAIL     NOT NULL VARCHAR2(255)  
	PHONE     NOT NULL NVARCHAR2(13)  
	ADDR      NOT NULL VARCHAR2(1000) 
	ZIPCODE   NOT NULL VARCHAR2(10)   
	GENDER    NOT NULL CHAR(3)        
	BIRTH     NOT NULL DATE           
	REGDATE   NOT NULL DATE           
	UPDATED            DATE  
	 */
	private long member_no;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String addr;
	private String zipcode;
	private String gender;
	private String birth;
	private Date regdate, updated;
	
	private Boolean enabled;
	private List<AuthVO> authList;
}
