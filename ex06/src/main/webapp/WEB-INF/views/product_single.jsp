<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>


    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate" id="mainpicture">
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3><c:out value ="${product.ptitle}"/></h3>
    				<!-- 나중에기능추가예정  -->
    				<!-- <div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>
							</p>
							<p class="text-left">
								<a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
							</p>
						</div> -->
    				<p class="price"><span><c:out value ="${product.pprice}"/>원</span></p>
    				<p><c:out value ="${product.pcontent}"/></p>
						<div class="row mt-4">
							<div class="col-md-6">
							
							<!-- 옵션선택드롭다운 나중에추가 -->
							<!-- 	<div class="form-group d-flex">
		              <div class="select-wrap">
	                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                  <select name="" id="" class="form-control">
	                  	<option value="">가능성</option>
	                    <option value="">도전</option>
	                    <option value="">인내심</option>
	                    <option value="">성장</option>
	                  </select>
	                </div>
		            </div> -->
							</div>
							<div class="w-100"></div>
							<label style="color: #000;">수량</label>
							<div class="input-group col-md-6 d-flex mb-3">
	             	<span class="input-group-btn mr-2">
	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
	             	<input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
	                     <i class="ion-ios-add"></i>
	                 </button>
	             	</span>
	          	</div>
	          	<div class="w-100"></div>
	          	<div class="col-md-12">
	          		<p style="color: #000;">배송비 2500원</p>
	          		<p style="color: #000;">3만원이상 구매시 무료배송</p>
	          	</div>
          	</div>
          	<!--합계금액 표시 추가예정  -->
          <!-- 	<div class="amount" style="color: blue;">
          		<p>구매비용은</p>
          	</div> -->
          	<div class="form-signin" style="display: flex;">
          		
          		<div class="form-group" style="margin : 0 auto;">
          			<p><a href="/cart" class="btn btn-black py-3 px-5"id="cartBtn">장바구니담기</a></p> 
				<!-- <input class="btn btn-black py-3 px-5" type="button" id="cartBtn" value="장바구니담기">  -->
				</div>
				
          		
          	</div>
          <!-- 	<p><a href="cart.html" class="btn btn-black py-3 px-5">Add to Cart</a></p> -->
    			</div>
    		</div>
    	</div>
    </section>
	<section class="ftco-section">
		<div class="container" id="subpicture">
			
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
			
			

			//사진 정보 불러오기
		   (function(){
			   var pno = "<c:out value='${product.pno}'/>";
		     		$.getJSON("/getProductDetail", {pno: pno}, function(arr){
		     			
		     			var str = "";
		     			var str2 = "";
		     		$(arr).each(function(i, Attach){
		     			var fileCallPath = encodeURIComponent(Attach.uploadPath+ "/" + Attach.uuid +"_" +
		     					Attach.fileName);
		     			
		     			if(Attach.mainPicture == true){
		     			//사진을 누르면 크게 보여주기 추가예정
		     			//str += "<a href='/display?fileName="+fileCallPath+"' class='image-popup'>";
		     				str += "<img src='/display?fileName="+fileCallPath+"' class='img-fluid' alt='Colorlib Template'>";
		     			//</a>";
		     			}else{
		     				str2 += "<img src='/display?fileName="+fileCallPath+"' class='img-context' alt='Colorlib Template'>";
		     			}
		     			});
		     			$("#mainpicture").html(str);  
		     		 	$("#subpicture").html(str2);
		     		// });
		     		});//end getjson
		     	})(); // end function
		     	
		    
		});
		
		$("#cartBtn").on("click", function(e){
			var formData= new FormData();
			
			var pno = "${product.pno}";
			var amount = parseInt($('#quantity').val());
			formData.append("pno", pno);
			formData.append("amount", amount);
			
			
				$.ajax({
					url: '/cartAdd',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(result){
					}
				}); //ajax end
		});
		
		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
	</script>
    
  </body>
</html>