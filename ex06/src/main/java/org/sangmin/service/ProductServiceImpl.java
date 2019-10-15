package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.CartDTO;
import org.sangmin.domain.Criteria;
import org.sangmin.domain.ProductAttachDTO;
import org.sangmin.domain.ProductDTO;
import org.sangmin.mapper.CartMapper;
import org.sangmin.mapper.ProductAttachMapper;
import org.sangmin.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private ProductAttachMapper attachMapper;
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	
	@Transactional
	@Override
	public void register(ProductDTO product) {
		log.info("register.........." + product);
		
		mapper.insertSelectKey(product);
		
		//파일이 없으면 리턴
		if(product.getAttachList() == null || product.getAttachList().size()<=0) {
			return;
		}
		
		//파일을 하나씩 불러와 insert
		product.getAttachList().forEach(attach ->{
			attach.setPno(product.getPno());
			attachMapper.insert(attach); 
		});
		return;
	}

	@Override
	public int modify(ProductDTO product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(long pno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProductDTO get(Long pno) {
		
		return mapper.get(pno);
	}

	@Override
	public List<ProductDTO> getList() {
		log.info("상품 리스트 서비스");
		
		return mapper.getList();
	}
	
	@Override
	public List<ProductAttachDTO> getAttachList(Long pno){
		log.info("파일가져오기 번호로" + pno);
		
		return attachMapper.findByPno(pno);
	}

	//페이지, 사진, 게시물정보 가져오기
	@Override
	public List<ProductDTO> getAllList(Criteria cri) {
		log.info("게시물정보 파일 경로 다가져오기");
		
		return mapper.getListWithPaging(cri);
	}
	//장바구니추가 서비스 구현
	@Override
	public void registerCart(CartDTO cart) {
		log.info("장바구니 목록에 추가");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
		
		cart.setUserid(user_id);
		cartMapper.insert(cart);
	}
	//장바구니 목록 조회
	@Override
	public List<CartDTO> getCartList(String userid) {
		
		log.info("장바구니목록 조회");
		
		return cartMapper.getCartList(userid);
	}

	@Override
	public CartDTO getCart(CartDTO cart) {
		
	
		log.info("장바구니에 이미 있는지확인");
		return cartMapper.get(cart);
	}

	@Override
	public boolean modifyCart(CartDTO cart) {
		log.info("장바구니 수정 진입");
		return cartMapper.update(cart) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public void deleteCart(CartDTO cart) {

		cartMapper.delete(cart);
	}

}
