package org.sangmin.mapper;

import org.sangmin.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userId);
	
	public void insert(MemberVO member);
	
	public void insertAuth(String userId);
	
	public int idCheck(String user_id);
	
	
	
}
