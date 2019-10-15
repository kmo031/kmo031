<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>


 <!--    <div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>결제하기</span></p>
            <h1 class="mb-0 bread">결제하기</h1>
          </div>
        </div>
      </div>
    </div> -->

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
						<form role="form" action="/tradeadd"  Method="POST" class="billing-form" name="tradeform">
							<h3 class="mb-4 billing-heading">결제정보</h3>
	          	<div class="row align-items-end" id="form-datalist">
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="name">이름</label>
	                  <input type="text" name="userName" id="name" class="form-control" readonly required value="<c:out value="${member.userName}"/>">
	                </div>
	              </div>
	         
		            <div class="w-100"></div>
		            <div class="col-md-6">
		            	<div class="form-group">
	                	<label for="streetaddress">주소</label>
	                  <input type="text" name="userAddress" class="form-control" placeholder="주소를 입력해주세요" required value="<c:out value="${member.userAddress}"/>">
	                </div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-6">
		            	<div class="form-group">
	                	<label for="streetaddress">입금정보</label>
	                  <input type="text" name="accountName" class="form-control" placeholder="입금자명을 입력해주세요" required value="<c:out value="${member.userName}"/>">
	                </div>
		            </div>
		            <div class="col-md-6">
		            	<div class="form-group">
	                  <input type="text" name="bank" class="form-control" required placeholder="입금은행을입력해주세요">
	                </div>
		            </div>
		            
		            <div class="w-100"></div>
		            <div class="col-md-6">
	                <div class="form-group">
	                	<label for="phone">계좌번호</label>
	                  <input type="text" name="account" class="form-control" placeholder="입금계좌번호를 - 빼고 입력해주세요" required >
	                </div>
	              </div>
		            
		        
		            <div class="w-100"></div>
		            <div class="col-md-6">
	                <div class="form-group">
	                	<label for="phone">전화번호</label>
	                  <input type="text" name="userTelnum" class="form-control" placeholder="전화번호를 입력해주세요" required value="<c:out value="${member.userTelnum}"/>">
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="emailaddress">이메일주소</label>
	                  <input type="email" name="userEmail" class="form-control" placeholder="이메일주소를 입력해주세요" required>

	                </div>
                </div>
	            </div> 
	            		<div class="col-xl-5">
	          <div class="row mt-5 pt-3">
	          	<div class="col-md-12 d-flex mb-5">
	          		<div class="cart-detail cart-total p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">장바구니 합계</h3>
	          			<p class="d-flex">
		    						<span>상품금액</span>
		    						<span id="cart-product-price-total"></span>
		    					</p>
		    					<p class="d-flex">
		    						<span>택배비</span>
		    						<span id="cart-product-delivery"></span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>총합</span>
		    						<span id="cart-product-price"></span>
		    						<div id="total-price"></div>
		    					</p>
								</div>
	          	</div>
	          	
	          	<div class="col-md-12">
	          		<div class="cart-detail p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">결제수단</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label style="font-size : 20px">직접 송금</label>
											</div>
											<div class="radio">
											   <label>다른수단 추가예정</label><br>
											   <label style="font-size : 18px; color: red;">입금계좌</label><br>
											   <label style="font-size : 15px; color: red;">농협 352-1000000-13 정상민</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="checkbox">
											   <label><input type="checkbox" value="" class="mr-2" required>위의 내용을 확인하였습니다.</label>
											</div>
										</div>
									</div>
										<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
								<!-- 	<p><input type="submit" <a href="#"class="btn btn-primary py-3 px-4">결제신청</a></p> -->
									<p><input type="submit" id="checkoutbtn" class="btn btn-primary py-3 px-4" value="결제신청"></p>
								</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
	          </form><!-- END -->
					</div>
					
			
        </div>
      </div>
    </section> <!-- .section -->

		
 
 <%@include file="./includes/footer.jsp" %>
 
 <script>

	
	
    $(document).ready(function(){
    	(function(){
    		//장바구니목록, 상품정보, 상품 메인사진 경로 가져오기
    		$.getJSON("/getCartList",function(arr){
    			
    			var cart_content = "";
    			var cart_product_name ="";
    			var cart_product_price = 0 ;
    			var cart_product_delivery = 0 ;
    			var cart_product_price_total = 0;
    			var form_datalist = "";
    			
    			$(arr).each(function(i, cart){

    				//cart의 개수를 알아내는법찾기 수정예정
    				cart_product_name += (cart.product.ptitle) + ", "
    			
    				cart_product_price +=(cart.product.pprice)*(cart.amount);
    			});
    			
    			
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
    			
    			form_datalist += "<input type='hidden' name='total' value='"+cart_product_price+"'>"; //상품금액저장
    			form_datalist += "<input type='hidden' name='productList' value='"+cart_product_name+"'>"; //상품목록저장
    			$("#form-datalist").append(form_datalist);
    			console.log(form_datalist);
    			
    			
    			
    			
    		});
    	})();
    }); //end ready
    
    //구매버튼 클릭 시 폼데이터랑 전송
   /*  var formObj = $("form[role='form']");
	  
	  $("#checkoutbtn").on("click", function(e){
	    
	    e.preventDefault();
	    console.log("submit clicked");
	    
	    var str = "";
	    
	    //총합금액저장
	    str += "<input type='hidden' name='total' value='"+$("#cart-product-price").text()+"'>";
	    console.log("str" +str);
	      
	    formObj.append(str).submit();
	    }); */
	  
	    
    
	</script>
    
  </body>
</html>