
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form class="w3-container w3-center" style="width:400px; margin: auto;" action="${pageContext.request.contextPath}/member/memberDeletePro" method="post">
 <br>
 <br>
 <br>
  <label style="text-align: left">탈퇴를 원하신다면,<br> 아래 칸에 비밀번호를 입력해주세요.</label>
  <br>
  <p>
  <input class="w3-input" type="password" name="pass"></p>
  <p>
 
  <input class="w3-btn w3-pale-red" type="submit" style="width: 100px"  value="확인"></p>

</form>

</body>
</html>