<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제 확인</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/category/categoryDeletePro" name="f" method="post">
		<input type="hidden" name="cnum" value="${category.cnum}">
		<table class="w3-table-all">
			<caption>게시글 삭제 화면</caption>
			
			<tr>
				<td colspan="2"><input type="submit" value="게시글 삭제"></td>
			</tr>
		</table>

	</form>
</body>
</html>