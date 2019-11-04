package org.sangmin.controller;

import org.sangmin.domain.MemberVO;
import org.sangmin.service.MemberService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserRegController {
	
	private BCryptPasswordEncoder passwordEncoder;

	private MemberService service; 
	
	@PostMapping("/join")
	public String register(MemberVO member) {
		member.setUserPw(passwordEncoder.encode(member.getUserPw()));
		log.info("register: " + member);
		 service.register(member); 
		return "/index";
	}
	
	
	@GetMapping("/user/idCheck")
	@ResponseBody
	public int userIdChack(@RequestParam("userId") String user_id) {
		
		return service.idCheck(user_id);
		
	}
	
	@PostMapping("/member_status_modify")
	public String modify(MemberVO member) {
		service.modify(member);
		return "/index";
	}
}
