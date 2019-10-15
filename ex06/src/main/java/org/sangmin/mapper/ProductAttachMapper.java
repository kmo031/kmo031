package org.sangmin.mapper;

import java.util.List;

import org.sangmin.domain.ProductAttachDTO;

public interface ProductAttachMapper {
	
	public void insert(ProductAttachDTO dto);
	
	public void delete(String uuid);
	
	public List<ProductAttachDTO> findByPno(Long pno);

}
