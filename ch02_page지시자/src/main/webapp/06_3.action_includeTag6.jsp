<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sName = request.getParameter("siteName");
	String sTel = request.getParameter("siteTel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	include ActionTeg의 파일입니다<br>
	<%=sName %><br>
	<%=sTel %>
</body>
</html>