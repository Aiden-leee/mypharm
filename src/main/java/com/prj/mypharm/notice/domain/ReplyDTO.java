package com.prj.mypharm.notice.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	/*
	 RNO     NOT NULL NUMBER         
	SEQ     NOT NULL NUMBER    
	REPLYER          VARCHAR2(50)   
	CONTENT          VARCHAR2(1200) 
	REGDATE NOT NULL DATE        
	UPDATED NOT NULL DATE   
	 */
	private Long rno;
	private Long seq;
	private String replyer;
	private String content;
	private Date regdate, updated;
}
