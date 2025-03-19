<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script src="resources/js/slide.js"></script>

</head>
<body>
	<header>
		<div class="logo">
			<img src="resources/img/logo.png" alt="로고">
		</div>
		<nav>
			<ul class="nav">
				<li><a href="">소개</a></li>
				<li><a href="vote/voteList.jsp">투표 프로그램</a></li>
			<c:choose>	
			<c:when test="${empty idKey}">
				<li><a href="member/login.jsp">로그인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="member/logout.jsp">로그아웃</a></li>
			</c:otherwise>
				
			<%-- <% if(id == null) { %>
				<li><a href="member/login.jsp">로그인</a></li>
			<% } else { %>
				<li><a href="member/logout.jsp">로그아웃</a></li>
			<% } %> --%>
			</c:choose>
			</ul>
		</nav>
		<div>
			<c:if test="${ !empty idKey}">
				<p>[ ${idKey}님 로그인 상태 ]</p>
			</c:if>
		</div>
	</header>
	<article id="content">
        <section id="imgslide">
              <div>
                <img src="resources/img/slide1.jpg" alt="여행사진1">
                <img src="resources/img/slide2.jpg" alt="여행사진2"> 
                <img src="resources/img/slide3.jpg" alt="여행사진3">
                <img src="resources/img/slide1.jpg" alt="여행사진1">
              </div>
        </section>
	</article>
</body>
</html>