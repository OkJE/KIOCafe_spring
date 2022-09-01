<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>CategoryDetailForm</title>
<script>
	$(document).ready(function() {
		/* 		alert("hi"); */
		let cntA = 0;
		let cntB = 0;
		let cntC = 0;
		let allPrice = 0;

		$('.plusA-btn').click(function() {
			cntA++;
			$(".productA-cnt-p").html(cntA);
			allPrice = cntA * 1000 + "원";

			$(".productATotalPrice").html(cntA * 1000 + "원");
			$(".allPrice").html(allPrice);

			console.log("hi");
			console.log(cntA);
		})
		$('.minusA-btn').click(function() {
			if (cntA != 0) {
				cntA--;
				$(".productA-cnt-p").html(cntA);
				console.log(cntA);

				$(".productATotalPrice").html(cntA * 1000 + "원");
				allPrice = cntA * 1000;
				$(".allPrice").html(allPrice);
			}
		})
	});

	console.log("hi");
</script>
<style>
#navbar {
	overflow: hidden;
	background-color: #FCE7E2;
	positon: fixed;
	top: 0;
	width: 100%;
}

#navbar a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
	width: 33.33%
}

#navbar a:hover {
	background-color: #F9BFAB;
	color: #FEFAF9;
}

#navbar a.active {
	background-color: teal;
	color: white;
}

.length {
	position: relative;
	width: 50px;
	height: 32px;
	border: 1px;
}
</style>
</head>

<body>
	<div class="w3-container w3-content w3-center w3-padding-64 w3-white"
		style="max-width: 1580px">
		<div style="font-family: sans-serif">
			<div class="w3-row w3-stretch">
				<div class="w3-half w3-padding-large w3-hide-small">

					<ul class="detailImg">
						<img src="img/stmac.png" class="w3-round w3-image" alt="Table"
							width="600">
					</ul>

					<ul class="thmb_1st">
						<span class="thmb"> <img src="img/stmac.png"
							class="w3-round testsm  w3-opacity-min" border="1" width="70"></a>
						</span>
						<span class="thmb"> <img src="img/stmac.png"
							class="w3-round testsm  w3-opacity-min" border="1" width="70"></a>
						</span>
					</ul>

				</div>

				<div class="w3-half w3-padding-large">
					<div class="prod-name">
						<h2 class="tbl-text w3-left-align">kio bakery 딸기 마카롱</h2>
					</div>

					<div class="prod-price">
						<h1
							class="tbl-text w3-border-bottom w3-border-light-gray w3-left-align">1,000원</h1>
					</div>
					<br>
					<div class="table-prod-info">
						<table class="table-row">
							<colgroup>
								<col style="width: 180px;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="pro-code">상품코드</th>
									<td>1234567</td>
								</tr>

								<tr>
									<th>제조사/공급사</th>
									<td>kio bakery/kio</td>
								</tr>

								<tr>
									<th>배송비</th>
									<td>무료배송</td>
								</tr>
								<tr>
									<th>구매수량</th>
									<td>
									<td class="btn-td" style="text-align: left;">
										<button class="w3-button w3-white minusA-btn  count-btn"
											style="border: 1px black solid; border-radius: 8px;">
											<span>-</span>
										</button>
									</td>
									<td class="count productA-cnt-p">0</td>
									<td class="btn-td" style="text-align: left;">
										<button class="w3-button w3-white plusA-btn  count-btn"
											style="border: 1px black solid; border-radius: 8px;">
											<span>+</span>
										</button>
									</td>
								</tr>

								<tr>
									<th>총 상품 금액</th>
									<td class="productATotalPrice">0</td>
								</tr>
							</tbody>
						</table>
					</div>

					<br>
					<div class="w3-border-bottom w3-border-gray"></div>

				</div>

				<br>
				<div class="w3-half w3-padding-large">
					<button href="#a" type="button"
						class="btn btn-block btn-lg btn-outline-danger"
						style="background-color: white; - -bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;">장바구니</button>
					<button href="#a" type="button"
						class="btn btn-block btn-lg btn-outline-danger"
						style="background-color: #F9BFAB; - -bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;">구매하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="w3-row w3-stretch">
		<div class="w3-padding-large w3-hide-small">
			<div class="w3-container w3-content w3-center w3-padding-64"
				style="max-width: 1400px">

				<div id="navbar">
					<a href="#productDetail">상세설명</a> <a href="#review">리뷰</a> <a
						href="#qna">QnA</a>
				</div>

				<!-- 상세설명 페이지 -->
				<div class="w3-container w3-content w3-center w3-padding-64"
					style="max-width: 1400px" id="productDetail">
					<img src="img/detailimgEx.jpg" class="w3-center" alt="Table"
						width="1100px">
				</div>
				<!-- 리뷰 페이지 -->
				<div class="w3-container w3-content w3-center w3-padding-64"
					style="max-width: 1100px" id="review">
					<h3 class="w3-center">리뷰</h3>
					<p>등록 된 리뷰가 없습니다</p>
					<a class="w3-button w3-right" style="background-color: #f9bfab;"
						href="#">리뷰 남기기</a>
				</div>
				<!-- QnA 페이지 -->
				<div class="mainBody w3-white" id="qna">
					<div class="w3-container w3-content w3-center w3-padding-64"
						style="max-width: 1100px" id="qna">
						<h3 class="w3-center">QnA</h3>
						<p>등록 된 게시물이 없습니다!</p>
						<a class="w3-button w3-right" style="background-color: #f9bfab;"
							href="#">질문하기</a>

					</div>
				</div>
				<!-- 맨 위로 버튼 -->
				<div class="w3-container w3-content w3-center w3-padding-64"
					style="max-width: 800px" id="top"></div>
				<a class="w3-button w3-right" style="background-color: #f9bfab;"
					href="#">맨 위로가기</a>
			</div>
		</div>
		<div></div>
	</div>
</body>
</html>