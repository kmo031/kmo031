package org.sangmin.domain;

import lombok.Data;
@Data
public class ProductAttachDTO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private boolean mainPicture;
	
	private Long pno;
}
