<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	  if (session.getAttribute("user") == null)
	  {
		  response.setHeader("Refresh", "5;url=index.jsp");
		  out.println("Invalid request! You will be redirected to login page.");
	  }else{
		 String user = (String)session.getAttribute("user");  
		 //pageContext.setAttribute("user", user); 
		 out.println("Welcome " + user + "!");
		 out.println("<a href=\"/jsp-login-logout/logout\">Logout</a>");
	  } 
	%>
	<!-- Welcome ${user} -->
	
</body>
</html>