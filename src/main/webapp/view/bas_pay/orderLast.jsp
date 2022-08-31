<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>t</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>

        let state = 0;
        function openAddressModal() {
            let a = document.querySelector(".myaddress-modal");
            if (state == 0) {
                a.style.display = "block"
                state = 1;
                console.log(state);
            }
            else if (state == 1) {
                a.style.display = "none"
                state = 0;
                console.log(state);
            }
        }

        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

                    // console.log(data.buildingName);

                    if (data.bname !== '' && /[동|로|가]$/g.order - (data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    console.log(data);
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    let inputAddress = "";
                    inputAddress = data.roadAddress;
                    if (data.buildingName) {
                        inputAddress = data.roadAddress + " (" + data.buildingName + ")"
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // 우편번호
                    document.getElementById("addressInput1").value = data.zonecode;
                    document.getElementById('addressInput2').value = inputAddress;



                }
            }).open();
        }
    </script>

    <style>
        body {
            margin: 0;
        }

        html {
            line-height: 1.15;
            /*기본 행간 높이*/
        }

        * {
            box-sizing: border-box;
        }

        .center {
            display: block;
            margin: auto;
            width: 100%;
            text-align: center;
        }

        table {
            width: 100%;
        }

        div {
            box-sizing: border-box;
        }

        .order-table {
            margin-bottom: 40px;
        }

        .order-table>thead {
            padding: 21px 0;
            border-left: 1px solid #eaeaea;
            background: #b5babd;
            color: #fff;
            font-weight: bold;
            text-align: center;
        }

        .product td:nth-child(n+2) {
            padding: 23px 0;
            border-left: 1px solid #eaeaea;
            border-bottom: 1px solid #eaeaea;
            background: #fcfcfb;
            text-align: center;
        }

        .product td {
            padding: 23px 0;
        }

        th {
            padding: 21px 0;
            border-left: 1px solid #eaeaea;
            background: #b5babd;
            color: #fff;
            font-weight: bold;
        }


        td {
            border-left: 1px solid #eaeaea;
            border-bottom: 1px solid #eaeaea;
            background: #fcfcfb;
        }

        img {
            float: left;
            width: 100px;
            padding-left: 20px;
            margin-right: 20px;
        }

        .txt {
            padding-left: 0px;
            padding-right: 160px;
            font-weight: 500;
            line-height: 22px;
        }

        .cont_title01 {
            margin-top: 20px;
            padding: 10px;
            font-size: 20px;
            line-height: 38px;
            font-weight: bold;
            text-align: left;
        }

        .orderPrice {
            font-size: 15px;
            margin-top: 10px;
            margin-left: 0em;
            background-color: #fdfdf8;
            display: flex;
            justify-content: space-between;
        }

        .orderPrice>div:nth-child(-n+3) {
            border-top: black solid 1px;
            border-bottom: #d9d9d9 solid 1px;

            min-width: 326px;
            height: 84px;
        }

        .orderPrice>div:nth-child(2) {
            /* border-left: 1px solid #d9d9d9;
            border-right: 1px solid #d9d9d9; */
            outline: 1px black;
        }

        .orderPrice-head>div>button {
            width: 55px;
            background-color: black;
        }

        .orderPrice-middle {

            display: inline-flex;
            justify-content: space-around;

        }

        .orderPrice-middle>div>button {
            padding: 0px;
            margin-left: 10px;
        }

        .cart_total {
            display: table;
            table-layout: fixed;
            width: 100%;
            margin-top: 40px;
            border-top: 1px solid #b5babd;

        }

        .board_write {

            color: black;
            border-top: 1px solid #d9d9d9;
            font-size: 15px;
            line-height: 20px;
            text-align: left;
            box-sizing: border-box;
            border-right: 1px solid #d9d9d9;
        }

        .board_write th {
            color: black;
            padding: 15px 35px;
            background-color: #E5E4E4;


        }

        input.text {
            padding: 0 10px;
            margin: 15px 15px;
            border: 1px solid #c4c4c4;
            font-size: 15px;
            line-height: 33px;
            box-sizing: border-box;
        }

        .address-input {
            padding-top: 10px;
            padding-bottom: 15px;
        }

        .address-input>div>input {
            margin: 5px 0px 0px 15px;
        }

        .btn1 {
            border: 0px;
            width: 120px;
            height: 35px;
            background-color: #92979b;
            color: white;
        }

        .order-div1 {
            background-color: #fdfdf8;
            width: 100%;
            height: 320px;
            margin: auto;
            display: flex;
            justify-content: space-between;
            margin: auto;
            border-top: #d9d9d9 1px solid;
            border-bottom: #d9d9d9 1px solid;
        }

        .order-div2>.head-box {
            outline: 1px #d9d9d9 solid;
        }

        .space-between {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            margin-bottom: 10px;
            padding-left: 30px;
            padding-right: 30px;

        }

        .head-box {
            padding: 20px;
            height: 80px;
            border-top: 1px #d9d9d9 solid;
            border-bottom: 1px #d9d9d9 solid;
            display: flex;
            justify-content: space-between;
        }

        .coupton-btn {
            margin-top: 20px;

        }

        .order-div1>div {
            width: 100%;
            font-size: 15px;
        }

        .price-input {
            text-align: right;
            padding: 10px;
            width: 115px;
            height: 37px;
        }


        .order-div13 {
            background-color: #e5e4e4;
        }

        .modal {
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100vm;

            display: none;

            background-color: rgba(0, 0, 0, 0.4);
        }

        .myaddress-modal {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            position: absolute;
            top: calc(50vh - 100px);
            left: calc(50vw - 200px);
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            width: 400px;
            height: 200px;
        }
    </style>


    <script>

    </script>
