package org.sangmin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductDTO {

	private Long pno;
	private String ptitle;
	private String pcontent;
	private String pwriter;
	private Long pprice;

	private Date regdate;
	private Date updatedate;
	
	private List<ProductAttachDTO> attachList;
}
