<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script>
            function win_upload() {

                var op = "width=500, height=150, left=50, top=150";
                open("${pageContext.request.contextPath}/category/pictureimgForm", "", op);

            }
        </script>
    </head>

    <body>
  
        <form class="w3-container" action="${pageContext.request.contextPath}/category/menuUpdatePro" name="f"
            method="post" onsubmit="return inputCheck(this)">
            <input type="hidden" name="cpicture">

            <br> <br> <br>
            <h3 class="w3-center">제품 정보</h3>
            <br> <br>

            <div class="w3-center" style="margin-bottom: 40px;">
                <img src="./img/1.png" width="600" height="400" id="pic"><br>
                <br>
                <a class="w3-button w3-green" href="javascript:win_upload()">사진등록</a>
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
                            <p>10023</p>
                        </td>
                    </tr>
                    <tr>
                        <td>상품이름</td>
                        <td>
                            <p>홍삼 식빵</p>
                        </td>
                    </tr>
                    <tr>
                        <td>글내용</td>
                        <td>
                            <p>씁쓸한 맛 </p>
                        </td>
                    </tr>
				</tbody>

            </table>
            
            <div class="w3-center">

                <!--  <a href="${pageContext.request.contextPath}/view/category/mainpage.jsp">-->
                <input type="submit" class="w3-button w3-light-grey" value="제품 등록">
            </div>
            </tbody>
        </form>

    </body>

    </html>