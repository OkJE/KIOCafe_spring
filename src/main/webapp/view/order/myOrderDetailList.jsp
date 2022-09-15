
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

<script>
	history.replaceState({}, numm, location.pathname);
</script>
</head>
<body>
	<br>
	<div class="w3-container w3-center" style="width: 90%; margin: auto;">
		<h2>주문상세현황</h2>

		<table class="w3-table w3-bordered w3-hoverable">

			<tbody>
				<tr>
					<th>제품번호</th>
					<th>제품명</th>
					<th>구매수량</th>
					<th>총가격</th>
				</tr>
			</tbody>
			<tbody>
				<c:forEach var="c" items="${list}">
				
					<tr>
						<td><span> ${c.dnum}</span></td>
						<td><span> ${c.dname } </span></td>
						<td><span> ${c.dqty }</span></td>
						<td><span> ${c.dprice}</span>원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>