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
		String name = request.getParameter("name1");
		String color = request.getParameter("color");
		if(color.equals("etc")){
			color = "green";
		}
		
		String koColor = "";
		
		switch (color){
		case "blue" :
			koColor = "파란색";
			break;
		case "red" :
			koColor = "빨간색";
			break;
		case "brown" :
			koColor = "갈색";
			break;
		default :
			koColor = "기타";
		} 
		

		
	%>
	
	<b><%=name %></b>님이 좋아하는 색상은 <b><%= koColor %></b> 입니다.
</body>
</html>