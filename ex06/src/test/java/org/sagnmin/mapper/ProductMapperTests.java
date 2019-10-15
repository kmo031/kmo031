package org.sagnmin.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sangmin.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class ProductMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	//Read테스트
	/*
	 * @Test public void testRead() { ProductDTO product = mapper.read(2L);
	 * log.info("log" + product);
	 * 
	 * }
	 */
	/*
	 * @Test public void testInsert() { ProductDTO product = new ProductDTO();
	 * 
	 * product.setPcontent("테스트"); product.setPprice(3000L);
	 * product.setPwriter("테스트"); product.setPtitle("테스트");
	 * 
	 * mapper.insert(product); log.info(product);
	 * 
	 * log.info("log" + product);
	 * 
	 * }
	 */
	/*
	 * @Test public void testGetList() {
	 * 
	 * mapper.getList().forEach(product -> log.info(product)); }
	 * 
	 */
	
	@Test
	public void testGetList() {
		mapper.getProductList().forEach(product -> log.info(product));
	}
}
