<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = (String) session.getAttribute("email");
String status = "processing";
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update cart set status=? where email=? and status='bill'");
	ps.setString(1, status);
	ps.setString(2, email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
} catch (Exception e) {
	System.out.println(e);
}

%>