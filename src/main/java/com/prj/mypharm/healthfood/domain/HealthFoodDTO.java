package com.prj.mypharm.healthfood.domain;

import java.util.Date;

import lombok.Data;

@Data
public class HealthFoodDTO {
	/*
		pno BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		pcode VARCHAR(40) NOT NULL, -- pdt_202301011 pdt_ + 상품등록날짜 + 상품번호
		pname VARCHAR(200) NOT NULL,
		content MEDIUMTEXT,
		img_name VARCHAR(100),
		amount INT DEFAULT 1 NOT NULL,
		price INT DEFAULT 0 NOT NULL,
		regdate DATETIME DEFAULT NOW() NOT NULL
	 */
	private int pno;
	private String pcode;
	private String pname;
	private String subtitle;
	private String content;
	private String img_name;
	private int amount;
	private int price;
	private Date regdate;
}
