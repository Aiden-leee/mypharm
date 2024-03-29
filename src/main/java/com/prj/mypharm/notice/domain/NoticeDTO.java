package com.prj.mypharm.notice.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	/*
	SEQ     NOT NULL NUMBER        
	TITLE   NOT NULL VARCHAR2(200) 
	CONTENT          CLOB          
	WRITER  NOT NULL VARCHAR2(50)  
	REGDATE NOT NULL DATE          
	UPDATED 
	 */
	private long seq;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updated;
}
