<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
function win_upload(){
	
	
	 var op = "width=500, height=150, left=50, top=150";
	 open("${pageContext.request.contextPath}/category/pictureimgForm", "",op);

}
</script>


</head>

<body>

<form class="w3-container" action="${pageContext.request.contextPath}/category/menuUpdatePro" name="f"
method="post" onsubmit="return inputCheck(this)"    >
   
   <br> <br> <br> 
    <h3 class="w3-center">제품 등록</h3>
    <br>  <br>  
    
            <div class="w3-center">
            <img src="../cpicture/cpicture"
               width="600" height="400" id="pic"><br> 
               <br>  
               <a	class="w3-button w3-green"		
						href="javascript:win_upload()">사진등록</a></div>
               <br>
         
         
<table class="w3-table w3-bordered"
			style="background-color: #fff; color: #000; width: 700px; margin: auto;">
			<tbody>
<input type="hidden" name="cpicture" value="cpicture">
      
     
         <tr>
       <td>카테고리</td>
              <td>
      
          <select name="category" style="width:220px">
    
    
       <option value="커피" class="w3-center">커피</option>
       <option value="음료" class="w3-center">음료</option>   
    </select>

    
</td></tr>
  
            
            <tr>
            <td>제품이름</td>
            <td><input type="text" name="cname"></td>
         </tr>
         <tr>
            <td>제품코드</td>
            <td><input type="text" name="cnum"></td>
         </tr>
         <tr>
            <td>제품가격</td>
            <td><input type="text" name="cprice">&nbsp;원</td>
         </tr>   
  </tbody>
  </table>
  </form>
 
</body>
</html>