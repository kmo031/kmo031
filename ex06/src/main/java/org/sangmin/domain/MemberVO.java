package org.sangmin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data

public class MemberVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userTelnum;
	private String userBirthday;
	/* private String userzipcode; */
	private String userAddress;

	boolean userGender;
	private boolean enabled;
	
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;
	
}
