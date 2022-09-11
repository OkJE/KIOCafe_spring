<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>

</head>
<html>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div style="width:400px; margin: auto;">
<form class="w3-container" action="${pageContext.request.contextPath}/member/loginPro" method="post">
  <br>
  <br>
  <br>
  <p>
    
  <label>ID</label>
  <p><input class="w3-input w3-hover-light-gray" type="text" name="id"></p>
  <p>
  <label>Password</label>
  <input class="w3-input w3-hover-light-gray" type="password" name="pass"></p>
  <p style="text-align: center">
  <br>
  <input class="w3-btn w3-pale-red" type="submit" style="width: 100px"   value="확인" ></p>

</form>
  </div>

</body>
</html> 