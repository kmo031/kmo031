<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>

	 <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>주문번호</th>
						        <th>주문일자</th>
						        <th>상품이름</th>
						        <th>금액</th>
						        <th>배송조회</th>
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

		$(document).ajaxSend(function(e, xhr, option) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});

		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";

	});
</script>
 
			
<script>

	

    $(document).ready(function(){
    	(function(){
    		$.getJSON("/getTradeList",function(arr){
    			
    			var tradeList = "";
    			console.dir(arr);
    			$(arr).each(function(i, trade){
			     
		      
	    			/* str += "<div class='col-md-6 col-lg-3 ftco-animate'>"; */ //이 ftco-animate를 넣으면 화면이 출력이 안된다. 이유는 찾아보기로
	    			tradeList += "<tr><td>"+trade.tno+"</td>";
	    			tradeList += "<td>"+trade.regDate+"</td>";
	    			tradeList += "<td>"+trade.productList+"</td>";
	    			tradeList += "<td>"+trade.total+"</td>";
	    			tradeList += "<td>"+trade.status+"";
	    			if(trade.status === "배송완료"){
	    				tradeList += "<br><a href='http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="+trade.trackingNumber+"' target='_blank'>배송조회</a>";
	    			}
	    			tradeList += "</td></tr>";
		
    			});
    			$(".tbody-group").html(tradeList);
    		});
    	})();//end getJSON
    	
    	
    });
</script>  
 
			

		
	
    
  </body>
</html>