package org.sangmin.service;

import org.sangmin.domain.MemberVO;
import org.sangmin.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class MemberServiceImpl implements MemberService {



	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Transactional
	@Override
	public void register(MemberVO member) {
		
		
		mapper.insert(member);
		mapper.insertAuth(member.getUserId());
	}

	@Override
	public MemberVO get(String userId) {
		
		return mapper.read(userId);
	}
	
	//id중복검사
	@Override
	public int idCheck(String user_id) {
		log.info("아이디 중복검사 service");
		return mapper.idCheck(user_id);
	}

}
