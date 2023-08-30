<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
     <!--  
	 액션 태그를 통해 공동링크로 사용할 페이지를 인클루드하여 해당 문서에 포함시킨다.
 	-->
	<jsp:include page="../Common/Link.jsp"/>
	<h2>로그인 페이지</h2>
	<!--  
		상항연산자를 통해 request 영역에 저장된 속성값이 있는 경우에삼 에러메세ㅈ리ㅡㄹ
		화면에 출력한다. 해당속성값은 로그인 처리페이지에서 회원버ㄴ
	 -->
	<span style="color: red; font-size: 1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null?
				"" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	/*
		세션영영에 UserId라는 속성값이 없는 경우, 즉 로그인 처리가 되지ㅇ 않은 상테에서는 
		로그인 폼과 검증을 ㅊ위한 JS 웹브라우저에 출력한다.
	*/
	if (session.getAttribute("UserId") == null) { // 로그인 상태 확인
	%>
	<script>
	function valdateForm(form) {
		/*
			<form>태그 하위의 각 input 태그에 입력값이 있는지 확인하여 만약 빈값이라면 경고창 , 포커스 이동, 
				폼값전송 취소 처리를 한다.
		*/
		if (!form.user_id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (form.user_pw.value == ""){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
	</script>
	<!--  
		폼값 전송을 위한<form>태그로 전송할 URL 전송방식, 폼의 이름 submit
		이벤트 리스너로 구성한다. 특히 폼값 검증을 위한  validateForm() 함수
		호출시 <form>태그의 DOM을 인수로 전달한
	 -->
	<form action="LoginProcess.jsp" meThod="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id"/><br/>
		패스워드 : <input type="password" name= "user_pw"/><br/>
		<input type="submit" value="로그인하기"/>
	</form>
	<%
	} else {
	%>
		<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
		<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>