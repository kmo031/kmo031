package org.sangmin.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class Criteria {

	private int pageNum; //페이지 갯수
	private int amount; //한페이지에 표시될 데이터갯수
	
	public Criteria() {
		this(1,12);
	}
	
	public Criteria(int pageNum, int amount) {
		log.info("진입했다3");
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
