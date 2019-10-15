<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp"%>



<div class="card align-middle" style="border-radius: 20px;">
	<div class="card-title" style="margin-top: 30px;">
		<h2 class="card-title text-center" style="color: #113366;">회원가입</h2>
	</div>
	<div class="card-body">

		<form class="form-signin" method="POST" action="/join">
			<p>
				<label for="unick" class="sr-only">이름</label> <input type="text"
					id="unick" class="form-control" placeholder="이름을 입력하여주세요"
					name="userName" required autofocus>
			</p>
			<p>
				<label for="uid" class="sr-only">아이디</label> <input type="text"
					id="uid"class="form-control" placeholder="아이디를 입력하여주세요"
					name="userId" required>
			</p>
			<p>
				<label for="upw" class="sr-only">비밀번호</label> <input type="password"
					id="upw" class="form-control" placeholder="비밀번호" name="userPw"
					required>
			</p>
			<p>
				<label for="upwre" class="sr-only">비밀번호확인</label> <input
					type="password" id="upwre" class="form-control"
					placeholder="비밀번호확인" name="userPwRe" required>
			</p>
			<p>
				<label for="utelnum" class="sr-only">전화번호</label> <input type="text"
					id="utelnum" class="form-control" placeholder="전화번호를 -를빼고 입력하여주세요"
					name="userTelnum" required>
			</p>
			<p>
				<label for="ubirth" class="sr-only">생년월일</label> <input type="text"
					id="ubirth" class="form-control" placeholder="ex ) 950823"
					name="userBirthday" required>
			</p>
			
				<label for="uaddr" class="sr-only">주소</label> <input type="text"
					id="uaddr" class="form-control"
					placeholder="주소를 입력하여 주세요 (주소검색API)추가예정" name="userAddress" required>
			

			<div class="radio">
				<p>
					<label>성별</label> <label for="men">남</label> <input
						type="radio" value="0" checked  name="userGender" required> <label
						for="girl">여</label> <input type="radio" value="1" name="userGender"
						required>
				</p>
			</div>

			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div></div>
			<button id="btn-joinAdd" class="btn btn-sm btn-primary btn-block"
				type="submit">회원가입</button>
			
		</form>
		
		

	</div>
</div>

<%@include file="./includes/footer.jsp"%>




<script>

	
	$(document).ready(function() {
	
		$(document).ajaxSend(function(e, xhr, option) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
	
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	
	});

	//id 중복체크
	$("#uid").blur(function(){
		var user_id = $("#uid").val();
		if(user_id != ""){
		 	$.ajax({
				url : '/user/idCheck?userId='+user_id,
				type : 'get',
				dataType : "json",
				
				success : function(data) {
					if(data == 1){
						 $("#uid").attr('style', 'background-color : #f90707e3 !important');
						 $("#uid").val("");
						 alert("이미 존재하는 아이디 입니다.");
					}else{
						 $("#uid").attr('style', 'background-color :#82ae46 !important');
					}
				}
			}); //ajax end */
		}
	});
	//password 확인
	$("#upwre").blur(function(){
		var user_pw = $("#upw").val();
		var user_pwre = $("#upwre").val();
		if(user_pwre != ""){
			if(user_pw == user_pwre){
				$("#upw").attr('style', 'background-color :#82ae46 !important');
				$("#upwre").attr('style', 'background-color :#82ae46 !important');
			}else{
				$("#upw").attr('style', 'background-color :#f90707e3 !important');
				$("#upwre").attr('style', 'background-color :#f90707e3 !important');
				$("#upw").val("");
				$("#upwre").val("");
				alert("비밀번호가 일치하지 않습니다.")
			}
		}
	});

</script>

</body>
</html>