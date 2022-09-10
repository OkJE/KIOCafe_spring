
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/view/cart/css/cartlist.css">

<title>Document</title>

<script defer>
	function getClickIdFunc(id) {
		let sendId = 0; // 001, 002 같은 id 담을 변수
		// 클릭한 id값이 plus/minus 인지 구별
		if (id.includes("plus")) {
			sendId = id.substr(4);
			plusQtxFunc(sendId);
		}
		if (id.includes("minus")) {
			sendId = id.substr(5);
			minusQtxFunc(sendId);
		}
	}

	function plusQtxFunc(id) {
		let price = $("#price" + id).text();
		let qtx = $("#qtx" + id).text();
		$("#qtx" + id).text(parseInt(qtx) + 1);
		$("#qtx" + id).val(parseInt(qtx) + 1);
		console.log("qtx " + id);
		let nowQtx = $("#qtx" + id).text();
		priceMulFunc(id, price, nowQtx);
		checkBoxValueOnOff(id);
		allPriceSum();
	}

	function minusQtxFunc(id) {
		let price = $("#price" + id).text();
		let qtx = $("#qtx" + id).text();
		if (qtx != 0) {
			$("#qtx" + id).text(parseInt(qtx) - 1);
			$("#qtx" + id).val(parseInt(qtx) - 1);
			let nowQtx = $("#qtx" + id).text();
			priceMulFunc(id, price, nowQtx);
			checkBoxValueOnOff(id);
			allPriceSum();
		}
	}

	function priceMulFunc(id, price, qtx) {
		$("#priceMul" + id).text(parseInt(price) * parseInt(qtx));

		$('#qtx').val(parseInt(qtx));
		/* console.log ("priceMul : "  + $("#priceMul" + id).text()); */
	}

	function allPriceSum() {

		let totalPrice = document.getElementsByName("dtotal");
		let priceSumResult = 0;

		for (let i = 0; i < totalPrice.length; i++) {
			console.log("dtotal : [" + i + " ]"
					+ document.getElementsByName("dtotal")[i].value);
			if (document.getElementsByName("dtotal")[i].value == "") {
				priceSumResult += 0;
			} else {
				priceSumResult += parseInt(document.getElementsByName("dtotal")[i].value);
			}

		}
		console.log("priceSumResult :  " + priceSumResult)
		$("#allPrice").text(priceSumResult);
	}

	/*  */
	/*  */
	/*  */

	function checkBoxValueOnOff(id) {
		console.log(" checkBoxValueOnOff ");

		let chBoxCheckState = document.getElementById(id);
		let chQtx = $("#qtx" + id).val()

		console.log(" dtotal.val(); : " + $("#dtotalInput" + id).val());
		if (chBoxCheckState.checked == true) {
			chBoxCheckState.value = id;

			console.log("price Mul : " + $("#priceMul" + id).val());

			$("#dtotalInput" + id).val($("#priceMul" + id).text());
			$("#qtxInput" + id).val($("#qtx" + id).text());

		} else {
			console.log(chQtx);
			chBoxCheckState.value = "";
			$("#qtxInput" + id).val("");
			$("#dtotalInput" + id).val("");
		}

		allPriceSum();
	}

	function checkAll() {
		let allCheck = document.getElementById("allCheck");
		let checkBoxAll = document.getElementsByName("did");

		if (allCheck.checked == true) {
			for (let i = 0; i < checkBoxAll.length; i++) {
				checkBoxAll[i].checked = true;
				checkBoxValueOnOff(checkBoxAll[i].getAttribute("id"));
			}

		} else {
			for (let i = 0; i < checkBoxAll.length; i++) {
				checkBoxAll[i].checked = false;
				checkBoxValueOnOff(checkBoxAll[i].getAttribute("id"));
			}
		}
	}

	// ctx001 상품 개수, price001 상품 가격, priceMul001 1상품 합계

	// this.id를 이용해 클릭한 id값 id에 담아주는 함수

	jQuery(document).ready(function() {

		let totalPrice = document.getElementsByName("0");
		let priceSumResult = 0;
		/* 
		 for (let i = 0; i < totalPrice.length; i++) {
		     priceSumResult += parseInt(totalPrice[i].innerHTML);
		 }
		 $("#allPrice").text(priceSumResult);
		 */

	});
	$(document).ready(function() {

	})
