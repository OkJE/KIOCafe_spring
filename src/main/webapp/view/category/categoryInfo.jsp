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



	<table class="w3-center"
		style="background-color: #fff; color: #000; width: 700px; margin: auto;">
		<tbody>
			<tr>
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

<br>
<br>

	<a class="w3-button w3-grey w3-center"
			href="${pageContext.request.contextPath}/category/categoryUpdateForm?cnum=${category.cnum}">게시판수정</a> &nbsp;&nbsp;&nbsp;
	<a class="w3-button w3-grey w3-center"
			href="${pageContext.request.contextPath}/category/categoryDeleteForm?cnum=${category.cnum}">게시판삭제</a> 


	</div>

</body>

</html>