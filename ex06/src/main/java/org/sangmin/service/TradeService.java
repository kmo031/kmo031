package org.sangmin.service;

import java.util.List;

import org.sangmin.domain.TradeDTO;

public interface TradeService {

	public void insertTrade(TradeDTO trade);
	
	public List<TradeDTO> readTrade();
	
	public List<TradeDTO> readAllTrade();
	
	public int modifyTradeTracking(TradeDTO trade);
	
	public int modifyTradeStatus(TradeDTO trade);
}
