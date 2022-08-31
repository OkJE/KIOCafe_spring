<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Swiper demo</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

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
	text-align: center;
}

.line {
	border: 0.3rem solid;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	width: 10rem;
	margin: auto;
	margin-bottom: 6rem;
}

.swiper {
	/*  width: 85%;
        height: 70%; */
	margin-left: auto;
	margin-right: auto;
	margin-bottom: -15rem;
	margin-top: 2rem;
	width: 80%;
	height: 70%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	height: calc(( 80% - 60px)/2) !important;
	width: calc(( 70% - 40px)/4) !important;
	margin-bottom: 4rem;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide>img {
	width: 100%;
	height: 100%;
	border-radius: 10%;
	position: relative;
}

table {
	margin: 0.6rem auto;
}

td>img {
	width: 20%;
	padding-left: 6rem;
}

.swiper-button-next {
	margin-right: 2rem;
	display: flex;
}

.swiper-button-prev {
	margin-left: 2rem;
	display: flex;
}

.border_space {
	margin-top: 18rem;
}
</style>

</head>

<body>
<!-- 	<div class="border_space"></div> -->
<br>
	<h1>이달의 추천 메뉴</h1>
	<div class="line"></div>

	<!-- Swiper -->
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 1</td>

						<td rowspan="2">&nbsp;&nbsp;<img alt="#" src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink2.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink3.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink4.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink5.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink6.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink7.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink2.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink3.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink4.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink5.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink6.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

		</div>
		<div class="swiper-pagination"></div>
	</div>
<!-- 	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div> -->



	<!-- ------------------------------------------------ -->


	<!-- Swiper -->
	<br>
	<br>
	<div class="border_space"></div>
	<div class="swiper mySwiper">
		<h1>디저트메뉴</h1>
		<div class="line"></div>
		<div class="swiper-wrapper">

			<div class="swiper-slide">
				<img alt="#" src="./img/2.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 1</td>

						<td rowspan="2">&nbsp;&nbsp;<img alt="#" src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/1.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/3.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/4.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/5.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/6.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/7.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/1.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/2.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/3.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/3.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/3.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/3.png">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

		</div>
		<div class="swiper-pagination"></div>
	</div>
<!-- 	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div> -->


	<!-- ------------------------------------------------ -->
	<br>
	<br>
	<div class="border_space"></div>
	<h1>드링크 메뉴</h1>
	<div class="line"></div>
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 1</td>

						<td rowspan="2">&nbsp;&nbsp;<img alt="#" src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink2.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink3.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

			<div class="swiper-slide">
				<img alt="#" src="./img/drink1.jpg">
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="w3-teal">Slide 2</td>

						<td rowspan="2">&nbsp;&nbsp;&nbsp;<img alt="#"
							src="./img/Buy.png"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>30,000원</td>

					</tr>
				</table>
			</div>

		</div>
		<div class="swiper-pagination"></div>
	</div>
<!-- 	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div> -->



	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 5,
			grid : {
				rows : 2,
			},
			spaceBetween : 40,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
		});

		var swiper = new Swiper(".mySwiper2", {
			slidesPerView : 5,
			grid : {
				rows : 2,
			},
			spaceBetween : 40,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
		});
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
</body>

</html>
