package org.sangmin.controller;

import org.sangmin.domain.MemberVO;
import org.sangmin.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserRegController {
	
	private MemberService service; 
	
	@PostMapping("/join")
	public String register(MemberVO member) {
		log.info("register: " + member);
		 service.register(member); 
		return "index";
	}
}
