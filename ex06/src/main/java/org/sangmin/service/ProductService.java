package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.CartDTO;
import org.sangmin.domain.Criteria;
import org.sangmin.domain.ProductAttachDTO;
import org.sangmin.domain.ProductDTO;

public interface ProductService {

	public void register(ProductDTO product);
	
	public int modify(ProductDTO product);

	public int remove(long pno);
	
	public ProductDTO  get(Long pno);
	
	public List<ProductDTO> getList();
	
	public List<ProductAttachDTO> getAttachList(Long pno);
	
	//상품정보와 들어있는사진의 db정보를 가져오는 메서드 
	public List<ProductDTO> getAllList(Criteria cri);
	
	//장바구니에 등록되어있는지 확인
	public CartDTO getCart(CartDTO cart);
	
	//장바구니에 추가하는 서비스
	public void registerCart(CartDTO cart);
	
	public List<CartDTO> getCartList(String userid);
	
	//장바구니 정보 수정
	public boolean modifyCart(CartDTO cart);
	
	public int getTotal(Criteria cri);
	
	public void deleteCart(CartDTO cart); 

}
