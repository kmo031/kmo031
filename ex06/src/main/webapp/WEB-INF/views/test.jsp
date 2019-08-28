<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form method="post" action="/join">

		
			 <input name="userid" >
			
			
			

			
				
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<button type="submit">버튼</button>
</form>

</body>
</html>