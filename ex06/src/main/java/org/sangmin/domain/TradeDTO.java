package org.sangmin.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TradeDTO {

	/* 거래번호,이름,아이디,주소,전화번호,이메일,은행명,계좌번호, 총합금액,상태, 작성일자*/
	private Long tno;
	private String userName;
	private String userId;
	private String userAddress;
	private String userTelnum;
	private String userEmail;
	private String bank;
	private String account;
	private String accountName;
	private String total;
	private String status;
	private String productList;
	private String trackingNumber;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	
	
	
	
	
}
