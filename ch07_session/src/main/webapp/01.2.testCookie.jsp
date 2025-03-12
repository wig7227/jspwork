<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("mycookie")){
				out.print("Cookie Name : " + cookies[i].getName() + "<p/>");
				out.print("Cookie value : " + cookies[i].getValue() + "<p/><p/>");
			}
		}
	}
%>
</body>
</html>