package com.prj.mypharm.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private List<ReplyDTO> list;
	private int replyCnt;
	private PageDTO pageMaker;
}
