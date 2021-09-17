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
	Connection conn = null;
	PreparedStatement pstmt = null;
	Class.forName("com.mysql.jdbc.Driver");
	
	try {
		String url = "jdbc:mysql://localhost:3306/univ";
		String id = "root"; // DB 사용자 아이디
		String pw = "1111"; // DB 사용자 패스워드
		
		conn = DriverManager.getConnection(url, id, pw);
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