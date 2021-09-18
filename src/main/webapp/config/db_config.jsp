
<%
	  // 객체 참조 변수
	  Connection conn = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  // JDBC 드라이버 로딩(loading JDBC driver)
	  String driverClass = "com.mysql.jdbc.Driver";

	  try { Class.forName(driverClass); } catch (ClassNotFoundException err) {}
	    
	  //  Mysql DB 서버와 데이터베이스 연결(connect server & database )
	  // "jdbc:mysql://server_IP:3306/datbase_name
	  String url = "jdbc:mysql://localhost:3306/univ";
	  String id = "root";      // DB 사용자 아이디
	  String pw = "1111";     // DB 사용자 패스워드
	  
	  try { conn = DriverManager.getConnection(url, id, pw); } catch (SQLException sqlerr) { sqlerr.getMessage();}
%>
