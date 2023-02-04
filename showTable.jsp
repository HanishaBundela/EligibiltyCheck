<%@ page import="java.sql.*"%>
<%@page import = "org.json.simple.JSONObject" %>
<%@page language="java" contentType="application/json" %>
<%
String name = request.getParameter("val");
//out.print(name);
if (name == null) {
	out.print("<p>Please enter name!</p>");
} else {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "hanisha613");
		PreparedStatement p = con.prepareStatement("Select jobid , ElgibiblityFormulae from jobName where jobname = ?");
		p.setString(1,name);
		ResultSet r = p.executeQuery();
		r.next();
		int jobid = r.getInt("jobid");
		String defaultElgFormulae = r.getString("ElgibiblityFormulae");
		JSONObject json = new JSONObject();
		json.put("EligibilityFormulae",defaultElgFormulae);
		//out.print(defaultElgFormulae);
	
		PreparedStatement ps = con.prepareStatement("select SrNo,Feild,Operator,Value from jobcriteria where jobId =?");
		ps.setInt(1, jobid);
		ResultSet rs = ps.executeQuery();
        String table = "";
		if (!rs.isBeforeFirst()) {
	out.println("<p>No Record Found!</p>");
		} else {
	table+=("<tr><th>#</th><th>Field</th><th>Operator</th><th>Value</th>");
	while (rs.next()) {
		table+=("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
				+ "</td><td>" + rs.getString(4) + "</td>" );
	}
	json.put("table",table);
	response.setContentType("application/json");
	response.getWriter().write(json.toString());
	//out.println(json.toString());
//	out.print("</table>");
		}   
		con.close();
	} catch (Exception e) {
		out.print(e);
	}
}
%>
