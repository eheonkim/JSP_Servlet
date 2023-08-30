<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 동일한 이름으로 4가지 영역에 속성을 저장한다.  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - remove</title>
</head>
<body>
	<h4>출력하기</h4>
	<ul>
	<!-- 
		동일한 이름으로 저장했으므르ㅗ 영역명을 지정하지 않은 상태라면 가장 좁은
		page영역의 속성값이 출력된다.
	 -->
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeBar : ${ sessionScope.scopVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScop.scopVar }</li>
		<li>applicationscope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
	
	<h4>session 영역에서 삭제하기</h4>
	<!-- 영역을 지정한 상태에서 속성을 삭제한다. 이때는 session에서만 삭제된다. -->
	<c:remove var="scopeVar" scope="session" />
	<ul>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
	</ul>
	
	<h4>scope 지정 없이 삭제하기</h4>
	<!-- 영역 지정없이 삭제하면 동일한 이름의 모든 속성이 한꺼번에 삭제되므로 주의해야 한다 -->
	<c:remove var="scopeVar" />
	<ul>
		<li>scopeVar : ${scopeVar }</li>
		<li>requestScope.scopeBar : ${ sessionScope.scopVar }</li>
		<li>applicationscope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
</body>
</html>