package org.sangmin.mapper;

import java.util.List;

import org.sangmin.domain.CartDTO;

public interface CartMapper {

	public void insert(CartDTO cart);
	
	
	public int update(CartDTO cart);
	
	public List<CartDTO> getCartList(String userid);

	public CartDTO get(CartDTO cart);
	
	public void delete(CartDTO cart);
}
