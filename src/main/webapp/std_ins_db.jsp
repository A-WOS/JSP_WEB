<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<% // 전송 한글 데이터 처리
   request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>학생 테이블(student) 학생 정보 저장(std_ins_db.jsp)</title>
<meta charset="UTF-8">
</head>

<body>
 <%
  // 객체 참조 변수
  Connection conn = null;
  PreparedStatement pstmt = null;
 
  // JDBC 드라이버 로딩(loading JDBC driver)
  String driverClass = "com.mysql.jdbc.Driver";

  try { Class.forName(driverClass); } catch (ClassNotFoundException err) {}
    
  //  Mysql DB 서버와 데이터베이스 연결(connect server & database )
  // "jdbc:mysql://server_IP:3306/datbase_name
  String url = "jdbc:mysql://localhost:3306/univ";
  String id = "root";      // DB 사용자 아이디
  String pw = "1111";     // DB 사용자 패스워드

  try {
     conn = DriverManager.getConnection(url, id, pw);
     /* out.println("데이터베이스 연결 성공!<Br>"); */
    
     // SQL 질의어 처리(Perform SQL query(DML))
     // 전송 데이터 변수 할당
     String hakbun= request.getParameter("hakbun");
     String name = request.getParameter("name");
     String year= request.getParameter("year");
     String dept = request.getParameter("dept");
     String addr= request.getParameter("addr");

     // 학생 테이블(student) 튜플 삽입
     String sql = "insert into student values(?,?,?,?,?)";
     pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, hakbun);
        pstmt.setString(2, name);
        pstmt.setString(3, year);
        pstmt.setString(4, dept);
        pstmt.setString(5, addr);    
     pstmt.executeUpdate();  
     /* out.println("학생 테이블(student) 튜플 삽입 성공!<Br>"); */
      
  } catch (SQLException sqlerr) {
	 /* out.println("학생 테이블(student) 튜플 삽입 실패!!<Br>"); */
	 out.println(sqlerr.getMessage() + "<Br>");
      
  } finally {
     // 데이터베이스 연결 종료(close database)
     if (pstmt != null) try { pstmt.close(); } catch (SQLException sqlerr) {}
     if (conn != null) try { conn.close(); } catch (Exception conerr) {}
  }
  
  // 지정 페이지(URL)로 강제 이동
   response.sendRedirect("./std_ins_form.jsp");  
 %>

  <a href="./std_ins_form.jsp">[ 학생 정보 입력 폼 ]</a>
</body>
</html>