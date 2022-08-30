<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

      <style>
                html,
                body {
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
                    padding-top: 5rem;
                    text-align: center;
                }


                /* ========================================================================================== */
                .section {
                    margin-top: 3rem;
                    margin-bottom: 8rem;
                }

                .section [id*="slide"] {
                    display: none;
                }

                .section input[id*="slide"] {
                    display: none;
                }

                .section .slidewrap {
                    max-width: 1400px;
                    margin: 0 auto;
                }

                .section .slidelist {
                    background-color: #FEFAF9;
                    white-space: nowrap;
                    font-size: 0;
                    overflow: hidden;
                    position: relative;
                }

                .section .slidelist>li {
                    display: inline-block;
                    vertical-align: middle;
                    width: 100%;
                    transition: all .5s;
                }

                .section .slidelist>li>a {
                    display: flex;
                    position: relative;
                    width: 60%;
                    height: 30rem;
                    text-align: center;
                }

                .section .slidelist>li>a img {
                	padding-top:2rem;
                	padding-bottom:2rem;
                    width: 100%;
                    height: 100%;
                    object-fit: contain;
                }

                .section .slidelist label {
                    position: absolute;
                    z-index: 10;
                    top: 50%;
                    transform: translateY(-50%);
                    padding: 50px;
                    cursor: pointer;
                }

                .section .slidelist .textbox {
                    padding-left:10rem;
                    /* top:50%;left:50%;transform:translate(-50%,-50%); */
                    line-height: 1.6;
                    text-align: center;            
                }

                .section .slidelist .textbox h3 {
                    font-size: 36px;
                    color: black;
                    ;
                    transform: translateY(30px);
                    transition: all .5s;
                }

                .section .slidelist .textbox p {
                    font-size: 20px;
                    color: black;
                    /* opacity:0;transform:translateY(30px);transition:all .5s; */
                    text-align: center;
                }

                /* input에 체크되면 슬라이드 효과 */
                .section input[id="slide01"]:checked~.slidewrap .slidelist>li {
                    transform: translateX(0%);
                }

                .section input[id="slide02"]:checked~.slidewrap .slidelist>li {
                    transform: translateX(-100%);
                }

                .section input[id="slide03"]:checked~.slidewrap .slidelist>li {
                    transform: translateX(-200%);
                }

                /* input에 체크되면 텍스트 효과 */
                .section input[id="slide01"]:checked~.slidewrap li:nth-child(1) .textbox h3 {
                    opacity: 1;
                    transform: translateY(0);
                    transition-delay: .2s;
                }

                .section input[id="slide01"]:checked~.slidewrap li:nth-child(1) .textbox p {
                    opacity: 1;
                    transform: translateY(0);
                    transition-delay: .4s;
                }

                .section input[id="slide02"]:checked~.slidewrap li:nth-child(2) .textbox h3 {
                    opacity: 1;
                    transform: translateY(0);
                    transition-delay: .2s;
                }

                .section input[id="slide02"]:checked~.slidewrap li:nth-child(2) .textbox p {
                    opacity: 1;
                    transform: translateY(0);
                    transition-delay: .4s;
                }

                .section input[id="slide03"]:checked~.slidewrap li:nth-child(3) .textbox h3 {
                    opacity: 1;
                    transform: translateY(0);
                    transition-delay: .2s;
                }

                .section input[id="slide03"]:checked~.slidewrap li:nth-child(3) .textbox p {
                    opacity: 1;
                    transform: translateY(0);
                    transition-delay: .4s;
                }


                /* 좌,우 버튼 */
                .slide-control>div {
                    display: none;
                }

                .section .left {
                    left: 30px;
                    background: url('./img/left.png') center center / 100% no-repeat;
                }

                .section .right {
                    right: 30px;
                    background: url('./img/right.png') center center / 100% no-repeat;
                }

                .section input[id="slide01"]:checked~.slidewrap .slide-control>div:nth-child(1) {
                    display: block;
                }

                .section input[id="slide02"]:checked~.slidewrap .slide-control>div:nth-child(2) {
                    display: block;
                }

                .section input[id="slide03"]:checked~.slidewrap .slide-control>div:nth-child(3) {
                    display: block;
                }

                /* 페이징 */
                .slide-pagelist {
                    text-align: center;
                    padding: 20px;
                }

                .slide-pagelist>li {
                    display: inline-block;
                    vertical-align: middle;
                }

                .slide-pagelist>li>label {
                    display: block;
                    padding: 8px 30px;
                    border-radius: 30px;
                    background: #ccc;
                    margin: 20px 10px;
                    cursor: pointer;
                }

                .section input[id="slide01"]:checked~.slidewrap .slide-pagelist>li:nth-child(1)>label {
                    background: #999;
                }

                .section input[id="slide02"]:checked~.slidewrap .slide-pagelist>li:nth-child(2)>label {
                    background: #999;
                }

                .section input[id="slide03"]:checked~.slidewrap .slide-pagelist>li:nth-child(3)>label {
                    background: #999;
                }

                /* 화살표 넘김 이미지 입니다. */
                .section .slide-control {
                    position: absolute;
                    top: 0;
                    left: 0;
                    z-index: 10;
                    width: 100%;
                    height: 100%;
                }

                .section .slide-control label {
                    margin-top: 0;
                    position: absolute;
                    z-index: 1;
                    top: 80%;
                    padding: 50px;
                    cursor: pointer;
                }

                .section .slide-control .left {
                    left: 0px;
                    background: url('./img/left.png') center center / 100% no-repeat;
                }

                .section .slide-control .right {
                    right: 0px;
                    background: url('./img/right.png') center center / 100% no-repeat;
                }

                .section .slide-control [class*="control"] {
                    display: none;
                }

                /* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
                .section [id="slide01"]:checked~.slidewrap .slidelist>li {
                    transform: translateX(0%);
                }

                .section [id="slide02"]:checked~.slidewrap .slidelist>li {
                    transform: translateX(-100%);
                }

                .section [id="slide03"]:checked~.slidewrap .slidelist>li {
                    transform: translateX(-200%);
                }

                /*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
                .section [id="slide01"]:checked~.slidewrap .control01 {
                    display: block;
                }

                .section [id="slide02"]:checked~.slidewrap .control02 {
                    display: block;
                }

                .section [id="slide03"]:checked~.slidewrap .control03 {
                    display: block;
                }

                /* ========================================================================================== */

                .div-center {
                    position: relative;
                    top: 50%;
                }


                table {
                    margin: 0.6rem auto;
                }

                td>img {
                    width: 20%;
                    padding-left: 6rem;
                }

