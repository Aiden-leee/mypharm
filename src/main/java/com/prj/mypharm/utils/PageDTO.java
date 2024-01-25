package com.prj.mypharm.utils;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	// < 1 [2] 3 4 5 6 7 >
	private int pageCount;	// pagination 보여질 갯수 
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int total;
	private Criteria criteria;

	public PageDTO(Criteria criteria, int pageCount, int total) {
		this.criteria = criteria;
		this.total = total;
		this.pageCount = pageCount;

		this.endPage = (int) (Math.ceil (criteria.getPageNum() / (double) pageCount ) ) * pageCount;
		this.startPage = this.endPage - (pageCount -1);

		int realEndPage = (int) ( Math.ceil( (double) total / criteria.getAmount() ) );
		if( realEndPage < this.endPage ) this.endPage = realEndPage;

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
}
