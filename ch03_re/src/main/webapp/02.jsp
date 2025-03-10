<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>Request Method</h1>
	프로토콜 : <%=request.getProtocol() %><p/>
	서버의 이름 : <%=request.getServerName() %>
	
	<% String protocol = request.getProtocol(); %>
	<%=protocol %>
	
	<%="프로토콜 : " + request.getProtocol() %>
</body>
</html>