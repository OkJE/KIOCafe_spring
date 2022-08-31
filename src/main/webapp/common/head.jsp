<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Head</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<!--  -->

	<!-- 로고 및 index이동   시작 -->
	<div style="width: 80%; margin: auto;">
	<div class="w3-center">
		<a
			href="${pageContext.request.contextPath}/mainpage">
			<img
			src="${pageContext.request.contextPath}/common/img/kic_project_top_img_last.png"
			style="width:100%; height:21rem">
		</a>
	</div>
	<!-- 로고 및 index이동   끝-->

	<!-- 회원가입 로그인 마이페이지 시작 -->
	<div style="font-size: 1rem; color: gray; text-align: right; ">
	  <c:if test="${sessionScope.id==null}">
		<a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a>&nbsp;|&nbsp;
		<a href="${pageContext.request.contextPath}/member/loginForm">로그인</a>
	</c:if>
	
	 <c:if test="${sessionScope.id!=null}">
		<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>&nbsp;|&nbsp;
		<a href="${pageContext.request.contextPath}/member/myaccount">마이페이지</a>
	</c:if>

	</div>
	<br>
	<!-- 회원가입 로그인 마이페이지  끝  -->




	<!-- 메뉴바  -->

		<div class="w3-bar w3-sand w3-middle">
			<a
				href="${pageContext.request.contextPath}/mainpage"
				class="w3-bar-item w3-button">HOME</a>

			<div class="w3-dropdown-hover">
				<button class="w3-button  w3-sand">
					카테고리
				</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
					<a href="${pageContext.request.contextPath}/category/bakeryMain" class="w3-bar-item w3-button">디저트</a>
					<a href="${pageContext.request.contextPath}/category/drinkMain" class="w3-bar-item w3-button">음료</a>
				</div>
			</div>


			<div class="w3-dropdown-hover">
				<button class="w3-button  w3-sand">주문조회</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
					<a href="#" class="w3-bar-item w3-button">장바구니</a>
					<a href="#" class="w3-bar-item w3-button">결제란</a>
				</div>
			</div>


			<a href="#" class="w3-bar-item w3-button">배송조회</a>

			<!-- 검색창 시작-->
			<div class="w3-right" style="margin-right: 7rem;">
				<input type="text" class="w3-bar-item w3-input"
					placeholder="Search.."> <a href="#"
					class="w3-bar-item w3-button w3-white">Go</a>
			</div>
			<!-- 검색창 끝 -->

		</div>
	</div>
	<!-- 메뉴바  끝-->

</body>
</html>