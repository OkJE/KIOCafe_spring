
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
	<br>
	<div class="w3-container w3-center" style="width: 90%; margin: auto;">
		<h2>주문현황</h2>



		<table class="w3-table w3-bordered w3-hoverable">
			<tbody>
				<tr>
					<th>날짜</th>
				</tr>
			</tbody>
			<tbody>

				<tr>
					<th>상품코드</th>
					<th>상품이름</th>
					<th>구매수량</th>
					<th>상품가격</th>
					<th>총가격</th>
					<th>주문날짜</th>
					<th>배송현황</th>
				</tr>
			</tbody>
			<tbody>
				<c:forEach var="c" items="${list}">
					<tr>
						<td>${c.dnum }</td>
						<td>${c.dname}</td>
						<td>${c.dqty}</td>
						<td>${c.dprice}</td>
						<td>${c.dtotal}</td>
						<td>${c.orderdate}</td>
						<input type="hidden" name="orderdate" value=${c.orderdate}>
						<td>${c.delvery}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
</body>
</html>