<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 외부파일의 경로를 변수로 저장한다.
String outerPath1 = "./inc/OuterPage1.jsp";
String outerPath2 = "./inc/OuterPage2.jsp";

//page영역과 request영역에 각 속성을 저장한다.
pageContext.setAttribute("pAttr", "동명왕");
request.setAttribute("rAttr", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어와 액션 태그 동장 방식 비교</title>
</head>
<body>
	<h2>지시어와 액션 태그 동장 방식 비교</h2>
	<h3>지시어로 페이지 포함하기</h3>
	<!-- 
		지시어를 이요한 인클루드의 경우 페이지의 경로는 문자열 형태로만 
		기술할 수 있다.
	 -->
	<%@ include file="./inc/OuterPage1.jsp"%>
	<%--@ include file="<%=outerPath10uterPage1%>" --%>
	<!-- 
		지시어를 통한 인클루드는 포함한 파일의 소스를 그대로 현재문서에
		 포함시킨 후 컴파일을 진행한다. 따라서 하나의 페이지라 생각하면 된다. 
		 그러므로 newVar1은 정상적으로 출력된다.
	 -->
	<p>외부 파일에 선언한 변수 : </p>
	<!-- 
		액션 테그를 이횽한 인클루드는 문자열과 표현식 두가지 모두 사용할 수 있다.
	 -->
	<h3>액션 태그로 페이지 포함하기</h3>
	<jsp:include page="./inc/OuterPage2.jsp"/>
	<jsp:include page="<%=outerPath2 %>" />
	<!-- 
		액션 태그를 통한 이 인클루는 포함한 파일을 먼저 실행(컴파일)한 후 
		실행된 결과를 해당 문서에 포함시킨다. 따라서 외부파일에서 선언한 변수를
		현재페이지에서 사용할 수 없게 된다.
	 -->
	<p>외부 파일에 선언한 변수 : <%--=newVar2 --%></p>
	<!-- 
		include 지시어와 액션테그의 차이점
			지시어
				- jsp소스를 그대로 포함시킨 후 페이지를 컴파일한다
				- 따라서 같은 페이지를 의미한다.
				-  page영역과  request영역이 공유된다
				- jsp코드와 변수 등이 포함된 경우 사용한다.
			액션태그
				-jsp 소스를 먼저 실행한 후 실행된 결과를 포함시킨다.
				- 따라서 기존페이지에서 선언한 변수는 포함시킨 페이지에서
					사용할 수없다.
				- 서로 다른 페이지를 의미하므로 pager영역은 공유되지 않는다.
				- 하지만 forword처럼 하나의 요청을 공유하므로 request영역은 공유된다
				- HTML태그만 있거나 단독으로 실행가능한 JSP코드만 있을 대 사용한ㄷㅏ.
		 -->
</body>
</html>