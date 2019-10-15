package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.TradeDTO;
import org.sangmin.mapper.TradeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class TradeServiceImpl implements TradeService {
	
	@Setter(onMethod_ = @Autowired)
	private TradeMapper mapper;
		
	
	@Override
	public void insertTrade(TradeDTO trade) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
		trade.setUserId(user_id);
		mapper.insertTrade(trade);
		
	}


	@Override
	public List<TradeDTO> readTrade() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
	
		return mapper.readTrade(user_id);
	}


	@Override
	public List<TradeDTO> readAllTrade() {
		// TODO Auto-generated method stub


		return mapper.readAllTrade();
	}


	@Override
	public int modifyTradeTracking(TradeDTO trade) {
		
		log.info("운송장번호,상태 변경 서비스");
		mapper.modifyTradeStatus(trade);
		mapper.modifyTradeTracking(trade);
		return 0; //나중에 and문으로 변경
		
	}

	//배송상태변경
	@Override
	public int modifyTradeStatus(TradeDTO trade) {

		log.info("배송상태변경");
		
		return mapper.modifyTradeStatus(trade);
	}

}
