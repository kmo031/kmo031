package org.sangmin.controller;

import java.security.Principal;

import org.sangmin.domain.Criteria;
import org.sangmin.domain.PageDTO;
import org.sangmin.service.MemberService;
import org.sangmin.service.ProductService;
import org.sangmin.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Log4j
@Controller
public class MenuController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@Setter(onMethod_ = @Autowired)
	private TradeService tradeService;
	
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
	@PreAuthorize("isAuthenticated()")
	public String cart() {
		log.info("cart진입");
		return "cart";
	}
	@GetMapping("/checkout")
	@PreAuthorize("isAuthenticated()")
	public String checkout(Principal principal,Model model) {
		String userid = principal.getName();
		model.addAttribute("member", memberService.get(userid));
		log.info("진입");
		return "checkout";
	}
	@GetMapping("/login")
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
	
	@GetMapping("/shop")
	public String shop(Criteria cri, Model model) {
		log.info("shop진입");
		
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "shop";
	}
	//유저정보보기
	@GetMapping("/mamberstatus")
	@PreAuthorize("isAuthenticated()")
	public String mamberStatus(Principal principal,Model model) {
		String userid = principal.getName();
		model.addAttribute("member", memberService.get(userid));
		log.info("shop진입");
		return "/memberstatus";
	}
	@GetMapping("/join")
	public String join() {
		log.info("진입");
		return "join";
	}
	
	@GetMapping("/trademanager")
	public String trademanager() {
		log.info("관리자 진입");
		return "/trade_manager";
	}
	
	@GetMapping("/tradelist")
	@PreAuthorize("isAuthenticated()")
	public String tradList(Model model) {
		
		model.addAttribute("trade", tradeService.readTrade());
		log.info("거래목록진입");
		return "/tradelist";
	}
	
	
	
}
