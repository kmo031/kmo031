<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>첫 홈페이지 만들기</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">

<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">

<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/ionicons.min.css">

<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">

<link rel="stylesheet" href="/resources/css/custom.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>
<body class="goto-here">
	<div class="py-1 bg-primary">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">+ 010 2230 1739</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">kmo031@naver.com</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
							<span class="text">배송기간1~2일 &amp; 무료배송</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/">상민's Shop</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="/" class="nav-link">홈</a></li>
				<!-- 	<li class="nav-item dropdown">
					  <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">상품</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop">상품</a>
              	<a class="dropdown-item" href="wishlist ">Wishlist</a>
                <a class="dropdown-item" href="product-single ">Single Product</a>
                <a class="dropdown-item" href="cart ">Cart</a>
                <a class="dropdown-item" href="checkout ">Checkout</a>
              </div>
            </li>  -->
					<li class="nav-item"><a href="/shop " class="nav-link">상품</a></li>
					<!-- <li class="nav-item"><a href="about " class="nav-link">About</a></li>
					<li class="nav-item"><a href="blog " class="nav-link">Blog</a></li> -->
					<sec:authorize access="isAnonymous()">
						<li class="nav-item"><a href="/login " class="nav-link">로그인</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown">
				 		<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">내 정보</a>
		            	<div class="dropdown-menu" aria-labelledby="dropdown04">
			              	<a class="dropdown-item" href="/mamberstatus">내 정보</a>
			              	<a class="dropdown-item" href="/tradelist">거래현황</a>
		              </div>
		            </li>  
					</sec:authorize>
					<!-- 관리자만 접근가능  -->
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item"><a href="/pRegister " class="nav-link">상품등록</a></li>
					
						<li class="nav-item"><a href="/trademanager " class="nav-link">판매현황</a></li>
					</sec:authorize>
					
					<li class="nav-item cta cta-colored"><a href="/cart "
						class="nav-link"><span class="icon-shopping_cart" id="cart-icon"></span>[0]</a></li>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><a class="nav-link"
							href="javascript:document.getElementById('logout').submit()">로그아웃</a>
							<form id="logout" action="<c:url value="/Logout"/> "
								method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token }" />
							</form></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	
	<script>
	
	/* $(document).ready(function(){
		
		

		//사진 정보 불러오기
	   (function(){
		   var pno = "<c:out value='${product.pno}'/>";
	     		$.getJSON("/getProduct", {pno: pno}, function(arr){
	     			
	     			var str = "0";
	     		
	     		 	$("#subpicture").html(str2);
	     		// });
	     		});//end getjson
	     	})(); // end function
	     	
	    
	}); */
	</script>
	
	
	