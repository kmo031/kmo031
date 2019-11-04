<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>

    <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(/resources/images/bg_1.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-center">
	              <h1 class="mb-2">쇼핑몰 포트폴리오</h1>
	              <h2 class="subheading mb-4">쇼핑몰 포트폴리오</h2>
	            </div>

	          </div>
	        </div>
	      </div>

	      <div class="slider-item" style="background-image: url(/resources/images/bg_2.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-center">
	              <h1 class="mb-2">새롭게</h1>
	              <h2 class="subheading mb-4">도전</h2>
	            </div>

	          </div>
	        </div>
	      </div>
	    </div>
    </section>

   <!--  <section class="ftco-section">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Free Shipping</h3>
                <span>On order over $100</span>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Always Fresh</h3>
                <span>Product well package</span>
              </div>
            </div>    
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Superior Quality</h3>
                <span>Quality Products</span>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Support</h3>
                <span>24/7 Support</span>
              </div>
            </div>      
          </div>
        </div>
			</div>
		</section> -->

		<!-- <section class="ftco-section ftco-category ftco-no-pt">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6 order-md-last align-items-stretch d-flex">
								<div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(/resources/images/category.jpg);">
									<div class="text text-center">
										<h2>Vegetables</h2>
										<p>Protect the health of every home</p>
										<p><a href="#" class="btn btn-primary">Shop now</a></p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(/resources/images/category-1.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="#">Fruits</a></h2>
									</div>
								</div>
								<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(/resources/images/category-2.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="#">Vegetables</a></h2>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(/resources/images/category-3.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="#">Juices</a></h2>
							</div>		
						</div>
						<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(/resources/images/category-4.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="#">Dried</a></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
 -->
    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">상품목록</span>
            <h2 class="mb-4">다양한 상품을 만나보세요</h2>
            <p>다양한 상품이 준비되어 있습니다. 즐거운쇼핑 되세요</p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row" id="productlist">
    			
    		</div>
    	</div>
    </section>
		
		
   
<%@include file="./includes/footer.jsp" %>

<script>

	

    $(document).ready(function(){
    	(function(){
    		$.getJSON("/getProductList",function(arr){
    			
    			var str = "";
    			console.dir(arr);
    			$(arr).each(function(i, product){
    			var fileCallPath = encodeURIComponent(product.attachList[0].uploadPath+ "/" + product.attachList[0].uuid +"_" +
    					product.attachList[0].fileName);
    		
    			/* str += "<div class='col-md-6 col-lg-3 ftco-animate'>"; */ //이 ftco-animate를 넣으면 화면이 출력이 안된다. 이유는 찾아보기로
    			str += "<div class='col-md-6 col-lg-3'>";
				str += "<div class='product'>";
				str += "<a href='product/detail?pno="+product.pno+"' class='img-prod'><img class='img-fluid'";
				str += "src=display?fileName="+fileCallPath+" alt='Colorlib Template'>";
				str += "<div class='overlay'></div> </a>";
				str += "<div class='text py-3 pb-4 px-3 text-center'>";
				str +="<h3><a href='product/detail?pno="+product.pno+"'>"+product.ptitle+"</a></h3>"
				str += "<div class='d-flex'><div class='pricing'><p class='price'>";
				str += "<span>"+product.pprice+"원</span>";
				str += "</p></div></div></div></div></div>";
				//8개까지만 표시
				 if(i == 7){ 
					 return false;
				 }
    			});
    			$(".row#productlist").append(str);
    		});
    	})();
    });
</script>  

  </body>
  </html>