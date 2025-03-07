<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String blood = request.getParameter("bloodType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O형</title>
</head>
<body>
	<h3>
		당신의 이름은 <%=name %>이고 <br>
		혈액형은 <%=blood %>형 입니다 <br>
		성격은 눈치좋은 성격
	</h3>
</body>
</html>