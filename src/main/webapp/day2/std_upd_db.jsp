<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
// 전송 한글 데이터 처리
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>학생 테이블(student) 학생 정보 수정(std_upd_db.jsp)</title>
<meta charset="UTF-8">
</head>

<body>
	<%@ include file = "../config/db_config.jsp" %>
	<%
	try {
		
		String hakbun = request.getParameter("hakbun");
		System.out.println(hakbun);
		String name = request.getParameter("name");
		String year = request.getParameter("year");
	
		String dept = request.getParameter("dept");
		String addr = request.getParameter("addr");
		
		String sql = "update student set name=?, year=?, dept=?, addr=? where hakbun=?";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, year);
		pstmt.setString(3, dept);
		pstmt.setString(4, addr);
		pstmt.setString(5, hakbun);

		System.out.println(pstmt);
		out.println("학생 테이블(student) 튜플 수정 성공!<Br>");

		pstmt.executeUpdate();
		
		
	} catch (SQLException sqlerr) {
		 /* out.println("학생 테이블(student) 튜플 삽입 실패!!<Br>"); */
		 out.println(sqlerr.getMessage() + "<Br>");

	} finally {
		// 데이터베이스 연결 종료(close database)
		if (pstmt != null) try { pstmt.close();	} catch (SQLException sqlerr) {}
		if (conn != null) try {	conn.close(); } catch (Exception conerr) {}
		
	}

	// 지정 페이지(URL)로 강제 이동
	response.sendRedirect("./std_sel_db.jsp");
	/* response.sendRedirect("./std_sel_db.jsp"); */
	%>
</body>
</html>