</head>

<body>
    <!--  -->



    <!-- 메뉴바  끝-->
    <div class="myaddress-modal">
        <div class="modal-content">Modal 미구현 추후 사용시에 구현 예정

            <button class="" onclick="openAddressModal()">Modal none</button>
        </div>


    </div>
    <!-- 메뉴바  끝-->
    <!--  -->

    <div class="cont_title01 " style="width: 75%; margin: auto;">
        <h3>주문작성/결제</h3>
        <div class="modal">
            asdasdsda
        </div>
        <table class="order-table">
            <thead>
                <tr>
                    <th>상품명/옵션</th>
                    <th>배송수단</th>
                    <th style="width: 100px;">수량</th>
                    <th>상품가</th>
                    <th>주문금액</th>
                    <th>배송비</th>
                </tr>
            </thead>
            <tbody>
                <!--  -->
                <tr class="product">
                    <td>
                        <div>
                            <img src="./img/bread1.png">
                        </div>
                        <div class="txt">
                            <p>보문산메아리</p>
                        </div>
                    </td>
                    <td>대전배송</td>
                    <td>1</td>
                    <td>6,000원</td>
                    <td>6,000원</td>
                    <td>0원</td>
                </tr>

                <!--  -->
                <!--  -->
                <tr class="product">
                    <td>
                        <div>
                            <img src="./img/bread1.png">
                        </div>
                        <div class="txt">
                            <p>초코튀소삼형제</p>
                        </div>
                    </td>
                    <td>대전배송</td>
                    <td>1</td>
                    <td>6,000원</td>
                    <td>6,000원</td>
                    <td>0원</td>
                </tr>
                <!--  -->
            </tbody>
        </table>
        <!--  -->

        <div class="order-div1">
            <div class="order-div11">
                <div class="head-box">
                    <label for="">주문금액</label>
                    <span>16,000원</span>
                </div>
                <div>
                    <div>
                        <div class="space-between">
                            <span>쿠폰</span>
                            <span>
                                <input type="text" value="0" class="price-input" readonly="true">원
                            </span>

                        </div>
                        <div class="space-between">
                            <span>적립금</span>
                            <span>
                                <input type="text" value="0" class="price-input" readonly="true">원
                            </span>
                        </div>
                        <div class="space-between">
                            <span style="margin-right: 45px;">모바일상품권</span>
                            <span>
                                <input type="text" value="" class="price-input" placeholder="교환권 코드"
                                    style="width: 150px;" readonly="true">원
                            </span>
                        </div>

                    </div>
                </div>
            </div>
            <!--  -->
            <div class="order-div2">
                <div class="head-box">
                    <label for="">할인금액</label>
                    <span>0</span>
                </div>
                <div>
                    <button class="btn1 coupton-btn" onclick="openCoupon();">쿠폰적용</button> (
                    보유 <em>0장</em>)
                </div>
                <div>
                    <button class="btn1 coupton-btn">모두사용</button> (<em>1000p</em>)
                </div>
                <div>
                    <button class="btn1 coupton-btn">유효성 검사</button>
                </div>

            </div>
            <!--  -->
            <div class="order-div13">
                <div class="head-box">
                    <label for="">결제예정금액</label>
                    <span>0</span>
                </div>
                <div style="margin-top: 50px; padding: 36px ;">
                    <span>적립혜택</span>
                    <div class="space-between">
                        <span>적립</span>
                        <p>3,050 P</p>
                    </div>
                </div>
            </div>
        </div>


        <!--  -->


        <!--  -->
        <!--  -->
        <!--  -->
        <h3 class="cont_title01">주문하시는분 (보내시는분)</h3>
        <table class="board_write">
            <colgroup>
                <col style="width:175px">
                <col>
            </colgroup>
            <tbody>
                <tr class="bd_top">
                    <th scope="row">이름</th>
                    <td><input type="text" class="text" style="width:200px;" value="김명준">
                    </td>
                </tr>
                <tr>
                    <th scope="row">휴대폰번호</th>
                    <td>
                        <input type="text" class="text" numberonly="true" maxlength="20" value="010-2093-5924"
                            placeholder="휴대폰 입력 (숫자만)">
                    </td>
                </tr>
            </tbody>
        </table>
        <!--  -->
        <!--  -->
        <!--  -->
        <h3 class="cont_title01">받으시는분 (상품받으실분)

            <input type="checkbox"><span style="font-size:14px;">주문자 정보와 동일</span>
        </h3>

        <table class="board_write">
            <colgroup>
                <col style="width:172px">
                <col>
            </colgroup>
            <tbody>
                <tr class="bd_top">
                    <th scope="row">배송지</th>
                    <td>
                        <label for="">
                            <input type="radio" class="text" style="margin-right: 0px;">새로 입력</label>
                        <button class="btn1" style="margin-left: 10px;" onclick="openAddressModal()">나의배송지</button>
                    </td>
                </tr>
                <tr>
                    <th scope="row">받으시는분</th>
                    <td><input type="text" class="text" style="width:200px;">
                    </td>
                </tr>
                <tr>
                    <th scope="row">휴대폰번호</th>
                    <td>
                        <input type="text" id="rcvMobile" class="text" numberonly="true" maxlength="20" value=""
                            placeholder="휴대폰 입력 (숫자만)">

                    </td>
                </tr>

                <tr>
                    <th scope="row">주소</th>
                    <td class="address-input">
                        <div>


                            <input type="text" id="addressInput1" class="text" style="width:200px;">
                            <input type="button" class="btn1" onclick="sample4_execDaumPostcode()"
                                value="우편번호찾기"></input>
                        </div>
                        <div>
                            <input type="text" class="text" style="width:533px;" id="addressInput2">
                        </div>
                        <div>
                            <input type="text" class="text" style="width:533px;" id="addressInput3">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">주문시요청사항</th>
                    <td><input type="text" class="text" style="width:200px;">
                    </td>
                </tr>
                <tr>
                    <th scope="row">배송희망일</th>
                    <td>
                        <!-- <input type="text" class="text" style="width:200px;"> -->
                        <input type="date" class="text" required pattern="\d{4}-\d{2}-\d{2}">

                    </td>
                </tr>
                <tr>
                    <th scope="row">배송시간</th>
                    <td><input type="text" class="text" style="width:200px;">
                    </td>
                </tr>

            </tbody>
        </table>

        <!--  -->
        <!--  -->
        <!--  -->
        <h3 class="cont_title01">결제선택</h3>
        <table class="board_write ">
            <colgroup>
                <col style="width:172px">
                <col>
            </colgroup>
            <tbody>
                <tr class="bd_top">
                    <th scope="row">총 결제금액</th>
                    <td style="padding: 15px">
                        <span class="price">61,000 원</span>
                    </td>
                </tr>
                <tr>
                    <th scope="row">결제방법</th>
                    <td style="padding: 15px">
                        <div class="label_group">

                            <label for="pay1" class="check_label">
                                <input type="radio" class="radio" value="CARD" checked="true"> 신용카드 </label>
                            <label for="pay10" class="check_label hide">
                                <input type="radio" class="radio" value="gifty">
                                카카오 기프티콘
                            </label>
                        </div>
                    </td>
                </tr>


            </tbody>
        </table>


        <div class="center" style="margin: 30px; font-size: 12px;">
            <!-- 20181011 joonyus 조건추가-->
            <label><input type="checkbox"><span></span><i>(필수) 결제서비스 약관에 동의하며, 원활한 배송을 위한 개인정보
                    제공에
                    동의합니다.</i></label>
            <a href="javascript:;" class="openClause">[약관보기]</a>
        </div>
        <div class="center" style="margin: 30px;">
            <button class="btn1">장바구니</button>
            <button class="btn1">결제진행</button>
        </div>

    </div>


    <!--  -->
    <!--  -->
    <!--  -->
    <!--  -->

</body>

</html>