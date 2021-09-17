 <% 
  // file = "../common/include/database_connect.inc"

  // JDBC 드라이버 로딩(loading JDBC driver)
  String driverClass = "org.mariadb.jdbc.Driver";

  try {
     Class.forName(driverClass);
  } catch (ClassNotFoundException err) {
     System.out.println("JDBC 드라이버 로딩 오류! " + err.getMessage());
  }
   
  // MariaDB 서버와 데이터베이스 연결(connect server & database )
  String url = "jdbc:mariadb://localhost:3306/univ";
  String id = "root";        // DB 사용자 아이디
  String pw = "admin";     // DB 사용자 패스워드
  
  try {
     conn = DriverManager.getConnection(url, id, pw);
  } catch (SQLException sqlerr) {
     System.out.println("데이터베이스 연결 오류! " + sqlerr.getMessage());
  }
%>