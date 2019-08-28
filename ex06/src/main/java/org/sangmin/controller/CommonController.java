package org.sangmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

		
	
	
	@PostMapping("/Logout")
	public void logoutPost() {
		log.info("post custom logout");
		
	}
}