</script> 
</head>

<body>


	<form method="post" name="form">

		<div style="width: 80%; margin: auto;">
			<div class="w3-bar w3-middle">

				<section>
					<h4 style="margin-top: 15px;">빵바구니</h4>
				</section>

				<div style="display: flex; justify-content: space-between;">

					<!-- <div>
						<span>전체선택</span> <input type="checkbox" id="allCheck"
							class="w3-check" onclick="checkAll()">
					</div> -->

				</div>
				<table class="w3-table w3-bordered"
					style="width: 95%; margin-left: 30px;">
					<!--  -->
					<thead>
						<tr>
							<th scope="col"
								style="text-align: center; vertical-align: middle;">
								<div>
									<span>전체선택</span> <input type="checkbox" id="allCheck"
										class="w3-check" onclick="checkAll()">
								</div>
							</th>
							<th scope="col"
								style="text-align: center; vertical-align: middle;">제품코드</th>
							<th scope="col"
								style="text-align: center; vertical-align: middle;">제품명</th>
							<th scope="col"
								style="text-align: center; vertical-align: middle;">제품</th>
							<th scope="col"
								style="text-align: center; vertical-align: middle;">개당가격</th>
							<th scope="col"
								style="text-align: center; vertical-align: middle;">구매수량</th>
							<th scope="col"
								style="text-align: center; vertical-align: middle;">구매가격</th>
						</tr>
					</thead>
					<!--  -->
					<tbody style="text-align: center; vertical-align: middle;">
						<c:forEach var="c" items="${list }">

							<tr>
								<td style="text-align: center; vertical-align: middle;"><span>
										<input type="checkbox" class="w3-check" id="${c.dnum}"
										value="" name="did" onclick="checkBoxValueOnOff(this.id)">
								</span></td>



								<td style="text-align: center; vertical-align: middle;"><span>${c.dnum }</span></td>
								<td style="text-align: center; vertical-align: middle;"><span>${c.dname }</span></td>

								<td style="text-align: center; vertical-align: middle;"><img
									src="<%=request.getContextPath()%>/view/cart/img/${c.dpicture}"
									alt=""></td>

								<td style="text-align: center; vertical-align: middle;"><span
									id="price${c.dnum}">${c.dprice }</span></td>
								<!--  -->


								<td class="btn-td"
									style="text-align: center; vertical-align: middle;"><span
									style="text-align: center; vertical-align: middle;">
										<button type="button"
											class="w3-button w3-white minusA-btn  count-btn"
											id="minus${c.dnum}" onclick="getClickIdFunc(this.id)"
											style="border: 1px black solid; border-radius: 8px;">
											<span>-</span>
										</button> <span class="count productA-cnt-p" style="text-align: center"
										id="qtx${c.dnum }">${c.dqty }</span> <input type="hidden"
										id="qtxInput${c.dnum}" value="" name="dqty">

										<button type="button"
											class="w3-button w3-white plusA-btn   count-btn"
											id="plus${c.dnum}" onclick="getClickIdFunc(this.id)"
											style="border: 1px black solid; border-radius: 8px;">
											<span>+</span>
										</button>
								</span></td>
								<!--  -->
								<td style="text-align: center; vertical-align: middle;"><span
									class="productATotalPrice" id="priceMul${c.dnum}">${c.dtotal}</span>
									<input type="hidden" id="dtotalInput${c.dnum}" value=""
									name="dtotal"></td>

							</tr>

						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		<div>
			<div class="pay-div">
				<h4 class="pay-p allPrice">
					상품금액 : <span id="allPrice">0</span>
				</h4>
				<div style="text-align: center; vertical-align: middle;">

					<input type="hidden" id="${c.dpay }" value="0" name="dpay">


					<input class="pay-btn" type="submit" value="삭제"
						onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartDelete';" />

					<input class="pay-btn" type="submit" value="결제"
						onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartUpdatePro';" />


				</div>
			</div>

		</div>



	</form>

</body>




</html>