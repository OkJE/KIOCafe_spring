<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="w3-table-all"> 
		<tr>
			<td>상품코드</td>
			<td>${category.cnum}</td>
			
		
		<tr>
			<td>img</td>
			<td colspan="3">
				<img src="<%=request.getContextPath()%>/view/category/img/${category.cpicture}">
					</td>
					</tr><tr>
					<td>상품이름</td>
					<td colspan="3">${category.cname}</td>
					</tr><tr>
					<td>글내용</td>
					<td colspan="3">${category.ctext}</td>
					</tr><tr>
	
					<td colspan="4" class="w3-center">
					
					<input type="button" value="글수정"
					onclick="document.location.href='<%=request.getContextPath()%>/category/categoryUpdateForm?cnum=${category.cnum}'"/>
					<input type="button" value="글삭제"
					onclick="document.location.href='<%=request.getContextPath()%>/category/categoryDeleteForm?cnum=${category.cnum}'"/>
					<input type="button" value="게시판리스트"
					onclick="document.location.href='<%=request.getContextPath()%>/category/categoryList'"/></td>
					</tr>
					
				
</table>
</body>
</html>