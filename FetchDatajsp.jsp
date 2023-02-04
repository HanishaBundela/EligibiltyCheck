<%@ page import="java.sql.*"%>
<%@page import = "org.json.simple.JSONObject" %>
<%
String s = request.getParameter("val");
if (s == null || s.trim().equals("")) {
	
} else {
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "hanisha613");
		PreparedStatement ps = con.prepareStatement("select * from details where name=?");
		ps.setString(1, s);
		ResultSet rs = ps.executeQuery();
		ResultSetMetaData rsMetaData = rs.getMetaData();
		JSONObject json = new JSONObject();
		int i;
		while (rs.next()) {
				for( i = 1; i <= rsMetaData.getColumnCount();i++){
					json.put(rsMetaData.getColumnName(i),rs.getString(rsMetaData.getColumnName(i)));
					
				}
		}i=1;
	//	out.print(json);
	out.println(json.toString());
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>