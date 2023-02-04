<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.empeligibility.org.controller.EvaluateFormulaeController"%>

<%
String strJson = request.getParameter("strJson");

JSONObject jsonObj = (JSONObject) JSONValue.parse(strJson);
System.out.println(jsonObj);
String name = jsonObj.get("name").toString();
String post = jsonObj.get("post").toString();
String elgFormulae = jsonObj.get("elgFormulae").toString();

 EvaluateFormulaeController efc = new EvaluateFormulaeController(name,post);
 String i = efc.evaluate(elgFormulae);
// System.out.println("in check Eligibility: "+i);
 out.print(i);
%>


