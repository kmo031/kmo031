<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>
	 <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<label>운송장번호 저장시 해당 구매번호 배송중으로 변경</label>
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>주문번호</th>
						        <th>주문일자</th>
						        <th>상품이름</th>
						        <th>금액</th>
						        <th>계좌정보/현재상태</th>
						        <th>주소/운송장번호입력</th>
						     
						      </tr>
						    </thead>
						    <tbody class="tbody-group">
						      <tr>
						     	 <td align="center" colspan="5">주문하신 상품이 없습니다. </td>
						      </tr>
						  <%--     <c:if test="${{trade} ne null}">
						      	<c:forEach items="${trade}" var="list">
							      	<tr>
								      	<td><c:out value="${list.tno}"/></td>
								      	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regDate}"/></td>
								      	<td><c:out value="${list.productList}"/></td>
								      	<td><c:out value="${list.total}"/></td>
								      	<td><c:out value="${list.status}"/></td>
								     
							      	</tr>
						      	</c:forEach>
						      </c:if> --%>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
    		</div>
		</section>


    
  
 
<%@include file="./includes/footer.jsp" %>

<script>
	$(document).ready(function() {
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";

		$(document).ajaxSend(function(e, xhr, option) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});

		

	});
</script>
 
			
<script>

	

    $(document).ready(function(){
    	(function(){
    		$.getJSON("/getTradeAllList",function(arr){
    			
    			var tradeList = "";
    			console.dir(arr);
    			$(arr).each(function(i, trade){
			     
		      
    			/* str += "<div class='col-md-6 col-lg-3 ftco-animate'>"; */ //이 ftco-animate를 넣으면 화면이 출력이 안된다. 이유는 찾아보기로
    			tradeList += "<tr class='tr-list'><td class='td-tno'>"+trade.tno+"</td>";
    			tradeList += "<td>"+trade.regDate+"</td>";
    			tradeList += "<td>"+trade.productList+"</td>";
    			tradeList += "<td>"+trade.total+"</td>";
    			tradeList += "<td>입금자명:"+trade.accountName+"<br>입금은행:"+trade.bank+"<br>입금계좌"+trade.account+"<br><h5>" +trade.status+"</h5></td>";
    			
    			if(trade.status === "입금완료"){ 
    				tradeList += "<td>주소:"+trade.userAddress+"<br><h5>운송장번호</h5><input type='text' id='trackingNumber' >&nbsp;<input type='button' class='save'  value='저장'></td></tr>";
    			}else if(trade.status === "입금대기"){
    				tradeList += "<td><input type='button' class='save' value='입금확인'></td></tr>";
    			}else{
    				tradeList += "<td>배송완료<br><a href='http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="+trade.trackingNumber+"' target='_blank'>배송조회</a></td> </tr>";
    			}
    			
    			
    				/* tradeList += "<td id= 'test1'>주소:"+trade.userAddress+"<br><h5>운송장번호</h5><input type='text' name='status' class='td-status' class='save' >&nbsp;<input type='button'  value='저장'></td></tr>"; */
    		
		
    			});
    			$(".tbody-group").html(tradeList);
    		});
    	})();// getJSON end
    });
    
    
    
    //운송장번호 저장 클릭시 저장
    $(document).on('click','.save', function(){ 
	   	
		var tno = ($(this).parents('.tr-list').children('.td-tno')).html();  //tno번호가져오기
		var trackingNumber = ($(this).prev('#trackingNumber')).val();  //운송장번호 정보가져오기 
		
	/* 	console.log("tno" + tno);
		console.dir("this" + trackingNumber);  */
		
		var form={tno : tno,
				trackingNumber: trackingNumber};
		
		
		$(function() {
		    $.ajax({
		        url: '/trade_change',
		        data: form,
		        type: "POST",
		        error : function(error) {
		            alert("Error!");
		        },
		        success: function (data) {
		           alert("성공하였습니다.");
		        }
		    });
		});

			
	}); 
</script>  
 
			

		
	
    
  </body>
</html>