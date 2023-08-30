<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<%
		BbsDAO bbs = new BbsDAO();
	%>
	<div class="container">
		<div class="row">
			<form method="post" name="search" action="searchbbs.jsp">
				<div class="alert alert-info">
					<strong>오늘은 <%=bbs.getDate().substring(0,4) + "년 "
						+ bbs.getDate().substring(5, 7) + "월 " + bbs.getDate().substring(8, 10) + "일"%> 입니다. </strong>
						오늘을 공유해주세요 💜	</div>
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<table class="active table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #2e8b57; text-align: center;">번호</th>
						<th style="background-color: #2e8b57; text-align: center;">제목</th>
						<th style="background-color: #2e8b57; text-align: center;">작성자</th>
						<th style="background-color: #2e8b57; text-align: center;">작성일</th>
						<th style="background-color: #2e8b57; text-align: center;">조회수</th>
						<th style="background-color: #2e8b57; text-align: center;">추천수👍</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<%--현재 게시글에 대한 정보 --%>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						<td><%=list.get(i).getBbsCount()%></td>
						<td><%=list.get(i).getLikeCount()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class=container style="text-align: center">
				<%
					if (pageNumber != 1) {//이전페이지로
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>">◀ 이전</a>
				<%
					}
				%>
				<%
					int n = (int) (bbsDAO.getCount() / 10 + 1);
					for (int i = 1; i <= n; i++) {
				%>
				<a href="bbs.jsp?pageNumber=<%=i%>">|<%=i%>|
				</a>
				<%
					}
				%>
				<%
					if (bbsDAO.nextPage(pageNumber + 1)) {//다음페이지가 존재하는ㄱ ㅏ
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>">다음 ▶</a>
				<%
					}
				%>
				<a href="write.jsp" class="btn btn-success pull-right">글쓰기</a>
			</div>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>