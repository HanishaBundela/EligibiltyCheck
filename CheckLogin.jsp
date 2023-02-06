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
	String email = request.getParameter("logEmail");
	log.setEmail(request.getParameter("logEmail"));
	log.setPassword(request.getParameter("logPswd"));
	boolean result = logRepo.getLogin(email,log);
	if(result){
		
		response.sendRedirect("form.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
	
	%>
</body>
</html>
