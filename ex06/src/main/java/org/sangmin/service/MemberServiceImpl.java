package org.sangmin.service;

import org.sangmin.domain.MemberVO;
import org.sangmin.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	private MemberMapper mapper;
	
	@Transactional
	@Override
	public void register(MemberVO member) {
		
		log.info("service" + member);
		member.setUserPw(passwordEncoder.encode(member.getUserPw()));
		log.info("service incode" + member);
		mapper.insert(member);
		
		mapper.insertAuth(member.getUserId());
	}

}
