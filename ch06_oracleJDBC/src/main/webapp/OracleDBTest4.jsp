<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
		st = con.createStatement();
		rs = st.executeQuery("select * from location");
%>
	<table border="1">
		<tr>
			<th>지역코드</th>
			<th>국가코드</th>
			<th>지역명</th>
		</tr>
<%
		
		while(rs.next()) {
			String localCode = rs.getString(1);
			String nationalCode = rs.getString(2);
			String localName = rs.getString(3);
%>
	<tr>
		<td><%=localCode %></td>
		<td><%=nationalCode %></td>
		<td><%=localName %></td>
	</tr>
<%
		}
%>
	</table>
<%
	} catch(Exception e) {
		
	} finally {
		if(st != null) {
			st.close();
		}
		if(rs != null) {
			rs.close();
		}
		if(con != null) {
			con.close();
		}
	}
%>
</body>
</html>