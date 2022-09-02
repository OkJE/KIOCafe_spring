<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script>
 
        </script>
    </head>

    <body>

            <br> <br> <br>
            <h3 class="w3-center">제품 정보</h3>
            <br> <br>

            <div class="w3-center" style="margin-bottom: 40px;">
                <img src="${pageContext.request.contextPath}/view/category/img/${category.cpicture}" width="600" height="400" id="pic"><br>
                <br>
				<a href="${pageContext.request.contextPath}/cart/cartList"
                                class="w3-bar-item w3-button w3-hide-small" style="border:solid black 1px;">장바구니</a>
                                             <input type="submit" value="삭제"
                        onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartDelete';" />
            </div>

            <table class="w3-center"
                style="background-color: #fff; color: #000; width: 700px; margin: auto;">
                <tbody>
                

                    <!--   <tr>
                        <td>카테고리</td>
                        <td>
                            <select name="cmenu" style="width:220px">
                                <option value="1" class="w3-center">커피</option>
                                <option value="2" class="w3-center">음료</option>
                            </select>


                        </td>
                    </tr>
 -->
                    <!--                     <tr>
                        <td>상품코드</td>
                        <td><input type="text" name="cnum"></td>
                    </tr> -->
                    <tr>
                        <td>상품코드</td>
                        <td>
                            <p>${category.cnum}</p>
                        </td>
                    </tr>
                    <tr>
                        <td>상품이름</td>
                        <td>
                            <p>${category.cname}</p>
                        </td>
                    </tr>
                    <tr>
                        <td>글내용</td>
                        <td>
                            <p>${category.ctext} </p>
                        </td>
                    </tr>
				</tbody>

            </table>
           


    </body>

    </html>