package org.sangmin.service;

import org.sangmin.domain.MemberVO;

public interface MemberService {
	
	public MemberVO get(String userId);
	
	public void register(MemberVO member);
	
	public int idCheck(String user_id);

}
