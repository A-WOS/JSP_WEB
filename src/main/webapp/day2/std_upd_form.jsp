<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>학생 테이블(student) 학생 정보 수정(std_upd_form.jsp)</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="../common/CSS/student_insert.css">
</head>

<body>
	<%
	String send_id = request.getParameter("send_id");
	%>
	<%@ include file = "../config/db_config.jsp" %>
	<% 
	int hakbun = -1;
	String name = null;
	int year = -1;
	String dept = null;
	String addr = null;

	try {
		String sql = "select * from student where hakbun=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, send_id);

		rs = pstmt.executeQuery();
		if (rs.next()) {
			hakbun = rs.getInt("hakbun");
			name = rs.getString("name");
			year = rs.getInt("year");
			dept = rs.getString("dept");
			addr = rs.getString("addr");
		}
	} catch (SQLException sqlerr) {
		out.println("학생 정보 조회 실패!!<Br>");
		out.println(sqlerr.getMessage() + "<Br>");

	} finally {
		// 데이터베이스 연결 종료(close database)
		if (rs != null)	try { rs.close(); } catch (SQLException sqlerr) {}
		if (pstmt != null) try { pstmt.close();	} catch (Exception conerr) {}
		if (conn != null) try {	conn.close(); } catch (Exception conerr) {}
		
	}
	%>

	<form name="student_form" class="center" method="post"
		action="std_upd_db.jsp">
		<table>
			<caption>학생 정보 수정</caption>
			<tr>
				<th>&nbsp; 학 번</th>
				<td><input type="text" name="hakbun" size="10" maxlength="10"
					value="<%=hakbun%>" required readonly></td>
			</tr>
			<tr>
				<th>&nbsp; 이 름</th>
				<td><input type="text" name="name" size="10" maxlength="5"
					value="<%=name%>" required></td>
			</tr>
			<tr>
				<th>&nbsp; 학 년</th>
				
				<td>
					<input type="radio" name="year" value="1"  <% if (year == 1) out.print("checked"); %> required>1학년&nbsp;
					<input type="radio" name="year" value="2"  <% if (year == 2) out.print("checked"); %> required>2학년&nbsp;
					<input type="radio" name="year" value="3"  <% if (year == 3) out.print("checked"); %> required>3학년&nbsp;
					<input type="radio" name="year" value="4"  <% if (year == 4) out.print("checked"); %> required>4학년
				</td>
			</tr>
			<tr>
				<th>&nbsp; 학 과</th>
				<td><input type="text" name="dept" size="10" maxlength="10"
					value="<%=dept%>" required></td>
			</tr>
			<tr>
				<th>&nbsp; 주 소</th>
				<td><input type="text" name="addr" size="40" maxlength="40"
					value="<%=addr%>" required></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="submit" value="수정"> <input type="reset"
					onClick="location.href='./std_sel_db.jsp'" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>