
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Swiper demo</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
/>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: white;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 20px;
	padding: 0 20px;
	
}

h1 {
	padding-top:5rem;
	text-align: center;
}

.line {
	border: 0.3rem solid;
	border-color:#F9BFAB;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	width: 10rem;
	margin: auto;
	margin-bottom: 6rem;
}

.product-container-div {
	padding: 0px 12px 60px 12px;
}

.product-div {
	border: 1px solid #e2e2e2;
	border-radius: 8px;
}

.product-div>img {
	width: 100%;
}

table {
	margin: 0.6rem auto;
}
.title{
	border-color: #FCE7E2;
}

td>img {
	width: 25%;
	padding-left: 6rem;
	object-fit: contain;
}

.border_space {
	margin-top: 18rem;
}

.flex-div {
	display: flex;
	width: 1200px;
	margin: auto;
	flex-wrap: wrap;
}
</style>
</head>

<body>




	<!--  -->
	<!--  -->
	<!--  -->
	<div style="width: 80%; margin: auto;">
		<h1 class="line">마카롱</h1>
		<!--  -->

		<div class="flex-div">

			<c:forEach var="index" begin="1" end="8">
				<div class="product-container-div" style="width: 25%">


					<div class=" product-div" style="width: 100%;">
						<img alt="#" src="./img/chemac.png">
					</div>
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td style="background-color: #FCE7E2 ;"> Slide 1</td>
							<td rowspan="2">&nbsp;&nbsp;<img alt="#" src="img/Buy.png"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td style="width: 6rem">30,000원</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			</div>
			
			
			<h1 class="line">빵</h1>
			
			<div class="flex-div">
			<c:forEach var="index" begin="1" end="8">
				<div class="product-container-div" style="width: 25%">


					<div class=" product-div" style="width: 100%;">
						<img alt="#" src="./img/bread1.png">
					</div>
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td style="background-color: #FCE7E2 ;"> Slide 1</td>
							<td rowspan="2">&nbsp;&nbsp;<img alt="#" src="img/Buy.png"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td style="width: 6rem">30,000원</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			</div>
			
			<h1 class="line">빵</h1>
			
			<div class="flex-div">
			<c:forEach var="index" begin="1" end="8">
				<div class="product-container-div" style="width: 25%">


					<div class=" product-div" style="width: 100%;">
						<img alt="#" src="./img/bread1.png">
					</div>
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td style="background-color: #FCE7E2 ;"> Slide 1</td>
							<td rowspan="2">&nbsp;&nbsp;<img alt="#" src="img/Buy.png"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td style="width: 6rem">30,000원</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			
		</div>
	
	<!--  -->
	<!--  -->
	<!--  -->





</body>

</html>