package org.sangmin.controller;

import java.security.Principal;
import java.util.List;

import org.sangmin.domain.CartDTO;
import org.sangmin.domain.Criteria;
import org.sangmin.domain.ProductAttachDTO;
import org.sangmin.domain.ProductDTO;
import org.sangmin.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@AllArgsConstructor
public class ProductController {
	
	private ProductService service;
	
	
	@GetMapping("/pRegister")
	public void pRegister() {
		
	}
	
	@PostMapping("/pRegister")
	public String pRegister(ProductDTO product, RedirectAttributes rttr) {
		
		log.info("=========================");
		log.info("register" + product);
		
		if(product.getAttachList() != null) {
			product.getAttachList().forEach(attach -> log.info(attach));		
		}
		service.register(product);
		/* rttr.addFlashAttribute("result",product.getPno()); */
		log.info("==========");
		
		return "redirect:/";
		
	}
	
	@GetMapping("/pList")
	public void pList() {
		
	}
	
	
	@GetMapping("/pModify")
	public void pModify() {
		
	}
	
	@PostMapping("/pModify")
	public void pModify(ProductDTO product) {
		
	}
	
	@GetMapping("/pRemove")
	public void pRemove() {
		
	}
	
	@PostMapping("/pRemove")
	public void pRemove(ProductDTO product) {
		
	}

	//장바구니 금액과 상세내용출력
		@GetMapping(value ="/getCartList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<CartDTO>> getCartList(Principal principal){
			String userid = principal.getName();
			return new ResponseEntity<>(service.getCartList(userid),HttpStatus.OK);
		}
	
	
	//게시글의 첨부파일과 상세내용  페이지출력
	@GetMapping(value ="/getProductList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductDTO>> getProductList(Criteria cri, Model model){
		log.info("상품목록 컨트롤러");
		return new ResponseEntity<>(service.getAllList(cri),HttpStatus.OK);
	}
	
	@GetMapping("/product/detail")
	public String get(@RequestParam("pno") Long pno, Model model) {
		
		ProductDTO product = new ProductDTO(); 
		product =service.get(pno);
		model.addAttribute("product", product);
		log.info("product" + product);
		return "product_single";
	}
	
	@GetMapping(value ="/getProductDetail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachDTO>> getProductDetail(Long pno ){
		
		return new ResponseEntity<>(service.getAttachList(pno),HttpStatus.OK);
	}
	
	@PostMapping("/cartAdd")
	@PreAuthorize("isAuthenticated()")
	public String cartAdd(CartDTO cart,Principal principal) {
		log.info("Cart Add진입완료 -----------------------------------");
		String userid = principal.getName();
		cart.setUserid(userid);
		
		if(service.getCart(cart)==null) {
		service.registerCart(cart);
		}else {
			service.modifyCart(cart);
		}
		
		return "/cart";
		
	}
	
	@GetMapping("/cart_delete")
	public void cartDelete() {
		
	}
	
	
	
	@PostMapping("/cart_delete")
	public void cartDelete(CartDTO cart) {
		
		service.deleteCart(cart);
		
	}
	
}
