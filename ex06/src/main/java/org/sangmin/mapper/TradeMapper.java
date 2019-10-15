package org.sangmin.mapper;

import java.util.List;

import org.sangmin.domain.TradeDTO;

public interface TradeMapper {
	
	public void insertTrade(TradeDTO trade);//거래목록 등록
	
	public void deleteTrade(TradeDTO trade);
	
	public void modifyTrade(TradeDTO trade);
	
	public List<TradeDTO> readTrade(String userId); //거래목록 사용자읽기
	
	public List<TradeDTO> readAllTrade(); //거래목록 전체읽기
	
	public int modifyTradeTracking(TradeDTO trade);
	
	public int modifyTradeStatus(TradeDTO trade);
	
	
	

}
