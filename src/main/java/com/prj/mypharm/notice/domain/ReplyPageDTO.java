package com.prj.mypharm.notice.domain;

import java.util.List;

import com.prj.mypharm.utils.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private List<ReplyDTO> list;
	private int replyCnt;
	private PageDTO pageMaker;
}
