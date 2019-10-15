<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp"%>



<section class="ftco-section">
	<div class="container">
	
	
		<!--카테고리 추가예정  -->
		<!-- <div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center">
				<ul class="product-category">
					<li><a href="#" class="active">전체보기</a></li>
					<li><a href="#">카테고리1</a></li>
					<li><a href="#">카테고리2</a></li>
					<li><a href="#">카테고리3</a></li>
					<li><a href="#">카테고리4</a></li>
				</ul>
			</div> 
		</div> -->
		
		
		
		<div class="row" id="productlist">
			
		</div>
			<!-- 페이지 버튼  -->
	<!-- 	<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div> -->
		
			<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous" ><a href="${pageMaker.startPage -1}">&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">   
						 	<li class="paginate_button" ${pageMaker.cri.pageNum == num? "active":""} ><a href="${num}">${num}</a></li>  
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">&gt;</a></li>
						</c:if>
					</ul>
				 	<form id="actionForm" action="/shop" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form> 
				</div>
			</div>
		</div>
	
	</div>
</section>



<script>

	

    $(document).ready(function(){
    	(function(){
    		$.getJSON("/getProductList?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}",function(arr){ 
    			
    			console.log();
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
    			});
    			$(".row#productlist").append(str);
    		});
    	})(); //getJSON end
    	
    	var actionForm = $("#actionForm");
    	$(".paginate_button a").on("click", function(e){
    		e.preventDefault();
    		console.log("click");
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		actionForm.submit();
    	});
    });
</script>  
 
    
    
   
    
 

<%@include file="./includes/footer.jsp"%>

</body>
</html>