<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="log" class="com.empeligibility.org.model.Login"/>
	<jsp:useBean id="logRepo" class="com.empeligibility.org.repository.LoginRepository"/>
	<%
	log.setEmail(request.getParameter("email"));
	log.setPassword(request.getParameter("pswd"));
	logRepo.saveLogin(log);

	%>
</body>
</html>