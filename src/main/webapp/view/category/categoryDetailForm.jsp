<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>CategoryDetailForm</title>
        <script>
            $(document).ready(function () {
                /* 		alert("hi"); */
                let cntA = 0;
                let maxQty = ${category.cqty};
                let cntC = 0;
                let allPrice = 0;
                $('.plusA-btn').click(function () {
                	if(cntA<maxQty){
                    cntA++;} else {
                        alert("그만올리라우");}
                    $(".productA-cnt-p").html(cntA);
                    allPrice = cntA * ${category.cprice} + "원";
                    $(".productATotalPrice").html(cntA * ${category.cprice}  + "원");
                    $(".allPrice").html(allPrice);
                    console.log("hi");
                    console.log(cntA);
                })
                $('.minusA-btn').click(function () {
                    if (cntA != 0) {
                        cntA--;
                        $(".productA-cnt-p").html(cntA);
                        console.log(cntA);
                        $(".productATotalPrice").html(cntA * ${category.cprice} + "원");
                        allPrice = cntA * ${category.cprice};
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


        <form method="post" name="form">

            <div class="w3-container w3-content w3-center w3-padding-64 w3-white" style="max-width: 1580px">
                <div style="font-family: sans-serif">
                    <div class="w3-row w3-stretch">
                        <div class="w3-half w3-padding-large w3-hide-small">
                            <ul class="detailImg">

                                <img src="${pageContext.request.contextPath}/view/category/img/${category.cpicture}"
                                    class="w3-round w3-image" alt="Table" width="600">
                                <input hidden value="${category.cpicture}" name="dpicture">
                                <input hidden value="1" name="did">
                            </ul>

                            <ul class="thmb_1st">
                                <span class="thmb"> <img
                                        src="${pageContext.request.contextPath}/view/category/img/${category.cpicture}"
                                        class="w3-round testsm  w3-opacity-min" border="1" width="70"></a>
                                </span>
                                <span class="thmb"> <img
                                        src="${pageContext.request.contextPath}/view/category/img/${category.cpicture}"
                                        class="w3-round testsm  w3-opacity-min" border="1" width="70"></a>
                                </span>
                            </ul>

                        </div>

                        <div class="w3-half w3-padding-large">
                            <div class="prod-name">
                                <h2 class="tbl-text w3-left-align">${category.cname}</h2>
                                <input hidden value="${category.cname}" name="dname">
                            </div>

                            <div class="prod-text">
                                <h3 class="tbl-text w3-left-align"
                                    style="font-size: 0.9rem; line-height:1.2rem; font-weight: bold; padding-top: 0.6rem;">
                                    딸기가 살아있는 아주 상콤하고 달콤한 마카롱 <br>
                                    지친 오후의 한입 사이즈 간식 </h3>
                            </div>

                            <div class="prod-price">
                                <h1 class="tbl-text w3-border-bottom w3-border-light-gray w3-left-align">
                                    ${category.cprice}원</h1>
                                <input hidden value="${category.cprice}" name="dprice">
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
                                            <td>${category.cnum}</td>
                                            <input hidden value="${category.cnum}" name="dnum">
                                        </tr>

                                        <tr>
                                            <th>제조사/공급사</th>
                                            <td>kio bakery/kio</td>
                                        </tr>

                                        <tr>
                                            <th>배송비</th>
                                            <td>무료배송</td>
                                        </tr>


                                    </tbody>

                                </table>
                            </div>

                            <br>
                            <div class="w3-border-bottom w3-border-gray"></div>

                        </div>


                        <div class="w3-half w3-padding-large">
                            <table class=" w3-left-align" style="font-size: 25px; font-weight: bold; ">
                                <tr>
                                    <th>수량</th>
                                    <input hidden value="${category.cqty}" name="dqty">
                                    <input hidden value="3000" name="dtotal">
                                    <td class="btn-td">
                                        <button type="button" class="w3-button w3-white minusA-btn  count-btn"
                                            style=" border: 1px black solid ; border-radius: 8px;">
                                            <span>-</span>
                                        </button>

                                    </td>

                                    <td class="count productA-cnt-p" style="padding-right: 10px; padding-left: 10px;">0
                                    </td>
                                    <td class="btn-td">
                                        <button type="button" class="w3-button w3-white plusA-btn  count-btn"
                                            style=" border: 1px black solid; border-radius: 8px;">

                                            <span>+</span>
                                        </button>
                                    </td>
                                </tr>


                                <tr>
                                    <th class="tbl-text w3-left-align" style="padding-top: 10px;">총 상품 금액</th>
                                    <td class="productATotalPrice" style="padding-left: 1rem;">0</td>
                                </tr>
                            </table>
                        </div>


                        <br>
                        <div class="w3-half w3-padding-large btn-group">

                            <input type="submit" class="btn btn-block btn-lg btn-outline-danger"
                                style="cursor:pointer; margin: 0px; background-color: white; - -bs-btn-padding-y: .25rem;  margin-right: 1rem;"
                                value="장바구니"
                                onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartPro/';" />

                            <input type="submit" class="btn btn-block btn-lg btn-outline-danger"
                                style="cursor:pointer; margin: 0px; background-color: #F9BFAB; - -bs-btn-padding-y: .25rem; margin-right: 1rem; value="
                                결제"
                                onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartPro1/';" />



                        </div>
                    </div>
                </div>
            </div>

            <!--  -->
            <!--  -->
            <!--  -->


            <div class="w3-row w3-stretch">
                <div class="w3-padding-large w3-hide-small">
                    <div class="w3-container w3-content w3-center w3-padding-64" style="max-width: 1400px">

                        <div id="navbar">
                            <a href="#productDetail">상세설명</a> <a href="#review">리뷰</a> <a href="#qna">QnA</a>
                        </div>

                        <!-- 상세설명 페이지 -->
                        <div class="w3-container w3-content w3-center w3-padding-64" style="max-width: 1400px"
                            id="productDetail">
                            <img src="img/detailimgEx.jpg" class="w3-center" alt="Table" width="1100px">
                        </div>
                        <!-- 리뷰 페이지 -->
                        <div class="w3-container w3-content w3-center w3-padding-64" style="max-width: 1100px"
                            id="review">
                            <h3 class="w3-center">리뷰</h3>
                            <p>등록 된 리뷰가 없습니다</p>
                            <a class="w3-button w3-right" style="background-color: #f9bfab;" href="#">리뷰 남기기</a>
                        </div>
                        <!-- QnA 페이지 -->
                        <div class="mainBody w3-white" id="qna">
                            <div class="w3-container w3-content w3-center w3-padding-64" style="max-width: 1100px"
                                id="qna">
                                <h3 class="w3-center">QnA</h3>
                                <p>등록 된 게시물이 없습니다!</p>
                                <a class="w3-button w3-right" style="background-color: #f9bfab;" href="#">질문하기</a>

                            </div>
                        </div>
                        <!-- 맨 위로 버튼 -->
                        <div class="w3-container w3-content w3-center w3-padding-64" style="max-width: 800px" id="top">
                        </div>
                        <a class="w3-button w3-right" style="background-color: #f9bfab;" href="#">맨 위로가기</a>
                    </div>
                </div>
                <div></div>
            </div>
        </form>
    </body>

    </html>