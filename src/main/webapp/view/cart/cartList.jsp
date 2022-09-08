
    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">

                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
                    crossorigin="anonymous">
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
	                    let nowQtx = $("#qtx" + id).text();
	                    priceMulFunc(id, price, nowQtx);
	                   
	                }
	
	                function minusQtxFunc(id) {
	                    let price = $("#price" + id).text();
	                    let qtx = $("#qtx" + id).text();
	                    if (qtx != 0) {
	                        $("#qtx" + id).text(parseInt(qtx) - 1);
	                        let nowQtx = $("#qtx" + id).text();
	                        priceMulFunc(id, price, nowQtx);
		                    
	                    }
	                    
	                }
	
	       
	                function priceMulFunc(id, price, qtx) {
	                    $("#priceMul" + id).text(parseInt(price) * parseInt(qtx));
	                    allPriceSum();
	                   
	                    $('#qtx').val(parseInt(qtx));
	                    console.log ( typeof qtx );
	                }
	          	
	              function allPriceSum() {
	              	
	                  let totalPrice = document.getElementsByName("dtotal");
	                  let priceSumResult = 0;
	                 
	                  for (let i = 0; i < totalPrice.length; i++) {
	                      priceSumResult += parseInt(totalPrice[i].innerHTML);
	                  }
	                  $("#allPrice").text(priceSumResult);
	              }
	              
	              /*  */
	              /*  */
	              /*  */
               
                    function checkBoxValueOnOff(id) {
                        let chBoxCheckState = document.getElementById(id);
                        if (chBoxCheckState.checked == true) {
                            chBoxCheckState.value = id;
                        } else {
                            chBoxCheckState.value = "";
                        }
                        

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
                    
        	              
        	                  let totalPrice = document.getElementsByName("dtotal");
        	                  let priceSumResult = 0;
        	                 
        	                  for (let i = 0; i < totalPrice.length; i++) {
        	                      priceSumResult += parseInt(totalPrice[i].innerHTML);
        	                  }
        	                  $("#allPrice").text(priceSumResult);
        	     
        	              
					
					});
                    $(document).ready(function () {
                    	
                    	

                    })
                   

                </script>
                <style>
                    table {
                        /* 	height: 200px; */
                        text-align: center;
                        /* margin-left: 30px; */
                        min-width: 1000px;
                    }

                    th,
                    td {
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

                            <div style="display: flex; justify-content: space-between ;">

                                <div>
                                    <span>전체선택</span>
                                    <input type="checkbox" id="allCheck" class="w3-check" onclick="checkAll()">
                                </div>
                                <div>
                            
                                    <input type="submit" value="삭제"
                                        onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartDelete';" />

                                </div>
                            </div>
                            <table class="w3-table w3-bordered" style="width: 80%; margin-left: 30px;">
                                <c:forEach var="c" items="${list }">

                                    <tr>
                                        <td>
                                            <p>
                                                <input type="checkbox" class="w3-check" id="${c.dnum}" value=""
                                                    name="did" onclick="checkBoxValueOnOff(this.id)">
                                                    <input type="hidden" value="${c.dnum }" name="dnum">

                                                <label>${c.dname }</label>
                                            </p>
                                            <p>
                                        </td>

                                        <td>
                                            <img src="<%=request.getContextPath()%>/view/cart/img/${c.dpicture}" alt="">
                                        </td>
                                        <td>
                                            <p id="price${c.dnum}">${c.dprice }</p>
                                        </td>

                                        <td class="btn-td" style="text-align: right;">
                                            <button type="button" class="w3-button w3-white minusA-btn  count-btn"  id="minus${c.dnum}" onclick="getClickIdFunc(this.id)"
                                                style="border: 1px black solid; border-radius: 8px;">
                                                <span>-</span>
                                            </button>
                                        </td>

                                        <td>
                                            <p class="count productA-cnt-p" style="text-align: center" id="qtx${c.dnum }">${c.dqty }</p>
                                            <input type="hidden" id="qtx" value="" name="dqty">
                                          
                                        <td class="btn-td" style="text-align: left">
                                            <button type="button" class="w3-button w3-white plusA-btn   count-btn" id="plus${c.dnum}" onclick="getClickIdFunc(this.id)"
                                                style="border: 1px black solid; border-radius: 8px;">
                                                <span>+</span>
                                            </button>
                                        </td>
                                        <td style="text-align: right">
                                            <p class="productATotalPrice" id="priceMul${c.dnum}" name="dtotal">${c.dtotal}</p>
                                        </td>
                                    </tr>

                                </c:forEach>
                            </table>

                        </div>
                    </div>
                    <div>
                        <div class="pay-div">
                            <h4 class="pay-p allPrice" >상품금액 : <span id="allPrice">0</span> </h4>
                            <div>
							
						<input type="hidden" id="${c.dpay }" value="0" name="dpay">
                           
        <input type="submit" value="결제"
                                        onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartUpdatePro';" />
                            </div>
                        </div>

                        <!--                    <input type="text" class="input" value="asdasd2" name="did" placeholder="ID" required>
                    <input type="text" class="input" value="asdasd3" name="id" placeholder="ID" required> -->
                    </div>



                </form>

            </body>




            </html>