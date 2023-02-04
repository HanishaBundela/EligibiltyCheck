<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="emp" class="com.empeligibility.org.model.Employee"/>
	<jsp:useBean id="empRepo" class="com.empeligibility.org.repository.EmployeeRepository"/>
	<%
	String email = request.getParameter("email");
		emp.setName(request.getParameter("name"));
		emp.setEmail(request.getParameter("email"));
		emp.setPhoneNo(request.getParameter("phoneNo"));
		emp.setAge(Integer.parseInt(request.getParameter("age")));
		emp.setGender(request.getParameter("gender"));
		emp.setQualification(request.getParameter("qualification"));
		emp.setLocation(request.getParameter("location"));
		emp.setJobType(request.getParameter("jobType"));
		emp.setWorkPlace(request.getParameter("workPlace"));
		emp.setWorkExperience(Integer.parseInt(request.getParameter("workExperience")));
		emp.setExSalary(request.getParameter("expSalary"));
		
		String[] skills = request.getParameterValues("softSkills");
		String softSkills = String.join(";", skills);
		emp.setSoftSkills(softSkills);
		String[] tSkills = request.getParameterValues("technicalSkills");
		String technicalSkills = String.join(";", tSkills);
		emp.setTechnicalSkills(technicalSkills);
		System.out.println("reached here!");
		empRepo.saveEmployee(emp);
		 String redirectURL = "index.jsp";
		    response.sendRedirect(redirectURL);

	%>
	<!-- success -->
</body>
</html>
<!-- private String name;
	private String email;
	private int phoneNo;
	private int age;
	private String gender;
	private String qualification;
	private String location;
	private String softSkills;
	private String technicalSkills;
	private String jobType; -->