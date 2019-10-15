package org.sangmin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CartDTO {
	
	private Long cno;
	
	private String userid;
	
	private Long pno; 
	
	private int amount;
	
	private Date regDate;
	
	private ProductDTO product;
	
	private List<ProductAttachDTO> attachList;
	
}
