package org.sangmin.mapper;

import java.util.List;

import org.sangmin.domain.Criteria;
import org.sangmin.domain.ProductDTO;

public interface ProductMapper {
	
	public void insert(ProductDTO product);
	
	public void insertSelectKey(ProductDTO product);
	
	public ProductDTO read(Long pno);
	
	public void update(ProductDTO product);
	
	public void delete(Long pno);

	public List<ProductDTO> getList();
	
	public  List<ProductDTO> getProductList();
	
	public ProductDTO get(Long pno);
	
	public List<ProductDTO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	
	
	//장바구니추가
	
	
	
}
