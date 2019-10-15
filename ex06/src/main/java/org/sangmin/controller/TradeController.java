package org.sangmin.controller;

import java.util.List;

import org.sangmin.domain.TradeDTO;
import org.sangmin.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller


public class TradeController {

	@Setter(onMethod_ = @Autowired)
	private TradeService service;
	
	//구매입력
	@PostMapping("/tradeadd")
	public String tradeAdd(TradeDTO trade) {
		log.info("구매결정진입");
		service.insertTrade(trade);
		
		return "/tradelist";
		
	}
		//거래목록 내용 출력 JSON
		@GetMapping(value ="/getTradeList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<TradeDTO>> getTradeList(){
			return new ResponseEntity<>(service.readTrade(),HttpStatus.OK);
		}
		
		//관리자용 거래목록 내용전체 출력 JSON
		@GetMapping(value ="/getTradeAllList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<TradeDTO>> getTradeAllList(){
			return new ResponseEntity<>(service.readAllTrade(),HttpStatus.OK);
		}
		
		
	
	
	  //운송장번호 저장
	  
	/*
	 * @PostMapping(value="/trade_change",consumes ="application/json",
	 * produces={MediaType.TEXT_PLAIN_VALUE}) public
	 * ResponseEntity<String>create(@RequestBody TradeDTO trade){
	 * 
	 * int insertCount =0; }
	 */
		@PostMapping("/trade_change")
		@ResponseBody
		public String statusChange(TradeDTO trade) {
			log.info("체인지"+ trade);
			if(trade.getTrackingNumber() == null) {
				trade.setStatus("입금완료");
				service.modifyTradeStatus(trade);
			}else {
				trade.setStatus("배송완료");
				service.modifyTradeTracking(trade);
			}
			
			return "0";
		}
	 
		

}
