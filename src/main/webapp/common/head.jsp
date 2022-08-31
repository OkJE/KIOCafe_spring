<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			href="${pageContext.request.contextPath}/view/category/mainpage.jsp">
			<img
			src="${pageContext.request.contextPath}/common/img/kic_project_top_img_last.png"
			style="width:100%; height:21rem">
		</a>
	</div>
	<!-- 로고 및 index이동   끝-->

	<!-- 회원가입 로그인 마이페이지 시작 -->
	<div
		style="font-size: 1rem; color: gray; text-align: right; ">

		<a href="${pageContext.request.contextPath}/view/member/joinForm.jsp">회원가입</a>&nbsp;|&nbsp;
		<a href="${pageContext.request.contextPath}/view/member/loginForm.jsp">로그인</a>&nbsp;|&nbsp;
		<a href="${pageContext.request.contextPath}/view/member/myaccount.jsp">마이페이지</a>

	</div>
	<br>
	<!-- 회원가입 로그인 마이페이지  끝  -->




	<!-- 메뉴바  -->

		<div class="w3-bar w3-sand w3-middle">
			<a
				href="${pageContext.request.contextPath}/view/category/mainpage.jsp"
				class="w3-bar-item w3-button">HOME</a>

			<div class="w3-dropdown-hover">
				<button class="w3-button  w3-sand">
					<a href="${pageContext.request.contextPath}/view/category/categoryMain2.jsp">카테고리</a>
				</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
					<a
						href="${pageContext.request.contextPath}/view/category/bakeryMain.jsp"
						class="w3-bar-item w3-button">디저트</a> <a
						href="${pageContext.request.contextPath}/view/category/drinkMain.jsp"
						class="w3-bar-item w3-button">음료</a>
				</div>
			</div>


			<div class="w3-dropdown-hover">
				<button class="w3-button  w3-sand">주문조회</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
					<a
						href="${pageContext.request.contextPath}/view/bas_pay/basket.jsp"
						class="w3-bar-item w3-button">장바구니</a> <a href="#"
						class="w3-bar-item w3-button">결제란</a>
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