<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>데이터베이스 연결(connect_db.jsp)</title>
<meta charset="UTF-8">
</head>

<body>
	<%
	// JDBC 드라이버 로딩(loading JDBC driver)
	String driverClass = "com.mysql.jdbc.Driver";

	try {
		Class.forName(driverClass);
		out.println("JDBC Driver loading 성공!<Br>");
	} catch (ClassNotFoundException err) {
		out.println("JDBC Driver loading 실패!!...WEB-INF/lib 폴더 확인<Br>");
	}

	// Mysql DB 서버 연결(connect server)
	// "jdbc:mysql://server_IP:3306/datbase_name/dbname
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root"; // DB 사용자 아이디
	String pw = "1111"; // DB 사용자 패스워드

	// 연결된 디비를 붙잡고 있는 객체
	Connection conn = null;
	// 연결된 디비를 겨냥해서 select, insert, delete 같은 sql문을 동작시켜주게 하는 애임.
	PreparedStatement ps = null;
	// select한 결과를 반환.
	ResultSet rs = null;
	// sql문을 매개변수로 담아서 저장.
	String sql = null;
	int hb, year;
	String name, dept, addr;

	try {
		conn = DriverManager.getConnection(url, id, pw);
		/* out.println("MysqlDB 서버 연결 성공!<Br>");  */

		sql = "select * from student";
		ps = conn.prepareStatement(sql);
		// student 테이블에 변화를 가하면(insert, update, delete) executeUpdate로 실행, 
		// 단순히 select만 할때는 executeQuery() 실행.
		rs = ps.executeQuery();

		while (rs.next()) {
			// rs.getInt("테이블에 있는 필드명");
			hb = rs.getInt("hakbun");
			name = rs.getString("name");
			year = rs.getInt("year");
			dept = rs.getString("dept");
			addr = rs.getString("addr");
			
	%>
	학번:<%=hb %> 이름:<%=name %> 학년:<%=year %> 학과:<%=dept %> 주소:<%=addr %> <br>
	<%
		}

	} catch (SQLException sqlerr) {
		out.println("MysqlDB 서버 연결 실패!!<Br>");
		out.println(sqlerr.getMessage() + "<Br>");
	}
	%>


</body>
</html>