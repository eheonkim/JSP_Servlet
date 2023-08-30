<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - forward</title>
</head>
<body>
	<h3>sendRedirect를 통한 페이지 이동</h3>
	
	 <%
	 	//response.sendRedirect("ForwardSub.jsp");
	 %>
	 
	 <!-- 
	 	포워드 된 페이지에서는 request영역이 공유된다. 주소표시줄에는 최초 요청한
	 	페이지이ㅢ 경로가 보여지지만, 사용자는 포워드 된 페이지에 내용을 보게된다.
	 	즉, 하나의 요청을 2개의 페이지가 공유하는 개념이다.
	  -->
	<h2>액션 태그를 이용한 포워딩</h2>
	<jsp:forward page="/07ActionTag/ForwardSub.jsp"/>

	<%
	/*
		액션 태그를 사용하면 JSP코드보다 훨씬 간결하게 코드를 표현할수 있다.
	*/
	//request.getRequestDispatcher("Forwardsub.jsp").forward(request, response);
	%>
</body>
</html>