<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="ch08_member.MemberDao" />
<%
	String id = request.getParameter("id");
	boolean result = mDao.checkId(id);
	
	if(result) {
		out.print(id + "는 이미 사용중인 아이디 입니다");
	} else {
		out.print(id + "는 사용 가능 합니다");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="" onclick="self.close()">닫기</a>
</body>
</html>