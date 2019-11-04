<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>

    <div class="hero-wrap hero-bread" style="background-color: #82ae46;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">장바구니</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>상품이름</th>
						        <th>가격</th>
						        <th>수량</th>
						        <th>합계</th>
						      </tr>
						    </thead>
						    <tbody class="tbody-group">
						      <tr>
						      	 <td align="center" colspan="5">등록된 상품이 없습니다. </td>
						      </tr>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
    		
    			
    			<div class="cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>장바구니 금액</h3>
    					<p class="d-flex">
    						<span>상품가격</span>
    						<span id="cart-product-price"></span>
    					</p>
    					<p class="d-flex">
    						<span>배송비</span>
    						<span id="cart-product-delivery"></span>
    					</p>
    					<hr>
    					<p class="d-flex total-price">
    						<span>합계</span>
    						<span id="cart-product-price-total"></span>
    					</p>
    				</div>
    				<p><a href="/checkout" class="btn btn-primary py-3 px-4" style=" display : block;">결제</a></p>
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
    		//장바구니목록, 상품정보, 상품 메인사진 경로 가져오기
    		$.getJSON("/getCartList",function(arr){
    			
    			var cart_content = "";
    			var cart_product_price = 0 ;
    			var cart_product_delivery = 0 ;
    			var cart_product_price_total = 0;
    			$(arr).each(function(i, cart){
    				
    				/* var fileCallPath = encodeURIComponent(cart.product.uploadPath+ "/" + Attach.uuid +"_" +
	     					Attach.fileName); */
   					var fileCallPath = encodeURIComponent(cart.product.attachList[0].uploadPath+ "/" + cart.product.attachList[0].uuid +"_" +
   							cart.product.attachList[0].fileName); 
    				
	     		
    				cart_content += "<tr class='text-center'>";
    				cart_content += "<input type='hidden' value='"+cart.cno+"' class='btn-cart-delete'>";
    				cart_content += "<td class='product-remove'><span class='ion-ios-close'></span></a></td>";
    				cart_content += "<td class='image-prod'><div class='img' style='background-image:url(display?fileName="+fileCallPath+");'></div></td>";
    				cart_content += " <td class='product-name'>";
    				cart_content += " <h3>"+cart.product.ptitle+"</h3>";
    				cart_content += "<p>"+cart.product.pcontent+"</p>";
    				cart_content += "</td><td class='price'>"+cart.product.pprice+"</td>";
    				cart_content += " <td class='quantity'>";
    				cart_content += "<div class='input-group mb-3'>";
    				cart_content += " <input type='text' name='quantity' class='quantity form-control input-number' value='"+cart.amount+"' min='1' max='100'>";
    				cart_content += "</div></td> <td class='total'>"+(cart.product.pprice)*(cart.amount)+"원</td></tr>";
    				cart_content += " <td class='quantity'>";
    				cart_product_price +=(cart.product.pprice)*(cart.amount);
    			});
    			if(cart_content != ""){$(".tbody-group").html(cart_content);} // 장바구니 정보 입력 
    			
    			if(cart_product_price >= 30000){
 
    			}else{
    				cart_product_delivery = 2500;
    			}
    			cart_product_price_total += (cart_product_price + cart_product_delivery); //택배비와 상품총합을 더한가격
    			cart_product_price_total += "원";
    			$("#cart-product-price-total").html(cart_product_price_total);
    			
    			cart_product_delivery += "원";
    			$("#cart-product-delivery").html(cart_product_delivery); // 구매가격이3만원이상인경우 배송비없음
    			
    			cart_product_price +="원";
    			$("#cart-product-price").html(cart_product_price); // 장바구니내 상품가격의 합
    			
    			
    		});
    	})();
    });
    
  //지우기 버튼 클릭시 장바구니 목록 삭제
    $(document).on('click','.product-remove', function(){ 
	   	
    	var cno = ($(this).prev('.btn-cart-delete')).val(); //해당 게시물 cno가져오기
    	
	
		console.log(cno);
	 	var form={cno : cno};
		
		
		$(function() {
		    $.ajax({
		        url: '/cart_delete',
		        data: form,
		        type: "POST",
		        error : function(error) {
		            alert("Error!");
		        },
		        success: function () {
		          
		           (function(){
		       		//장바구니목록, 상품정보, 상품 메인사진 경로 가져오기
		       		$.getJSON("/getCartList",function(arr){
		       			
		       			var cart_content = "";
		       			var cart_product_price = 0 ;
		       			var cart_product_delivery = 0 ;
		       			var cart_product_price_total = 0;
		       			$(arr).each(function(i, cart){
		       				
		       				/* var fileCallPath = encodeURIComponent(cart.product.uploadPath+ "/" + Attach.uuid +"_" +
		   	     					Attach.fileName); */
		      					var fileCallPath = encodeURIComponent(cart.product.attachList[0].uploadPath+ "/" + cart.product.attachList[0].uuid +"_" +
		      							cart.product.attachList[0].fileName); 
		       				
		   	     		
		       				cart_content += "<tr class='text-center'>";
		       				cart_content += "<input type='hidden' value='"+cart.cno+"' class='btn-cart-delete'>";
		       				cart_content += "<td class='product-remove'><span class='ion-ios-close'></span></a></td>";
		       				cart_content += "<td class='image-prod'><div class='img' style='background-image:url(display?fileName="+fileCallPath+");'></div></td>";
		       				cart_content += " <td class='product-name'>";
		       				cart_content += " <h3>"+cart.product.ptitle+"</h3>";
		       				cart_content += "<p>"+cart.product.pcontent+"</p>";
		       				cart_content += "</td><td class='price'>"+cart.product.pprice+"</td>";
		       				cart_content += " <td class='quantity'>";
		       				cart_content += "<div class='input-group mb-3'>";
		       				cart_content += " <input type='text' name='quantity' class='quantity form-control input-number' value='"+cart.amount+"' min='1' max='100'>";
		       				cart_content += "</div></td> <td class='total'>"+(cart.product.pprice)*(cart.amount)+"원</td></tr>";
		       				cart_content += " <td class='quantity'>";
		       				cart_product_price +=(cart.product.pprice)*(cart.amount);
		       			});
		       			if(cart_content != ""){$(".tbody-group").html(cart_content);} // 장바구니 정보 입력 
		       			
		       			if(cart_product_price >= 30000){
		    
		       			}else{
		       				cart_product_delivery = 2500;
		       			}
		       			cart_product_price_total += (cart_product_price + cart_product_delivery); //택배비와 상품총합을 더한가격
		       			cart_product_price_total += "원";
		       			$("#cart-product-price-total").html(cart_product_price_total);
		       			
		       			cart_product_delivery += "원";
		       			$("#cart-product-delivery").html(cart_product_delivery); // 구매가격이3만원이상인경우 배송비없음
		       			
		       			cart_product_price +="원";
		       			$("#cart-product-price").html(cart_product_price); // 장바구니내 상품가격의 합
		       		});
		       	})();
		           alert("성공하였습니다.");
		        }
		    });
		});
    });
</script>  

    </body>
   </html>
