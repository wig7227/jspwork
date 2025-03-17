<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;
	if (!(request.getParameter("num") == null || request.getParameter("num").equals(""))) 
		num = Integer.parseInt(request.getParameter("num"));
	
	int sum = vDao.sumCount(num);	//count합계
	ArrayList<VoteItem> vitem = vDao.getView(num);	// 각 항목의 count
	VoteList vlist = vDao.getOneVote(num);	// q를 가져오기 위해
	
	String q = vlist.getQuestion();
	
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>

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
	div a {text-decoration: none; color:black; cursor:pointer;}
	button {text-align: center;}
	table {border:1px solid;}
</style>

</head>
<body>
<div>
	<table class="table">
		<tr>
			<td colspan="4">
				Q: <%=q %>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				총투표자: <%=sum %>명
			</td>
			<td>
				count
			</td>
		</tr>
		<tr>
			<td>
				번호
			</td>
			<td>
				item
			</td>
			<td>
				그래프
			</td>
			<td>
				득표수
			</td>
		</tr>
		<tr>
			<%
			for(int i=0; i<vitem.size(); i++) {
				VoteItem v = vitem.get(i);
				String[] item = v.getItem();
				
				// rgb값 추출
				int rgbR = r.nextInt(256);	//0~255
				int rgbG = r.nextInt(256);
				int rgbB = r.nextInt(256);
				String rgb = "rgb(" +rgbR+ "," +rgbG+ "," +rgbB+")";
				
				// 각 항목이 몇 %인지
				int ratio = (int)(Math.ceil((v.getCount() / (double)sum) * 100));
				
				
				out.print("<tr>");
				out.print("		<td>" + i+1 +"</td>");
				out.print("		<td>" + item[0] + "</td>");
				out.print("		<td>");
			%>
				<table width="<%=ratio%>" height="15" align="left">
					<tr>
						<td bgcolor="<%=rgb%>" style="border:none"></td>
					</tr>
				</table>
			<%
				out.print("		</td>");
				out.print("		<td>" + v.getCount() + "</td>");
				out.print("</tr>");
			}
			%>
		</tr>
		<tr>
			<td colspan="4"><button onclick=".close">닫기</button></td>
		</tr>
	</table>
</div>
</body>
</html>