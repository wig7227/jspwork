<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09_vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="ch09_vote.VoteDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style type="text/css">
	* {margin: 0 auto;}
	div {width: 800px;}
	h2 {text-align:center;}
	h4 {text-align:center;}
	.m30 {margin-top : 30px; margin-bottom : 15px;}
	div a {text-decoration: none; color:black; cursor:pointer; /* text-decoration-line:none; */ }
	button {text-align: center;}
</style>
</head>
<body>
	<div>
		<h2 class="m30">투표 프로그램</h2>
		<hr>
		
		<h4 class="m30">설 문 폼</h4>
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		<h4 class="m30">설문 리스트</h4>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료</th>
			</tr>
		<%
			ArrayList<VoteList> alist = vDao.getList();
			for(int i=0; i<alist.size(); i++) {
				VoteList vlist = alist.get(i);
				int num = vlist.getNum();
				String question = vlist.getQuestion();
				String sdate = vlist.getSdate();
				String edate = vlist.getEdate();
				out.print("<tr>");
				out.print("		<td>" + (alist.size()-i) +"</td>");
				out.print("		<td><a href='voteList.jsp?num="+ num +"'>" + question +"</a></td>");
				out.print("		<td>" + sdate + " ~ " + edate +"</td>");
				out.print("</tr>");
			}
		%>
		
			<tr>
				<td colspan="3"><button type="button"  onclick="location.href='voteInsert.jsp'">설문 작성하기</button></td>
			</tr>
		</table>
		<hr>
	</div>
</body>
</html>