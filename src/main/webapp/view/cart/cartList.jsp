<%@page import="java.util.List"%>
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

<title>Document</title>

<script language=javascript>
	function checkBoxValueOnOff(id) {
		let chBoxCheckState = document.getElementById(id);
		if (chBoxCheckState.checked == true) {
			chBoxCheckState.value = id;
		} else {
			chBoxCheckState.value = "";
		}
		console.log(chBoxCheckState);
		console.log(chBoxCheckState.checked);

	}

	function checkAll() {
		let allCheck = document.getElementById("allCheck");
		let checkBoxAll = document.getElementsByName("did");
		console.log(allCheck.checkd);
		if (allCheck.checked == true) {
			for (let i = 0; i < checkBoxAll.length; i++) {
				checkBoxAll[i].checked = true;
				checkBoxValueOnOff(checkBoxAll[i].getAttribute("id"));
			}
			console.log("true");
		} else {
			for (let i = 0; i < checkBoxAll.length; i++) {
				checkBoxAll[i].checked = false;
				checkBoxValueOnOff(checkBoxAll[i].getAttribute("id"));
			}
		}
	}

	let listOriginal = '${list}';
	let listSlide = listOriginal.slice(6, -1);
	let list = listSlide.replace('=', ':');

	let productList = [];

	<c:forEach var="product" items="${list}" begin="1" varStatus="status">
	productList.push("${product}");
	console.log("${product}")
	console.log("${status.index} ")
	</c:forEach>

	let resultList = [];
	let products = {};
	// let list = listSlide.replace('=', ':');

	stringToObjFunc(listOriginal);
	// console.log(list);

	function stringToObjFunc(listOriginal, listLength) {

		for (let i = 0; i < 2; i++) {
			listOriginal[i]
			let listSlide = inputString.slice(6, -1);
			let listObj = listSlide.split(',');
			for (let j = 0; j < listOriginal.length; j++) {
				listIndex = listObj[j].slice(listObj[j].indexOf('=') + 1,
						listObj[j].length);
				resultList.push(listIndex);
			}
			console.log(resultList);
			console.log(resultList[0]);
			let productNum = resultList[0];
			console.log(i);
			products = {
				productNum : resultList
			}
		}
		console.log(products);
	}

	$(document).ready(function() {
		/* 		alert("hi"); */
		let cntA = 0;
		let cntB = 0;
		let cntC = 0;
		let allPrice = 0;

		$('.plusA-btn').click(function() {
			cntA++;
			$(".productA-cnt-p").html(cntA);
			allPrice = (cntA + cntB + cntC) * 1000 + "원";

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
				allPrice = (cntA + cntB + cntC) * 1000;
				$(".allPrice").html(allPrice);
			}
		})
		// 
		$('.plusB-btn').click(function() {
			cntB++;
			$(".productB-cnt-p").html(cntB);

			$(".productBTotalPrice").html(cntB * 1000 + "원");
			allPrice = (cntA + cntB + cntC) * 1000 + "원";
			$(".allPrice").html(allPrice);
			console.log(cntB);
		})
		$('.minusB-btn').click(function() {
			if (cntB != 0) {
				cntB--;
				$(".productB-cnt-p").html(cntB);

				$(".productBTotalPrice").html(cntB * 1000 + "원");
				allPrice = (cntA + cntB + cntC) * 1000 + "원";
				$(".allPrice").html(allPrice);
				console.log(cntB);
			}
		})
		$('.plusC-btn').click(function() {
			cntC++;
			$(".productC-cnt-p").html(cntC);

			$(".productCTotalPrice").html(cntC * 1000 + "원");
			allPrice = (cntA + cntB + cntC) * 1000 + "원";
			$(".allPrice").html(allPrice);
			console.log(cntC);
		})
		$('.minusC-btn').click(function() {
			if (cntC != 0) {
				cntC--;
				$(".productC-cnt-p").html(cntC);

				$(".productCTotalPrice").html(cntC * 1000);
				allPrice = (cntA + cntB + cntC) * 1000;
				$(".allPrice").html(allPrice);
				console.log(cntC);
			}
		})

		$('.mi').click(function() {
			alert("hi");
			console.log("hi");
		})

	});
</script>
<style>
table {
	/* 	height: 200px; */
	text-align: center;
	/* margin-left: 30px; */
	min-width: 1000px;
}

th, td {
	align-items: center;
	min-width: 100px;
}

td:not(.btn-td) {
	line-height: 195px;
}

img {
	width: 150px;
	margin-top: 30px;
}

.count {
	height: 28px;
}

.count-btn {
	width: 45px;
	height: 35px;
	padding: 30px;
	padding-top: 12px;
	display: block;
	display: flex;
	align-items: center;
	margin-top: 80px;
}

.up {
	margin-right: 50px;
	background-image: url('./img/up.png');
}

.down {
	margin-right: 50px;
	background-image: url('./img/down.png');
}

.checkbox {
	position: absolute;
	bottom: 3px;
}

/*  */
.pay-div {
	width: 80%;
	margin: auto;
	display: flex;
	justify-content: end;
	border: 1px black solid;
	border-radius: 6px;
}

.pay-div>h4 {
	margin-right: 10px;
}

.pay-btn {
	float: right;
	margin: 10px;
}
</style>
</head>

<body>


	<form method="post" name="form">

		<div style="width: 80%; margin: auto;">
			<div class="w3-bar w3-middle">

				<section>
					<h4 style="margin-top: 15px;">빵바구니</h4>
				</section>

				<div style="display: flex; justify-content: space-between;">

					<div>
						<span>전체선택</span> <input type="checkbox" id="allCheck"
							class="w3-check" onclick="checkAll()">
					</div>
					<div>
						<input type="submit" value="삭제"
							onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartDelete';" />

					</div>
				</div>
				<table class="w3-table w3-bordered"
					style="width: 80%; margin-left: 30px;">
					<c:forEach var="c" items="${list }">

						<tr>
							<td>
								<p>
									<input type="checkbox" class="w3-check" id="${c.dnum}" value=""
										name="did" onclick="checkBoxValueOnOff(this.id)"> <label>${c.dname }</label>
									<input type="hidden" id="${c.dpay }" value="${c.dpay }" name="dpay">
								</p>
								<p>
							</td>

							<td><img
								src="<%=request.getContextPath()%>/view/cart/img/${c.dpicture}"
								alt=""> <!-- <img src="./img/bread2.png" alt=""> --></td>
							<td>
								<p>${c.dprice }</p>
							</td>

							<td class="btn-td" style="text-align: right;">
								<button class="w3-button w3-white minusA-btn  count-btn"
									style="border: 1px black solid; border-radius: 8px;">
									<span>-</span>
								</button>
							</td>

							<td>
								<p class="count productA-cnt-p" style="text-align: center">0개</p>
							<td class="btn-td" style="text-align: left">
								<button class="w3-button w3-white plusA-btn   count-btn"
									style="border: 1px black solid; border-radius: 8px;">
									<span>+</span>
								</button>
							</td>
							<td style="text-align: right">
								<p class="productATotalPrice">0</p>
							</td>
						</tr>

					</c:forEach>
				</table>

			</div>
		</div>
		<div>
			<div class="pay-div">
				<h4 class="pay-p allPrice">상품금액 : 0</h4>

				<div>
					<input type="submit" value="결제"
					
						onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartUpdatePro/';" />

				</div>
			</div>

			<!--                    <input type="text" class="input" value="asdasd2" name="did" placeholder="ID" required>
                    <input type="text" class="input" value="asdasd3" name="id" placeholder="ID" required> -->
		</div>



	</form>

</body>




</html>