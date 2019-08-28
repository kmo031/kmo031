package org.sangmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MenuController {
	
	@GetMapping("/about")
	public String about() {
		log.info("진입");
		return "about";
	}
	@GetMapping("/blog_single")
	public String blog_single() {
		log.info("진입");
		return "blog_single";
	}
	@GetMapping("/blog")
	public String blog() {
		log.info("진입");
		return "/blog";
	}
	@GetMapping("/cart")
	public String cart() {
		log.info("진입");
		return "cart";
	}
	@GetMapping("/checkout")
	public String checkout() {
		log.info("진입");
		return "checkout";
	}
	@GetMapping("/contact")
	public void contact(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		log.info("로그인");
		
		if (error != null) {
			model.addAttribute("error", "로그인 에러 아이디나 비밀번호를 확인하세요");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	@GetMapping("/product_single")
	public String product_single() {
		log.info("진입");
		return "product_single";
	}
	@GetMapping("/shop")
	public String shop() {
		log.info("진입");
		return "shop";
	}
	@GetMapping("/wishlist")
	public String wishlist() {
		log.info("진입");
		return "wishlist";
	}
	@GetMapping("/join")
	public String join() {
		log.info("진입");
		return "join";
	}
	
	
	
}
