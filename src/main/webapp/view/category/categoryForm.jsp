<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <script>
	function win_upload() {
		
		var op = "width=500, height=150, left=50, top=150";
		open("${pageContext.request.contextPath }/product/pictureimgForm","",op);
		//사진을 불러온다.
	}
</script> -->
</head>
<body>
<form class="w3-container" action="${pageContext.request.contextPath }/product/productPro" name="f" method="post">
<input type="hidden" name="picture">
<table class="w3-table-all">
<caption>상품 등록</caption>
	<tr>
	<td rowspan="4" valign="bottom" width="120px">
	<img src="" width="100" height="120" id="cpicture"><br><font size="1"><a class="w3-button w3-green" href="javascript:win_upload()">사진등록</a></font>
	</td>
	
	<td>상품번호</td>
	<td><input type="number" name= "cnum"></td>	
	</tr>
	
	<tr>
	<td>상품이름</td>
	<td><input type="text" name= "cname"></td>	
	</tr>
	
	<tr>
	<td>상품내용</td>
	<td><input type="text" name= "ctext"></td>	
	</tr>
	
	<tr>
	<td>상품가격</td>
	<td><input type="number" name= "cprice"></td>	
	</tr>
	
	<tr>
	<td>상품수량</td>
	<td><input type="number" name= "cqty"></td>	
	</tr>
	
	<tr>
	<td>상품분류</td>
	<td><input type="number" name= "cmenu"></td>	
	</tr>
	
	
	<tr>
	<td colspan="3"><input type="submit" value="상품 등록">
	</td>	
	</tr>

</table>
</form>
</body>
</html>