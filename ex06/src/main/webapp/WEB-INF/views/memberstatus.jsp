<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp"%>



<div class="card align-middle" style="border-radius: 20px;">
	<div class="card-title" style="margin-top: 30px;">
		<h2 class="card-title text-center" style="color: #113366;">내정보</h2>
	</div>
	<div class="card-body">

		<form class="form-signin" method="POST" action="/member_status_modify">
			<p>
				<label for="unick" >이름</label> <input type="text" style="background-color: #b6bfa9!important;"
					id="unick" class="form-control" name="userName" readonly value="<c:out value="${member.userName}"/>">
			</p>

			<p>
				<label for="uid" > 아이디</label> <input type="text" 
					id="uid"class="form-control" style="background-color: #b6bfa9!important;"
					name="userId" readonly value="<c:out value="${member.userId}"/>">
			</p>
			<p>
				<label for="ubirth"  >생년월일</label> <input type="text" style="background-color: #b6bfa9!important;"
					id="ubirth" class="form-control" 
					name="userBirthday" readonly value="<c:out value="${member.userBirthday}"/>">
			</p>
			<p>
				<label for="utelnum" >전화번호</label> <input type="text" 
					id="utelnum" class="form-control" 
					placeholder="-를 빼고 입력하여주세요"
					name="userTelnum" value="<c:out value="${member.userTelnum}"/>" >
			</p>
			<p>
				<label for="uaddr"  >주소</label> <input type="text" 
					id="uaddr" class="form-control"
					placeholder="주소를 입력하여 주세요 (주소검색API)추가예정" name="userAddress" required
					value="<c:out value="${member.userAddress}"/>">
			</p>

			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div></div>
			<button id="btn-joinAdd" class="btn btn-sm btn-primary btn-block"
				type="submit">정보변경</button>
		</form>
		
		

	</div>
</div>

<%@include file="./includes/footer.jsp"%>

<script>


</script>

</body>
</html>