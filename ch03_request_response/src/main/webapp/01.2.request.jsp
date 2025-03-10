<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name= request.getParameter("name");
	String gender= request.getParameter("gender");
	String sNum= request.getParameter("studentNum");
	String major= request.getParameter("major");
	String[] hobby = request.getParameterValues("hobby");
	
	if(gender.equals("M")) {
		gender = "남자";
	} else {
		gender = "여자";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%= name %> <p/>
	학번 : <%= sNum %> <p/>
	학과 : <%= major %> <p/>
	성별 : <%= gender %> <p/>
	취미 : 
	<% 
		for(int i=0;i<hobby.length;i++){
			out.print(hobby[i] + ", ");
		}
	
		/* for(String h : hobby) {
			out.print(h + ", ");
		} */
	%>
</body>
</html>