<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
// DAO 객체 생성을 농해 
BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);
BoardDTO dto = dao.selectView(num);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost() 
{
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if (confirmed)
		{
			var form = document.writeFrm;
			form.method= "post";
			form.action = "DeleteProcess.jsp";
			form.submit();
		}
}
</script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 상세보기(View)</h2>
	<form name="writeFrm">
	<!--  
		게시물 삭제를 위해 hidden타입의 input
	 -->
		<input type="hidden" name="num" value="<%= num %>" />
		
		<table border="1" width="90%">
			<tr>
				<td>번호</td>
				<td><%= dto.getNum() %></td>
				<td>작성자</td>
				<td><%= dto.getName() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%= dto.getPostdate() %></td>
				<td>조회수</td>
				<td><%= dto.getVisitcount() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%= dto.getTitle() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100">
					<%= dto.getContent().replace("\r\n", "<br/>") %></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<%
				/*
					로그인이 된 상태에서, 세션영역에 저장된 아이디가 해당 게시물을
					작성한 아이디와 일치하면 수정, 삭제 버튼을 보이게 처리한다.
					즉, 작성자 본인이 해당 게시물을 조회 했을때만 수정, 삭제 버튼이 
					보이게 처리한다.
				*/
				if (session.getAttribute("UserId") != null
					&& session.getAttribute("UserId").toString().equals(dto.getId())) {
				%>
					<button type="button"
							onclick="location.href='Edit.jsp?num=<%= dto.getNum()  %>';">
						수정하기</button>
					<button type="button" onclick="deletePost();">삭제하기</button>
				<%
				}
				%>
					<button type="button" onclick="location.href='List.jsp';">
						목록 보기
					</button>
		</table>
	</form>
</body>
</html>