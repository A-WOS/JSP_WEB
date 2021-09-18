<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 삭제</title>
</head>
<body>
	
	<%
	String send_id = request.getParameter("send_id");
	%>
	<%@ include file = "../config/db_config.jsp" %>
	<% 
	try {
		String sql = "delete from student where hakbun=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, send_id);
		pstmt.executeUpdate();
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch (Exception conerr) {}
		if (conn != null) try {	conn.close();	} catch (Exception conerr) {}
	}
	
	response.sendRedirect("./std_sel_db.jsp");
%>

</body>
</html>