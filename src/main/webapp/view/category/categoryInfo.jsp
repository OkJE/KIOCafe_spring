<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
	
</script>
</head>

<body>

	<br>
	<br>
	<br>
	<h3 class="w3-center">제품 정보</h3>
	<br>
	<br>

	<div class="w3-center" style="margin-bottom: 40px;">
		<img
			src="${pageContext.request.contextPath}/view/category/img/${category.cpicture}"
			width="600" height="400" id="pic"><br> <br>

	</div>

	<table class="w3-center"
		style="background-color: #fff; color: #000; width: 700px; margin: auto;">
		<tbody>

				<td>상품코드</td>
				<td>
					<p>${category.cnum}</p>
				</td>
			</tr>
			<tr>
				<td>상품분류</td>
				<td><c:if test="${category.cmenu==1}">
					디저트
				</c:if> <c:if test="${category.cmenu==2}">
					음료
				</c:if></td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td>
					<p>${category.cname}</p>
				</td>
			</tr>
			<tr>
				<td>상품수량</td>
				<td>
					<p>${category.cqty}&nbsp;개</p>
				</td>
			</tr>
			<tr>
				<td>개당가격</td>
				<td>
					<p>${category.cprice}&nbsp;원</p>
				</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>
					<p>${category.ctext}</p>
				</td>
			</tr>
		</tbody>

	</table>
	<!-- 테스트용 코드 -->
	<!--  -->
	<!--  -->
	<!--  -->

<%-- 
	<form class="w3-container"
		action="${pageContext.request.contextPath}/cart/cartPro" name="f"
		method="post" onsubmit="return inputCheck(this)">
		<input type="hidden" name="cpicture">
		<h3 class="w3-center">빵 등록</h3>
		<br> <br>

		<div class="w3-center">
			<img src="" width="600" height="400" id="pic"><br> <br>
			<a class="w3-button w3-green" href="javascript:win_upload()">사진등록</a>
		</div>
		<br>

		<table class="w3-table w3-bordered"
			style="background-color: #fff; color: #000; width: 700px; margin: auto;">
			<tbody>
				<tr>
					<td>빵코드 cnum DNUM</td>
					<td>
						<p>${category.cnum}</p> <input hidden value="${category.cnum}"
						name="dnum">
					</td>
				</tr>
				<tr>
					<td>빵이름 cprice DNAME</td>
					<td>
						<p>${category.cname}</p> <input hidden value="${category.cname}"
						name="dname">
					</td>
				</tr>

				<tr>
					<td>빵가격 cprice DPRICE</td>
					<td>
						<p>${category.cprice}</p> <input hidden value="${category.cprice}"
						name="dprice">
					</td>
				</tr>
				<tr>
					<td>빵 개수 DQTY</td>
					<td>
						<p>${category.cqty}</p> <input hidden value="${category.cqty}"
						name="dqty">
					</td>
				</tr>
				<tr>
					<td>총합 DTOTAL</td>
					<td>
						<p>3000</p> <input hidden value="3000" name="dtotal">
					</td>
				</tr>
				<tr>
					<td>빵사진 DPICTURE</td>
					<td>
						<p>${category.cpicture}</p> <input hidden
						value="${category.cpicture}" name="dpicture">
					</td>
				</tr>
				<tr>
					<td>유저 아이디 DID</td>
					<td>
						<p>1</p> <input hidden value="1" name="did">
					</td>
				</tr>

			</tbody>


		</table>
		<br>
		<div class="w3-center">

			<!--  <a href="${pageContext.request.contextPath}/view/category/mainpage.jsp">-->
			<input type="submit" class="w3-button w3-light-grey" value="제품 담기">
		</div>
		</tbody>
	</form>
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- 테스트용 코드 -->

 --%>
</body>

</html>