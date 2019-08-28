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
					placeholder="비밀번호확인" name="passwordre" required>
			</p>
			<p>
				<label for="utelnum" class="sr-only">전화번호</label> <input type="text"
					id="utelnum" class="form-control" placeholder="-를빼고 입력하여주세요"
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
					<label for="gender">성별</label> <label for="men">남</label> <input
						type="radio" id="men" name="usergender" required> <label
						for="girl">여</label> <input type="radio" id="girl" name="usergender"
						required>
				</p>
			</div>

			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div></div>
			<button id="btn-Select2" class="btn btn-sm btn-primary btn-block"
				type="submit">회원가입</button>
			<button type="reset" id="btn-Select2" class="btn btn-sm btn-primary btn-block"
				type="submit">다시쓰기</button>
			
		</form>
		
		

	</div>
</div>

<%@include file="./includes/footer.jsp"%>

</body>
</html>