/* 추천 메뉴 사진 위치 조정 left right 로 조정  */
                .slideitem {
                    position: relative;
                    text-align: center;
                    left: 94px;
                    right: 0px;
                }
                
                       /* ------------------------------------------------------- */ 
               h2 {
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
 <h1 >이달의 추천 메뉴</h1>

            <div class="section">
                <input type="radio" name="slide" id="slide01" checked>
                <input type="radio" name="slide" id="slide02">
                <input type="radio" name="slide" id="slide03">
                <div class="slidewrap">
                    <ul class="slidelist">
                        <li class="slideitem">
                             
                                <div style="textbox">
                               
                                <img src="./img/drink1.jpg" width="250px"   alt="${pageContext.request.contextPath}/view/category/categoryDetailForm.jsp">
                              	
                              		
                                	<h1>체드라타(유자)</h1>
                                	<p>지중해의 태양을 받고 자란 이탈리안 유자로 만든 스파클링 음료</p>	
                               		
                                </div>
                            
                        </li>
                        <li class="slideitem">
                            <a>
                                <img src="./img/drink2.jpg">
                            </a>
                        </li>
                        <li class="slideitem">
                            <a>
                                <img src="./img/drink3.jpg">
                            </a>
                        </li>
                        
                        <div class="slide-control">

                            <div class="control01 div-center">
                                <label for="slide03" class="left"></label>
                                <label for="slide02" class="right"></label>
                            </div>
                            <div class="control02 div-center">
                                <label for="slide01" class="left"></label>
                                <label for="slide03" class="right"></label>
                            </div>
                            <div class="control03 div-center">
                                <label for="slide02" class="left"></label>
                                <label for="slide01" class="right"></label>
                            </div>
                        </div>
                    </ul>


                    
                    <!-- 페이징 -->
                    <ul class="slide-pagelist">
                        <li><label for="slide01"></label></li>
                        <li><label for="slide02"></label></li>
                        <li><label for="slide03"></label></li>
                    </ul>
                </div>
            </div>

          
		
		
		
		
		
		
		<h2 class="line">상품 목록</h1>
	<div class="flex-div">
	<!-- 관리자 영역================================================================================= -->
			
			<div class="flex-div"></div>
			
			<c:if test="${boardCount == 0}">
				<p>등록된 게시물이 없습니다.</p>
			</c:if>
			<a class="w3-button w3-right w3-grey" href="${pageContext.request.contextPath }/board/boardForm">게시판 입력</a>
			
			<c:if test="${boardCount > 0}">
			
			<!-- ============================================================================================================ -->
			<c:forEach var="index" begin="1" end="8" >
				<div class="product-container-div" style="width: 25%; margin-top: 3rem; ">


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
			
			<br>
			
			<div class="w3-bar w3-center w3-small">
				<c:if test="${start <= bottomLine}"> <a href="#"  class="w3-button  w3-disabled ">[이전]</a> </c:if>
				<c:if test="${start > bottomLine}">
			  <a href="${pageContext.request.contextPath}/board/boardList?pageNum=${start-bottomLine}"   class="w3-button" >[이전]</a></c:if>
			
			
			<c:forEach  var="p" begin="${start}"  end="${end}">
			  	<a href="${pageContext.request.contextPath}/board/boardList?pageNum=${p}"class="w3-button   <c:if test="${pageInt==p}"> 목록  </c:if>">${p}</a>
			</c:forEach>  
				
			
			<c:if test="${end  >= maxPage}">
			   <a href="#"   class="w3-button    w3-disabled ">[다음]</a></c:if>
			<c:if test="${end  < maxPage}">
			   <a href="${pageContext.request.contextPath}/board/boardList?pageNum=${start+bottomLine}"   
			class="w3-button  ">[다음]</a></c:if>
			
			
			</div>
			</c:if>

			
		</div>	
     	
   <%-- <div class="w3-container">
<h3  class="w3-center">${boardName }:${boardCount}</h3>
<!-- 관리자 영역================================================================================= -->

<c:if test="${boardCount == 0}">
	<p>등록된 게시물이 없습니다.</p>
</c:if>
<a class="w3-button w3-right w3-grey" href="${pageContext.request.contextPath }/board/boardForm">게시판 입력</a>

<c:if test="${boardCount > 0}">

<!-- ============================================================================================================ -->


<table class="w3-table-all" style="color:#000">
 <tbody>
 
  <c:forEach var="b" items="${list}">
  <tr>
  	<c:forEach>
 	<td>
	 	<c:if test="${b.reflevel > 0 }">
	 		<img src="<%=request.getContextPath()%>/view/board/level.gif" width="${5*b.reflevel }px">
	 		<img src="<%=request.getContextPath()%>/view/board/re.gif">
	 	</c:if>
	 	${b.name }
 	</td>
 	</c:forEach>
 	
 	<td><a href="${pageContext.request.contextPath }/board/boardInfo?num=${b.num}">${b.subject }</a></td>
 	<td>${b.content }</td>
 	<td>${b.file1 }</td>
 	<td>${b.regdate }</td>
 	<td>${b.readcnt }</td>
 	</tr>
  </c:forEach>
</tbody></table>
<br>
<div class="w3-bar w3-center w3-small">
	<c:if test="${start <= bottomLine}"> <a href="#"  class="w3-button  w3-disabled ">[이전]</a> </c:if>
	<c:if test="${start > bottomLine}">
  <a href="${pageContext.request.contextPath}/board/boardList?pageNum=${start-bottomLine}"   class="w3-button" >[이전]</a></c:if>


<c:forEach  var="p" begin="${start}"  end="${end}">
  	<a href="${pageContext.request.contextPath}/board/boardList?pageNum=${p}"class="w3-button   <c:if test="${pageInt==p}"> 수정중  </c:if>">${p}</a>
</c:forEach>  
	

<c:if test="${end  >= maxPage}">
   <a href="#"   class="w3-button    w3-disabled ">[다음]</a></c:if>
<c:if test="${end  < maxPage}">
   <a href="${pageContext.request.contextPath}/board/boardList?pageNum=${start+bottomLine}"   
class="w3-button  ">[다음]</a></c:if>


</div>
</c:if>

</div>   	 --%>
   
    
    
</body>
</html>