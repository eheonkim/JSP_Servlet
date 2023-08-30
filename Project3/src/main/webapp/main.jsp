<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%@ include file="./header.jsp" %>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>오늘의 하루를 공유해주세요✨</h1>
				<p>일상을 공유해주세요☺</p>
				<p><a class="btn btn-primary btn-pull" href="write.jsp" role="button">게시판 가기 📜</a></p>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>