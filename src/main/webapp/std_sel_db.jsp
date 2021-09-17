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
<title>학생 테이블(student) 학생 정보 조회(std_sel_db.jsp)</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="./common/CSS/table_retrieval.css">
<script type="text/javascript">
	function delConfirm(hakbun) {
		if (confirm('진짜로 삭제하시겠습니까?') == true ){
			location.href='./std_del_db.jsp?send_id='+hakbun;
		}else{
			return;
		}
	}
</script>
</head>

<body>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driverClass = "com.mysql.jdbc.Driver";

	try { Class.forName(driverClass); } catch (ClassNotFoundException err) {}

	//  Mysql DB 서버와 데이터베이스 연결(connect server & database )
	// "jdbc:mysql://server_IP:3306/datbase_name
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root"; // DB 사용자 아이디
	String pw = "1111"; // DB 사용자 패스워드

	try {
		conn = DriverManager.getConnection(url, id, pw);
		out.println("데이터베이스 연결 성공!<Br>");

		// SQL 질의어 처리(Perform SQL query(DML))
		// 학생 테이블 검색
		String sql = "select * from student";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	%>
	<form name="student_form_table">
		<table>
			<caption>학생 정보 조회</caption>
			<tr>
				<th>학 번</th>
				<th>이 름</th>
				<th>학 년</th>
				<th>학 과</th>
				<th>주 소</th>
				<th>기 능</th>
			</tr>
			<%
		// 학생 정보 출력 
		while (rs.next()) {
		String hakbun = rs.getString("hakbun");
		String name = rs.getString("name");
		String year = rs.getString("year");
			   year = year + "학년";
		String dept = rs.getString("dept");
		String addr = rs.getString("addr");
	%>
			<tr>
				<td><%=hakbun%></td>
				<td><%=name%></td>
				<td><%=year%></td>
				<td><%=dept%></td>
				<td><%=addr%></td>
				<td style="text-align: center;">
					<input type="button" class="button_ins" onClick="location.href='./std_upd_form.jsp?send_id=<%=hakbun%>'" value="수정">
					<%-- <input type="button" class="button_del" onClick="location.href='./std_del_db.jsp?send_id=<%=hakbun %>'" value="삭제"> --%>
					<input type="button" class="button_del" onClick="delConfirm(<%=hakbun%>)" value="삭제">
				</td>
			</tr>


	<%
		}
		

	} catch (SQLException sqlerr) {
		out.println("학생 정보 조회 실패!!<Br>");
		out.println(sqlerr.getMessage() + "<Br>");

	} finally {
		// 데이터베이스 연결 종료(close database)
		if (rs != null) try { rs.close(); } catch (SQLException sqlerr) {}
		if (pstmt != null) try { pstmt.close();	} catch (Exception conerr) {}
		if (conn != null) try { conn.close(); } catch (Exception conerr) {}
	}
	%>

		</table>
	</form>
	<br>
	<input type="button" class="button_reg" value="학생 정보 등록" style="width:100%; height:60%"  onClick="location.href='./std_ins_form.jsp'"/>
</body>
</html>