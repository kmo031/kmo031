<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp" %>

	
	
    <div class="card align-middle" style=" border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인</h2>
		</div>
		<div class="card-body">
		
		
		
      <form class="form-signin" method="POST" action="/login">
      	<h3><c:out value="${error}"/></h3>
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="uid" class="sr-only">아이디</label>
        <input type="text" id="uid" class="form-control" placeholder="아이디를 입력하여주세요" name="username" required autofocus><BR>
        <label for="upw" class="sr-only">비밀번호</label>
        <input type="password" id="upw" class="form-control" placeholder="비밀번호를 입력하여주세요" name="password" required><br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 기억하기
          </label>
        </div>
        <button id="btn-rogin" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button><br>
        <a href="join"> 
        	<button id="btn-join" class="btn btn-lg btn-success btn-block" type="button">회원가입</button></a>
      
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </form>
      
		</div>
	</div>

<%@include file="./includes/footer.jsp" %>

  </body>
</html>